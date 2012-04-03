//
//  Task.h
//  mppParser
//
//  Created by George on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProjectFile;
@class ResourceAssignment;

@interface Task : NSObject
{
    
}

// Gets or Sets the task Id.
@property (nonatomic) int ID;

// Gets or Sets the task UniqueId.
@property (nonatomic) int UniqueID;

@property (nonatomic) Boolean Milestone;

@property (strong, nonatomic) NSDate *ActualFinish;

@property (strong, nonatomic) NSDate *Finish;

@property (strong, nonatomic) NSDate *ActualStart;

@property (strong, nonatomic) NSDate *Start;

-(id)init:(ProjectFile *) file: (Task *) parent;

-(int)getID;

-(Task *)getParentTask;

-(void)removeChildTask:(Task *) child;

-(NSMutableArray *)getChildTasks;

-(void)removeResourceAssignment:(ResourceAssignment *)assignment;

-(void)clearChildTasks;

-(Boolean)getNull;

-(int)getOutlineLevel;

-(NSString *)getWBS;

-(void)generateWBS:(Task *)parent;

-(void)generateOutlineNumber:(Task *)parent;

-(void)addChildTask:(Task *)child with:(int)childOutlineLevel;

-(void)addChildTask:(Task *)child;


@end
