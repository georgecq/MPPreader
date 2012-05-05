//
//  Group.m
//  MppViewer
//
//  Created by Julián! on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Group.h"
#import "GroupClause.h"

@implementation Group

/**
 * Constructor.
 * 
 * @param id group identifier
 * @param name group name
 * @param showSummaryTasks show summary tasks
 */

-(id)init:(NSNumber *)identifier withName:(NSString *)name showSummaryTasks:(Boolean)showSummaryTasks
{
    self = [super init];
    if (self) 
    {
        _clauses = [[NSMutableArray alloc]init];
        _id = identifier;
        _name = name;
        _showSummarytasks = showSummaryTasks;
    }
    return self;
}

/**
 * Retrieve group ID.
 * 
 * @return group ID
 */

-(NSNumber *)getID
{
    return _id;
}

/**
 * Retrieve the group name.
 * 
 * @return group name
 */

-(NSString *)getName
{
    return _name;
}

/**
 * Retrieve the show summary tasks flag.
 * 
 * @return boolean flag
 */

-(Boolean)getShowSummaryTasks
{
    return _showSummarytasks;
}

/**
 * Adds a clause to the group definition.
 * 
 * @param clause group clause
 */

-(void)addGroupClase:(GroupClause *)clause
{
    [_clauses addObject:clause];
}

/**
 * Retrieve a list of all clauses which define this group.
 * 
 * @return list of clauses
 */

-(NSMutableArray *)getGroupClauses
{
    return _clauses;
}

/**
 * {@inheritDoc}
 */

-(NSString *)toString
{
    NSString *result = [NSString stringWithFormat:@"[Group id=%d name=%@ showSummaryTasks=%d [Clauses=", [_id intValue], _name, _showSummarytasks];
    
    for (GroupClause *gc in _clauses) 
    {
        result = [result stringByAppendingFormat:@"   %@", [gc toString]];
    }
    
    result = [result stringByAppendingFormat:@" ]]"];
    return result;
}

@end
