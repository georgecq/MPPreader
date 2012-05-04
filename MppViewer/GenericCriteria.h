//
//  GenericCriteria.h
//  MppViewer
//
//  Created by Julián! on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProjectFile;
@class TestOperator;

@protocol FieldType;
@protocol FieldContainer;

@interface GenericCriteria : NSObject
{
    ProjectFile *_projectFile;
    TestOperator *_operator;
    NSMutableArray *_definedRightValues;
    NSMutableArray *_workingRightValues;
    Boolean _symbolicValues;
    NSMutableArray *_criteriaList;
}

@property (strong, nonatomic) id<FieldType> leftValue;

-(id)init:(ProjectFile *)projectFile;

-(TestOperator *)getOperator;

-(void)setOperator:(TestOperator *)operat;

-(void)setRightValue:(int)index withObject:(NSObject *)value;

-(NSObject *)getValue:(int)index;

-(Boolean)evaluate:(id<FieldContainer>)container withPromptValues:(NSMutableDictionary *)promptValues;

-(Boolean)evaluateLogicalOperator:(id<FieldContainer>)container withPromptValues:(NSMutableDictionary *)promptValues;

-(NSMutableArray *)processSymbolicValues:(NSMutableArray *)oldValues withContainer:(id<FieldContainer>)container withPromptValues:(NSMutableDictionary *)promptValues;

-(NSMutableArray *)getCriteriaList;

-(void)addCriteria:(GenericCriteria *)criteria;

-(NSString *)toString;

@end
