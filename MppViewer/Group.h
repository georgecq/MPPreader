//
//  Group.h
//  MppViewer
//
//  Created by Julián! on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GroupClause;

@interface Group : NSObject
{
    NSNumber *_id;
    NSString *_name;
    Boolean _showSummarytasks;
    NSMutableArray *_clauses;
}

-(id)init:(NSNumber *)identifier withName:(NSString *)name showSummaryTasks:(Boolean)showSummaryTasks;

-(NSNumber *)getID;

-(NSString *)getName;

-(Boolean)getShowSummaryTasks;

-(void)addGroupClase:(GroupClause *)clause;

-(NSMutableArray *)getGroupClauses;

-(NSString *)toString;

@end
