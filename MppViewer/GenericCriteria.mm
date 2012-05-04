//
//  GenericCriteria.m
//  MppViewer
//
//  Created by Julián! on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GenericCriteria.h"

#import "ProjectFile.h"
#import "MPPDuration.h"
#import "TimeUnit.h"
#import "FieldContainer.h"
#import "DateUtility.h"
#import "TestOperator.h"
#import "GenericCriteriaPrompt.h"

@implementation GenericCriteria

@synthesize leftValue;


-(id)init:(ProjectFile *)projectFile
{
    self = [super init];
    if(self)
    {
        _definedRightValues = [[NSMutableArray alloc]initWithCapacity:2];
        _workingRightValues = [[NSMutableArray alloc]initWithCapacity:2];
        _criteriaList = [[NSMutableArray alloc]init];
        
        _projectFile = projectFile;
    }
    return self;
}

-(TestOperator *)getOperator
{
    return _operator;
}

-(void)setOperator:(TestOperator *)operat
{
    _operator = operat;
}

-(void)setRightValue:(int)index withObject:(NSObject *)value
{
    [_definedRightValues replaceObjectAtIndex:index withObject:value];
    if ([value conformsToProtocol:@protocol(FieldType)]) 
    {
        _symbolicValues = true;
    }
    else
    {
        if ([value isKindOfClass:[MPPDuration class]]) 
        {
            if ([(MPPDuration *)value getUnits] != [TimeUnit HOURS]) 
            {
                value = [(MPPDuration *)value convertUnits:[TimeUnit HOURS] withDefaults:[_projectFile getProjectHeader]];
            }
        }
    }
    
    [_workingRightValues replaceObjectAtIndex:index withObject:value];
}

-(NSObject *)getValue:(int)index
{
    return [_definedRightValues objectAtIndex:index];
}

-(Boolean)evaluate:(id<FieldContainer>)container withPromptValues:(NSMutableDictionary *)promptValues
{
    id<FieldType> field = [self leftValue];
    NSObject *lhs;
    
    if(field == nil)
    {
        lhs = nil;
    }
    else
    {
        lhs = [container getCurrentValue:field];
        if([field getDataType] == [DataType DATE])
        {
            if(lhs != nil)
            {
                lhs = [DateUtility getDayStartDate:(NSDate *)lhs];
            } 
        } 
        else if([field getDataType] == [DataType DURATION])
        {
            if(lhs != nil)
            {
                MPPDuration *dur = (MPPDuration *)lhs;
                lhs = [dur convertUnits:[TimeUnit HOURS] withDefaults:[_projectFile getProjectHeader]];
            }
            else
            {
                lhs = [MPPDuration getInstance:0 withIntType:[TimeUnit HOURS]];
            }
        } 
        else if([field getDataType] == [DataType STRING])
        {
            lhs = lhs == nil ? @"" : lhs;
        }
    }
    
    NSMutableArray *rhs;
    if(_symbolicValues == true)
    {
        rhs = [self processSymbolicValues:_workingRightValues withContainer:container withPromptValues:promptValues];
    }
    else
    {
        rhs = _workingRightValues;
    }
    
    Boolean result;
    if (_operator == [TestOperator AND] || _operator == [TestOperator OR]) 
    {
        result = [self evaluateLogicalOperator:container withPromptValues:promptValues];
    }
    else
    {
        result = [_operator evaluate:lhs otherObject:rhs];
    }
    
    return result;
}

-(Boolean)evaluateLogicalOperator:(id<FieldContainer>)container withPromptValues:(NSMutableDictionary *)promptValues
{
    Boolean result = false;
    if([_criteriaList count] == 0)
    {
        result = true;
    }
    else
    {
        for (GenericCriteria *criteria in _criteriaList) 
        {
            result = [criteria evaluate:container withPromptValues:promptValues];
            if((_operator == [TestOperator AND] && !result) || (_operator == [TestOperator OR] && result))
            {
                break;
            }
        }
    }
    
    return result;
}

-(NSMutableArray *)processSymbolicValues:(NSMutableArray *)oldValues withContainer:(id<FieldContainer>)container withPromptValues:(NSMutableDictionary *)promptValues
{
    NSMutableArray *newValues = [[NSMutableArray alloc]initWithCapacity:2];
    
    for (int loop = 0; loop < [oldValues count]; loop++) 
    {
        NSObject *value = [oldValues objectAtIndex:loop];
        if(value == nil)
        {
            continue;
        }
        
        if ([value conformsToProtocol:@protocol(FieldType)]) 
        {
            id<FieldType> type = (id<FieldType>)value;
            value = [container getCachedValue:type];
            
            if ([type getDataType] == [DataType DATE]) 
            {
                if(value != nil)
                {
                    value = [DateUtility getDayStartDate:(NSDate *)value];
                }
            }
            else if ([type getDataType] == [DataType DURATION])
            {
                if(value != nil && [(MPPDuration *)value getUnits] != [TimeUnit HOURS])
                {
                    value = [(MPPDuration *)value convertUnits:[TimeUnit HOURS] withDefaults:[_projectFile getProjectHeader]];
                }
                else
                {
                    value = [MPPDuration getInstance:0 withIntType:[TimeUnit HOURS]];
                }
            }
            else if ([type getDataType] == [DataType STRING])
            {
                value =  value == nil ? @"" : value;
            }
        }
        else 
        {
            if ([value isKindOfClass:[GenericCriteriaPrompt class]] && promptValues != nil)
            {
                GenericCriteriaPrompt *prompt = (GenericCriteriaPrompt *)value;
                value = [promptValues objectForKey:prompt];
            }
        }
        
        [newValues replaceObjectAtIndex:loop withObject:value];
    }
    
    return newValues;
}

-(NSMutableArray *)getCriteriaList
{
    return _criteriaList;
}

-(void)addCriteria:(GenericCriteria *)criteria
{
    [_criteriaList addObject:criteria];
}

-(NSString *)toString
{
    #warning incomplete
    return nil;
}

@end
