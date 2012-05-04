//
//  Filter.m
//  MppViewer
//
//  Created by Julián! on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Filter.h"
#import "GenericCriteria.h"
#import "FieldContainer.h"
#import "Task.h"

@implementation Filter

@synthesize ID;
@synthesize name;
@synthesize showRelatedSummaryRows;
@synthesize criteria;
@synthesize isTaskFilter;
@synthesize isResourceFilter;
@synthesize prompts;

-(Boolean)evaluate:(id<FieldContainer>)container withPromptValues:(NSMutableDictionary *)promptValues
{
    Boolean result = true;
    if([self criteria] != nil)
    {
        result = [[self criteria] evaluate:container withPromptValues:promptValues];
        if(!result && [self showRelatedSummaryRows] && [container isKindOfClass:[Task class]])
        {
            for (Task *task in [(Task *)container getChildTasks]) 
            {
                if([self evaluate:task withPromptValues:promptValues])
                {
                    result = true;
                    break;
                }
            }
        }
    }
    
    return result;
}

-(NSString *)toString
{
    NSString *result = [NSString stringWithFormat:@"[Filter id=%d name=%@ showRelatedSummaryRows=%d"];
    
    if([self criteria] != nil)
    {
        result = [result stringByAppendingFormat:@" criteria=%@", [criteria toString]];
    }
    result = [result stringByAppendingFormat:@"]"];
    return result;
}

@end
