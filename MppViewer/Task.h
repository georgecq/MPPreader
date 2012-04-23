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
@class RecurringTask;
@class Resource;
@class Relation;
@class RelationType;
@class MPPViewerDuration;
@class ConstraintType;

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

-(void)generateWBS:(Task *)parent;

-(void)generateOutlineNumber:(Task *)parent;

-(void)setNotes:(NSString *)notes;

-(Task *)addTask;

-(void)addChildTask:(Task *)child with:(int)childOutlineLevel;

-(void)addChildTask:(Task *)child;

-(void)removeChildTask:(Task *) child;

-(void)clearChildTasks;

-(RecurringTask *)addRecurringTask;

-(RecurringTask *)getRecurringTask;

-(ResourceAssignment *)addResourceAssignment:(Resource *)resource;

-(void)addResourceAssignmentWithAssignment:(ResourceAssignment *)assignment;

-(NSMutableArray *)getResourceAssignments;

-(void)removeResourceAssignment:(ResourceAssignment *)assignment;

-(Relation *)addPredecessor:(Task *)targetTask withType:(RelationType *)type withDuration:(MPPViewerDuration *)lag;

-(void)setPercentageComplete:(NSNumber *)val;

-(void)setPercentageWorkComplete:(NSNumber *)val;

-(void)setActualCost:(NSNumber *)val;

-(void)setActualDuration:(MPPViewerDuration *)val;

-(void)setActualFinish:(NSDate *)val;

-(void)setActualStart:(NSDate *)val;

-(void)setActualWork:(MPPViewerDuration *)val;

-(void)setBaselineCost:(NSNumber *)val;

-(void)setBaselineDuration:(MPPViewerDuration *)val;

-(void)setBaselineFinish:(NSDate *)val;

-(void)setBaselineStart:(NSDate *)val;

-(void)setBaselineWork:(MPPViewerDuration *)val;

-(void)setBCWP:(NSNumber *)val;

-(void)setBCWS:(NSNumber *)val;

-(void)setConfirmed:(Boolean) val;

-(void)setConstraintDate:(NSDate *)val;

-(void)setConstraintType:(ConstraintType *)val;


#warning Incomplete






















-(int)getID;

-(Task *)getParentTask;

-(NSMutableArray *)getChildTasks;

-(void)clearChildTasks;

-(Boolean)getNull;

-(int)getOutlineLevel;

-(NSString *)getWBS;

-(NSString *)toString;

@end
