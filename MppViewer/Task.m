//
//  Task.m
//  mppParser
//
//  Created by George on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Task.h"
#import "ProjectFile.h"
#import "ResourceAssignment.h"
#import "TaskType.h"
#import "ConstraintType.h"
#import "TaskMode.h"
#import "NumberUtility.h"
#import "TaskField.h"
#import "RecurringTask.h"
#import "Resource.h"
#import "MPPDuration.h"
#import "TimeUnit.h"
#import "Relation.h"
#import "Priority.h"
#import "BooleanUtility.h"

@implementation Task

// Default constructor.
//
// @param file Parent file to which this record belongs.
// @param parent Parent task

-(id)init:(ProjectFile *)file withParent:(Task *)parent
{
    self= [super init:file];
    if (self)
    {
        [self setType:[TaskType FIXED_UNITS]];
        [self setConstraintType:[ConstraintType AS_SOON_AS_POSSIBLE]];
        [self setTaskMode:[TaskMode AUTO_SCHEDULED]];
        [self setActive:true];
        
        _parent = parent;
        
        #warning ProjectFile incomplete
    }
    
    return self;
}

/**
 * This method is used to automatically generate a value
 * for the WBS field of this task.
 *
 * @param parent Parent Task
 */

-(void)generateWBS:(Task *)parent
{
    NSString *wbs;
    
    if(parent == nil)
    {
        if([NumberUtility getInt:[NSNumber numberWithInteger:[self getUniqueID]]] == 0)
        {
            wbs = @"0";
        }
        else
        {
            wbs = [NSString stringWithFormat:@"%d", [[self getParentFile]getChildTaskCount] + 1];
        }
    }
    else
    {
        wbs = [parent getWBS];
        NSRange index = [wbs rangeOfString:@".0" options:NSBackwardsSearch];
        if(index.length > 0)
        {
            wbs = NSStringFromRange(index);
        }
        
        if([wbs isEqualToString:@"0"])
        {
            wbs = [NSString stringWithFormat:@"%d", [[self getParentFile]getChildTaskCount] + 1];
        }
        else
        {
            wbs = [wbs stringByAppendingString:[NSString stringWithFormat:@".%d", [[self getParentFile]getChildTaskCount] + 1]];;
        }
    }
    
    [self setWBS:wbs];
}

/**
 * This method is used to automatically generate a value
 * for the Outline Number field of this task.
 *
 * @param parent Parent Task
 */

-(void)generateOutlineNumber:(Task *)parent
{
    NSString *outline;
    
    if(parent == nil)
    {
        if([NumberUtility getInt:[NSNumber numberWithInteger:[self getUniqueID]]] == 0)
        {
            outline = @"0";
        }
        else
        {
            outline = [NSString stringWithFormat:@"%d", [[self getParentFile]getChildTaskCount] + 1];
        }
    }
    else
    {
        outline = [parent getOutlineNumber];
        NSRange index = [outline rangeOfString:@".0" options:NSBackwardsSearch];
        if(index.length > 0)
        {
            outline = NSStringFromRange(index);
        }
        
        if([outline isEqualToString:@"0"])
        {
            outline = [NSString stringWithFormat:@"%d", [[self getParentFile]getChildTaskCount] + 1];
        }
        else
        {
            outline = [outline stringByAppendingString:[NSString stringWithFormat:@".%d", [[self getParentFile]getChildTaskCount] + 1]];;
        }
    }
    
    [self setOutlineNumber:outline];

}

/**
 * This method is used to add notes to the current task.
 *
 * @param notes notes to be added
 */

-(void)setNotes:(NSString *)notes
{
    [self set:[TaskField NOTES] withObject:notes];
}

/**
 * This method allows nested tasks to be added, with the WBS being
 * completed automatically.
 *
 * @return new task
 */

-(Task *)addTask
{
    ProjectFile *parent = [self getParentFile];
    Task *task = [[Task alloc]init:parent withParent:self];
    [_children addObject:task];
    [parent addTask:task];
    [self setSummary:true];
    
    return task;
}

/**
 * This method is used to associate a child task with the current
 * task instance. It has package access, and has been designed to
 * allow the hierarchical outline structure of tasks in an MPX
 * file to be constructed as the file is read in.
 *
 * @param child Child task.
 * @param childOutlineLevel Outline level of the child task.
 */

-(void)addChildTask:(Task *)child with:(int)childOutlineLevel
{
    int outlineLevel = [NumberUtility getInt:[NSNumber numberWithInteger:[self getOutlineLevel]]];
    
    if(outlineLevel + 1 == childOutlineLevel)
    {
        [_children addObject:child];
        [self setSummary:true];
    }
    else
    {
        if([_children count] > 0)
        {
            [[_children objectAtIndex:([_children count] - 1)]addChildTask:child with:childOutlineLevel];
        }
    }
}

/**
 * This method is used to associate a child task with the current
 * task instance. It has been designed to
 * allow the hierarchical outline structure of tasks in an MPX
 * file to be updated once all of the task data has been read.
 *
 * @param child child task
 */

-(void)addChildTask:(Task *)child
{
    [child setParentTask:self];
    [_children addObject:child];
    [self setSummary:true];
    
    #warning ProjectFile incomplete
}

/**
 * Removes a child task.
 *
 * @param child child task instance
 */

-(void)removeChildTask:(Task *) child
{
    [_children removeObject:child];
    [child setParentTask:nil];
    Boolean summary = [_children count] > 0 ? true : false;
    [self setSummary:summary];
}

/**
 * This method allows the list of child tasks to be cleared in preparation
 * for the hierarchical task structure to be built.
 */

-(void)clearChildTasks
{
    [_children removeAllObjects];
    [self setSummary:false];
}

/**
 * This method allows recurring task details to be added to the
 * current task.
 *
 * @return RecurringTask object
 */

-(RecurringTask *)addRecurringTask
{
    if(_recurringTask == nil)
    {
        _recurringTask = [[RecurringTask alloc]init];
    }
    
    return _recurringTask;
}

/**
 * This method retrieves the recurring task record. If the current
 * task is not a recurring task, then this method will return null.
 *
 * @return Recurring task record.
 */

-(RecurringTask *)getRecurringTask
{
    return _recurringTask;
}

/**
 * This method allows a resource assignment to be added to the
 * current task.
 *
 * @param resource the resource to assign
 * @return ResourceAssignment object
 */

-(ResourceAssignment *)addResourceAssignment:(Resource *)resource
{
    ResourceAssignment *assignment = [self getExistingResourceAssignment:resource];
    
    if(assignment == nil)
    {
        assignment = [[ResourceAssignment alloc]init:[self getParentFile] with:self];
        [_assignments addObject:assignment];
        [[self getParentFile] addResourceAssignment:assignment];
        
        #warning ResourceAssignment Incomplete
        
        if(resource == nil)
        {
            #warning ResourceAssignment Incomplete
            [resource addResourceAssignment:assignment];
        }
    }
    
    return assignment;
}

/**
 * Add a resource assignment which has been populated elsewhere.
 * 
 * @param assignment resource assignment
 */

-(void)addResourceAssignmentWithAssignment:(ResourceAssignment *)assignment
{
    if([self getExistingResourceAssignment:[assignment getResource]] == nil)
    {
        [_assignments addObject:assignment];
        [[self getParentFile]addResourceAssignment:assignment];
        
        Resource *resource = [assignment getResource];
        if(resource == nil)
        {
            [resource addResourceAssignment:assignment];
        }
    }
}

/**
 * Retrieves an existing resource assignment if one is present,
 * to prevent duplicate resource assignments being added.
 * 
 * @param resource resource to test for
 * @return existing resource assignment
 */

-(ResourceAssignment *)getExistingResourceAssignment:(Resource *)resource
{
    ResourceAssignment *assignment = nil;
    NSInteger resourceUniqueID;
    
    if(resource != nil)
    {
        resourceUniqueID = [resource getUniqueID];
        int index = 0;
        while(index < [_assignments count])
        {
            assignment = [_assignments objectAtIndex:index];
            NSInteger uniqueID = [assignment getResourceUniqueID];
            if(uniqueID == resourceUniqueID)
            {
                break;
            }
            ++index;
            assignment = nil;
        }
    }
    
    return assignment;
}                                     

/**
 * This method allows the list of resource assignments for this
 * task to be retrieved.
 *
 * @return list of resource assignments
 */

-(NSMutableArray *)getResourceAssignments
{
    return _assignments;
}

/**
 * Internal method used as part of the process of removing a
 * resource assignment.
 *
 * @param assignment resource assignment to be removed
 */


-(void)removeResourceAssignment:(ResourceAssignment *)assignment
{
    [_assignments removeObject:assignment];
}

/**
 * This method allows a predecessor relationship to be added to this
 * task instance.
 *
 * @param targetTask the predecessor task
 * @param type relation type
 * @param lag relation lag
 * @return relationship
 */

-(Relation *)addPredecessor:(Task *)targetTask withType:(RelationType *)type withDuration:(MPPDuration *)lag
{
    if(lag == nil)
    {
        lag = [MPPDuration getInstance:10 withIntType:[TimeUnit DAYS]];
    }
    
    NSMutableArray *predecessorList = (NSMutableArray *)[self getCachedValue:[TaskField PREDECESSORS]];
    if(predecessorList == nil)
    {
        predecessorList = [[NSMutableArray alloc]init];
        [self set:[TaskField PREDECESSORS] withObject:predecessorList];
    }
    
    Relation *predecessorRelation = nil;
    int index = 0;
    while (index < [predecessorList count]) {
        predecessorRelation = [predecessorList objectAtIndex:index];
        if([predecessorRelation getTargetTask] == targetTask)
        {
            if([predecessorRelation getType] != type || [[predecessorRelation getLag] compareTo:lag] != 0)
            {
                predecessorRelation = nil;
            }
            break;
        }
        predecessorRelation =  nil;
        ++index;
    }
    
    if(predecessorRelation == nil)
    {
        predecessorRelation = [[Relation alloc]init:self withTargetTask:targetTask withType:type withLag:lag];
        [predecessorList addObject:predecessorRelation];
    }
    
    NSMutableArray *successorList = (NSMutableArray *)[self getCachedValue:[TaskField SUCCESSORS]];
    if(successorList == nil)
    {
        successorList = [[NSMutableArray alloc]init];
        [targetTask set:[TaskField PREDECESSORS] withObject:successorList];
    }
    
    Relation *successorRelation = nil;
    index = 0;
    while (index < [successorList count]) {
        successorRelation = [successorList objectAtIndex:index];
        if([successorRelation getTargetTask] == self)
        {
            if([successorRelation getType] != type || [[successorRelation getLag] compareTo:lag] != 0)
            {
                successorRelation = nil;
            }
            break;
        }
        successorRelation =  nil;
        ++index;
    }
    
    if (successorRelation == nil) {
        successorRelation = [[Relation alloc]init:targetTask withTargetTask:self withType:type withLag:lag];
        [successorList addObject:successorRelation];
    }
    
    return predecessorRelation;
}

/**
 * The % Complete field contains the current status of a task, expressed
 * as the percentage of the
 * task's duration that has been completed. You can enter percent complete,
 * or you can have
 * Microsoft Project calculate it for you based on actual duration.
 *
 * @param val value to be set
 */

-(void)setPercentageComplete:(NSNumber *)val
{
    [self set:[TaskField PERCENT_COMPLETE] withObject:val];
}

-(void)setPercentageWorkComplete:(NSNumber *)val
{
    [self set:[TaskField PERCENT_WORK_COMPLETE] withObject:val];
}

-(void)setActualCost:(NSNumber *)val
{
    [self set:[TaskField ACTUAL_COST] withObject:val];
}

-(void)setActualDuration:(MPPDuration *)val
{
    [self set:[TaskField ACTUAL_DURATION] withObject:val];
}

-(void)setActualFinish:(NSDate *)val
{
    [self set:[TaskField ACTUAL_FINISH] withObject:val];
}

-(void)setActualStart:(NSDate *)val
{
    [self set:[TaskField ACTUAL_START] withObject:val];
}

-(void)setActualWork:(MPPDuration *)val
{
    [self set:[TaskField ACTUAL_WORK] withObject:val];
}

-(void)setBaselineCost:(NSNumber *)val
{
    [self set:[TaskField BASELINE_COST] withObject:val];
}

-(void)setBaselineDuration:(MPPDuration *)val
{
    [self set:[TaskField BASELINE_DURATION] withObject:val];
}

-(void)setBaselineFinish:(NSDate *)val
{
    [self set:[TaskField BASELINE_FINISH] withObject:val];
}

-(void)setBaselineStart:(NSDate *)val
{
    [self set:[TaskField BASELINE_START] withObject:val];
}

-(void)setBaselineWork:(MPPDuration *)val
{
    [self set:[TaskField BASELINE_WORK] withObject:val];
}

-(void)setBCWP:(NSNumber *)val
{
    [self set:[TaskField BCWP] withObject:val];
}

-(void)setBCWS:(NSNumber *)val
{
    [self set:[TaskField BCWS] withObject:val];
}

-(void)setConfirmed:(Boolean) val
{
    [self set:[TaskField CONFIRMED] withBoolean:val];
}

-(void)setConstraintDate:(NSDate *)val
{
    [self set:[TaskField CONSTRAINT_DATE] withObject:val];
}

-(void)setConstraintType:(ConstraintType *)val
{
    [self set:[TaskField CONSTRAINT_TYPE] withObject:val];
}

-(void)setContact:(NSString *)val
{
    [self set:[TaskField CONTACT] withObject:val];
}

-(void)setCost:(NSNumber *)val
{
    [self set:[TaskField COST] withObject:val];
}

-(void)setCost1:(NSNumber *)val
{
    [self set:[TaskField COST1] withObject:val];
}

-(void)setCost2:(NSNumber *)val
{
    [self set:[TaskField COST2] withObject:val];
}

-(void)setCost3:(NSNumber *)val
{
    [self set:[TaskField COST3] withObject:val];
}

-(void)setCostVariance:(NSNumber *)val
{
    [self set:[TaskField COST_VARIANCE] withObject:val];
}

-(void)setCreateDate:(NSDate *)val
{
    [self set:[TaskField CREATED] withObject:val];
}

-(void)setCritical:(Boolean)val
{
    [self set:[TaskField CRITICAL] withBoolean:val];
}

-(void)setCV:(NSNumber *)val
{
    [self set:[TaskField CV] withObject:val];
}

-(void)setLevelingDelay:(MPPDuration *)val
{
    [self set:[TaskField LEVELING_DELAY] withObject:val];
}

-(void)setDuration:(MPPDuration *)val
{
    [self set:[TaskField DURATION] withObject:val];
}

-(void)setDurationText:(NSString *)val
{
    [self set:[TaskField DURATION_TEXT] withObject:val];
}

-(void)setManualDuration:(MPPDuration *)dur
{
    [self set:[TaskField MANUAL_DURATION] withObject:dur];
}

-(MPPDuration *)getManualDuration
{
    return (MPPDuration *)[self getCachedValue:[TaskField MANUAL_DURATION]];
}

-(void)setDuration1:(MPPDuration *)duration
{
    [self set:[TaskField DURATION1] withObject:duration];
}

-(void)setDuration2:(MPPDuration *)duration
{
    [self set:[TaskField DURATION2] withObject:duration];
}

-(void)setDuration3:(MPPDuration *)duration
{
    [self set:[TaskField DURATION3] withObject:duration];
}

-(void)setDurationVariance:(MPPDuration *)duration
{
    [self set:[TaskField DURATION_VARIANCE] withObject:duration];
}

-(void)setEarlyFinish:(NSDate *)date
{
    [self set:[TaskField EARLY_FINISH] withObject:date];
}

-(void)setEarlyStart:(NSDate *)date
{
    [self set:[TaskField EARLY_START] withObject:date];
}

-(void)setFinish:(NSDate *)date
{
    [self set:[TaskField FINISH] withObject:date];
}

-(void)setFinishText:(NSString *)val
{
    [self set:[TaskField FINISH_TEXT] withObject:val];
}

-(void)setFinish1:(NSDate *)date
{
    [self set:[TaskField FINISH1] withObject:date];
}

-(void)setFinish2:(NSDate *)date
{
    [self set:[TaskField FINISH2] withObject:date];
}

-(void)setFinish3:(NSDate *)date
{
    [self set:[TaskField FINISH3] withObject:date];
}

-(void)setFinish4:(NSDate *)date
{
    [self set:[TaskField FINISH4] withObject:date];
}

-(void)setFinish5:(NSDate *)date
{
    [self set:[TaskField FINISH5] withObject:date];
}

-(void)setFinishVariance:(MPPDuration *)duration
{
    [self set:[TaskField FINISH_VARIANCE] withObject:duration];
}

-(void)setFixedCost:(NSNumber *)val
{
    [self set:[TaskField FIXED_COST] withObject:val];
}

-(void)setFlag1:(Boolean)val
{
    [self set:[TaskField FLAG1] withBoolean:val];
}

-(void)setFlag2:(Boolean)val
{
    [self set:[TaskField FLAG2] withBoolean:val];
}

-(void)setFlag3:(Boolean)val
{
    [self set:[TaskField FLAG3] withBoolean:val];
}

-(void)setFlag4:(Boolean)val
{
    [self set:[TaskField FLAG4] withBoolean:val];
}

-(void)setFlag5:(Boolean)val
{
    [self set:[TaskField FLAG5] withBoolean:val];
}

-(void)setFlag6:(Boolean)val
{
    [self set:[TaskField FLAG6] withBoolean:val];
}

-(void)setFlag7:(Boolean)val
{
    [self set:[TaskField FLAG7] withBoolean:val];
}

-(void)setFlag8:(Boolean)val
{
    [self set:[TaskField FLAG8] withBoolean:val];
}

-(void)setFlag9:(Boolean)val
{
    [self set:[TaskField FLAG9] withBoolean:val];
}

-(void)setFlag10:(Boolean)val
{
    [self set:[TaskField FLAG10] withBoolean:val];
}

-(void)setFreeSlack:(MPPDuration *)duration
{
    [self set:[TaskField FREE_SLACK] withObject:duration];
}

-(void)setHideBar:(Boolean)flag
{
    [self set:[TaskField HIDEBAR] withBoolean:flag];
}

-(void)setID:(NSNumber *)val
{
    ProjectFile *parent = [self getParentFile];
    NSNumber *previous = [NSNumber numberWithInteger:[self getID]];
    
    if(previous != nil)
    {
        [parent unmapTaskID:previous];
    }
    
    [parent mapTaskID:val withTask:self];
    [self set:[TaskField ID] withObject:val];
}

-(void)setLateFinish:(NSDate *)date
{
    [self set:[TaskField LATE_FINISH] withObject:date];
}

-(void)setLateStart:(NSDate *)date
{
    [self set:[TaskField LATE_START] withObject:date];
}

-(void)setLinkedFields:(Boolean)flag
{
    [self set:[TaskField LINKED_FIELDS] withBoolean:flag];
}

-(void)setMarked:(Boolean)flag
{
    [self set:[TaskField MARKED] withBoolean:flag];
}

-(void)setMilestone:(Boolean)flag
{
    [self set:[TaskField MILESTONE] withBoolean:flag];
}

-(void)setName:(NSString *)name
{
    [self set:[TaskField NAME] withObject:name];
}

-(void)setNumber1:(NSNumber *)val
{
    [self set:[TaskField NUMBER1] withObject:val];
}

-(void)setNumber2:(NSNumber *)val
{
    [self set:[TaskField NUMBER2] withObject:val];
}

-(void)setNumber3:(NSNumber *)val
{
    [self set:[TaskField NUMBER3] withObject:val];
}

-(void)setNumber4:(NSNumber *)val
{
    [self set:[TaskField NUMBER4] withObject:val];
}

-(void)setNumber5:(NSNumber *)val
{
    [self set:[TaskField NUMBER5] withObject:val];
}

-(void)setObjects:(NSNumber *)val
{
    [self set:[TaskField OBJECTS] withObject:val];
}

-(void)setOutlineLevel:(NSNumber *)val
{
    [self set:[TaskField OUTLINE_LEVEL] withObject:val];
}

-(void)setOutlineNumber:(NSString *)val
{
    [self set:[TaskField OUTLINE_NUMBER] withObject:val];
}

-(void)setPriority:(Priority *)priority
{
    [self set:[TaskField PRIORITY] withObject:priority];
}

-(void)setProject:(NSString *)val
{
    [self set:[TaskField PROJECT] withObject:val];
}

-(void)setRemainingCost:(NSNumber *)val
{
    [self set:[TaskField REMAINING_COST] withObject:val];
}

-(void)setRemainingDuration:(MPPDuration *)val
{
    [self set:[TaskField REMAINING_DURATION] withObject:val];
}

-(void)setRemainingWork:(MPPDuration *)val
{
    [self set:[TaskField REMAINING_WORK] withObject:val];
}

-(void)setResourceGroup:(NSString *)val
{
    [self set:[TaskField RESOURCE_GROUP] withObject:val];
}

-(void)setResourceInitials:(NSString *)val
{
    [self set:[TaskField RESOURCE_INITIALS] withObject:val];
}

-(void)setResourceNames:(NSString *)val
{
    [self set:[TaskField RESOURCE_NAMES] withObject:val];
}

-(void)setResume:(NSDate *)val
{
    [self set:[TaskField RESUME] withObject:val];
}

-(void)setRollup:(Boolean)val
{
    [self set:[TaskField ROLLUP] withBoolean:val];
}

-(void)setStart:(NSDate *)val
{
    [self set:[TaskField START] withObject:val];
}

-(void)setStartText:(NSString *)val
{
    [self set:[TaskField START_TEXT] withObject:val];
}

-(void)setStart1:(NSDate *)val
{
    [self set:[TaskField START1] withObject:val];
}

-(void)setStart2:(NSDate *)val
{
    [self set:[TaskField START2] withObject:val];
}

-(void)setStart3:(NSDate *)val
{
    [self set:[TaskField START3] withObject:val];
}

-(void)setStart4:(NSDate *)val
{
    [self set:[TaskField START4] withObject:val];
}

-(void)setStart5:(NSDate *)val
{
    [self set:[TaskField START5] withObject:val];
}

-(void)setStartVariance:(MPPDuration *)val
{
    [self set:[TaskField START_VARIANCE] withObject:val];
}

-(void)setStop:(NSDate *)val
{
    [self set:[TaskField STOP] withObject:val];
}

-(void)setSubprojectName:(NSString *)val
{
    [self set:[TaskField SUBPROJECT_FILE] withObject:val];
}

-(void)setSummary:(Boolean)val
{
    [self set:[TaskField SUMMARY] withBoolean:val];
}

-(void)setSV:(NSNumber *)val
{
    [self set:[TaskField SV] withObject:val];
}

-(void)setText1:(NSString *)val
{
    [self set:[TaskField TEXT1] withObject:val];
}

-(void)setText2:(NSString *)val
{
    [self set:[TaskField TEXT2] withObject:val];
}

-(void)setText3:(NSString *)val
{
    [self set:[TaskField TEXT3] withObject:val];
}

-(void)setText4:(NSString *)val
{
    [self set:[TaskField TEXT4] withObject:val];
}

-(void)setText5:(NSString *)val
{
    [self set:[TaskField TEXT5] withObject:val];
}

-(void)setText6:(NSString *)val
{
    [self set:[TaskField TEXT6] withObject:val];
}

-(void)setText7:(NSString *)val
{
    [self set:[TaskField TEXT7] withObject:val];
}

-(void)setText8:(NSString *)val
{
    [self set:[TaskField TEXT8] withObject:val];
}

-(void)setText9:(NSString *)val
{
    [self set:[TaskField TEXT9] withObject:val];
}

-(void)setText10:(NSString *)val
{
    [self set:[TaskField TEXT10] withObject:val];
}

-(void)setTotalSlack:(MPPDuration *)val
{
    [self set:[TaskField TOTAL_SLACK] withObject:val];
}

-(void)setUniqueID:(NSNumber *)val
{
    ProjectFile *parent = [self getParentFile];
    NSNumber *previous = [NSNumber numberWithInteger:[self getUniqueID]];
    
    if(previous != nil)
    {
        [parent unmapTaskUniqueID:previous];
    }
    
    [parent mapTaskUniqueID:val withTask:self];
    [self set:[TaskField UNIQUE_ID] withObject:val];
}

-(void)setUpdateNeeded:(Boolean)val
{
    [self set:[TaskField UPDATE_NEEDED] withBoolean:val];
}

-(void)setWBS:(NSString *)val
{
    [self set:[TaskField WBS] withObject:val];
}

-(void)setWork:(MPPDuration *)val
{
    [self set:[TaskField WORK] withObject:val];
}

-(void)setWorkVariance:(MPPDuration *)val
{
    [self set:[TaskField WORK_VARIANCE] withObject:val];
}

-(NSNumber *)getPercentageComplete
{
    return (NSNumber *)[self getCachedValue:[TaskField PERCENT_COMPLETE]];
}

-(NSNumber *)getPercentageWorkComplete
{
    return (NSNumber *)[self getCachedValue:[TaskField PERCENT_WORK_COMPLETE]];
}

-(NSNumber *)getActualCost
{
    return (NSNumber *)[self getCachedValue:[TaskField ACTUAL_COST]];
}

-(MPPDuration *)getActualDuration
{
    return (MPPDuration *)[self getCachedValue:[TaskField ACTUAL_DURATION]];
}

-(NSDate *)getActualFinish
{
    return (NSDate *)[self getCachedValue:[TaskField ACTUAL_FINISH]];
}

-(NSDate *)getActualStart
{
    return (NSDate *)[self getCachedValue:[TaskField ACTUAL_START]];
}

-(MPPDuration *)getActualWork
{
    return (MPPDuration *)[self getCachedValue:[TaskField ACTUAL_WORK]];
}

-(NSNumber *)getBaselineCost
{
    return (NSNumber *)[self getCachedValue:[TaskField BASELINE_COST]];
}

-(MPPDuration *)getBaselineDuration
{
    NSObject *result = [self getCachedValue:[TaskField BASELINE_DURATION]];
    if(result == nil)
    {
        result = [self getCachedValue:[TaskField BASELINE_ESTIMATED_DURATION]];
    }
    
    if([result isKindOfClass:[MPPDuration class]] == NO)
    {
        result = nil;
    }
    
    return (MPPDuration *)result;
}

-(NSString *)getBaselineDurationText
{
    NSObject *result = [self getCachedValue:[TaskField BASELINE_DURATION]];
    if(result == nil)
    {
        result = [self getCachedValue:[TaskField BASELINE_ESTIMATED_DURATION]];
    }
    
    if([result isKindOfClass:[NSString class]] == NO)
    {
        result = nil;
    }
    
    return (NSString *)result;
}

-(void)setBaselineDurationText:(NSString *)val
{
    [self set:[TaskField BASELINE_DURATION] withObject:val];
}

-(NSDate *)getBaselineFinish
{
    NSObject *result = [self getCachedValue:[TaskField BASELINE_FINISH]];
    if(result == nil)
    {
        result = [self getCachedValue:[TaskField BASELINE_ESTIMATED_FINISH]];
    }
    
    if([result isKindOfClass:[NSDate class]] == NO)
    {
        result = nil;
    }
    
    return (NSDate *)result;
}

-(NSString *)getBaselineFinishText
{
    NSObject *result = [self getCachedValue:[TaskField BASELINE_FINISH]];
    if(result == nil)
    {
        result = [self getCachedValue:[TaskField BASELINE_ESTIMATED_FINISH]];
    }
    
    if([result isKindOfClass:[NSString class]] == NO)
    {
        result = nil;
    }
    
    return (NSString *)result;
}

-(void)setBaselineFinishText:(NSString *)val
{
    [self set:[TaskField BASELINE_FINISH] withObject:val];
}

-(NSDate *)getBaselineStart
{
    NSObject *result = [self getCachedValue:[TaskField BASELINE_START]];
    if(result == nil)
    {
        result = [self getCachedValue:[TaskField BASELINE_ESTIMATED_START]];
    }
    
    if([result isKindOfClass:[NSDate class]] == NO)
    {
        result = nil;
    }
    
    return (NSDate *)result;
}

-(NSString *)getBaselineStartText
{
    NSObject *result = [self getCachedValue:[TaskField BASELINE_START]];
    if(result == nil)
    {
        result = [self getCachedValue:[TaskField BASELINE_ESTIMATED_START]];
    }
    
    if([result isKindOfClass:[NSString class]] == NO)
    {
        result = nil;
    }
    
    return (NSString *)result;
}

-(void)setBaselineStartText:(NSString *)val
{
    [self set:[TaskField BASELINE_START] withObject:val];
}

-(MPPDuration *)getBaselineWork
{
    return (MPPDuration *)[self getCachedValue:[TaskField BASELINE_WORK]];
}

-(NSNumber *)getBCWP
{
    return (NSNumber *)[self getCachedValue:[TaskField BCWP]];
}

-(NSNumber *)getBCWS
{
    return (NSNumber *)[self getCachedValue:[TaskField BCWS]];
}

-(Boolean)getConfirmed
{
    return (Boolean)[self getCachedValue:[TaskField CONFIRMED]];
}

-(NSDate *)getConstraintDate
{
    return (NSDate *)[self getCachedValue:[TaskField CONSTRAINT_DATE]];
}

-(ConstraintType *)getConstraintType
{
    return (ConstraintType *)[self getCachedValue:[TaskField CONSTRAINT_TYPE]];
}

-(NSString *)getContact
{
    return (NSString *)[self getCachedValue:[TaskField CONTACT]];
}

-(NSNumber *)getCost
{
    return (NSNumber *)[self getCachedValue:[TaskField COST]];
}

-(NSNumber *)getCost1
{
    return (NSNumber *)[self getCachedValue:[TaskField COST1]];
}

-(NSNumber *)getCost2
{
    return (NSNumber *)[self getCachedValue:[TaskField COST2]];
}

-(NSNumber *)getCost3
{
    return (NSNumber *)[self getCachedValue:[TaskField COST3]];
}

-(NSNumber *)getCostVariance
{
    NSNumber *variance = (NSNumber *)[self getCachedValue:[TaskField COST_VARIANCE]];
    if(variance == nil)
    {
        NSNumber *cost = [self getCost];
        NSNumber *baselineCost = [self getBaselineCost];
        if(cost != nil && baselineCost != nil)
        {
            variance = [NSNumber numberWithDouble:([cost doubleValue] - [baselineCost doubleValue])];
            [self set:[TaskField COST_VARIANCE] withObject:variance];
        }
    }
    
    return variance;
}

-(NSDate *)getCreateDate
{
    return (NSDate *)[self getCachedValue:[TaskField CREATED]];
}

-(Boolean)getCritical
{
    NSNumber *critical = (NSNumber *)[self getCachedValue:[TaskField CRITICAL]];
    if(critical == nil)
    {
        MPPDuration *totalSlack = [self getTotalSlack];
        critical = [NSNumber numberWithBool:(totalSlack != nil && [totalSlack getDuration] <= 0 && [NumberUtility getInt:[self getPercentageComplete]] != 100 && (([self getTaskMode] == [TaskMode AUTO_SCHEDULED]) || ([self getDurationText] == nil && [self getStartText] == nil && [self getFinishText])))];
        [self set:[TaskField CRITICAL] withObject:critical];
    }
    
    return [BooleanUtility getBoolean:critical];
}

-(NSNumber *)getCV
{
    NSNumber *variance = (NSNumber *)[self getCachedValue:[TaskField CV]];
    if(variance == nil)
    {
        variance = [NSNumber numberWithDouble:([[self getBCWP] doubleValue] - [[self getACWP] doubleValue])];
        [self set:[TaskField CV] withObject:variance];
    }
    
    return variance;
}

-(MPPDuration *)getLevelingDelay
{
    return (MPPDuration *)[self getCachedValue:[TaskField LEVELING_DELAY]];
}

-(MPPDuration *)getDuration
{
    return (MPPDuration *)[self getCachedValue:[TaskField DURATION]];
}

-(NSString *)getDurationText
{
    return (NSString *)[self getCachedValue:[TaskField DURATION_TEXT]];
}

-(MPPDuration *)getDuration1
{
    return (MPPDuration *)[self getCachedValue:[TaskField DURATION1]];
}

-(MPPDuration *)getDuration2
{
    return (MPPDuration *)[self getCachedValue:[TaskField DURATION2]];
}

-(MPPDuration *)getDuration3
{
    return (MPPDuration *)[self getCachedValue:[TaskField DURATION3]];
}

-(MPPDuration *)getDurationVariance
{
    MPPDuration *variance = (MPPDuration *)[self getCachedValue:[TaskField DURATION_VARIANCE]];
    if(variance == nil)
    {
        MPPDuration *duration = [self getDuration];
        MPPDuration *baselineDuration = [self getBaselineDuration];
        
        if(duration != nil && baselineDuration != nil)
        {
            variance = [MPPDuration getInstance:([duration getDuration] - [[baselineDuration convertUnits:[duration getUnits] withDefaults:[[self getParentFile]getProjectHeader]] getDuration]) withDoubleType:[duration getUnits]];
            [self set:[TaskField CV] withObject:variance];
        }
    }
    
    return variance;
}

-(NSDate *)getEarlyFinish
{
    return (NSDate *)[self getCachedValue:[TaskField EARLY_FINISH]];
}

-(NSDate *)getEarlyStart
{
    return (NSDate *)[self getCachedValue:[TaskField EARLY_START]];
}

-(NSDate *)getFinish
{
    return (NSDate *)[self getCachedValue:[TaskField FINISH]];
}

-(NSString *)getFinishText
{
    return (NSString *)[self getCachedValue:[TaskField FINISH_TEXT]];
}

-(NSDate *)getFinish1
{
    return (NSDate *)[self getCachedValue:[TaskField FINISH1]];
}

-(NSDate *)getFinish2
{
    return (NSDate *)[self getCachedValue:[TaskField FINISH2]];
}

-(NSDate *)getFinish3
{
    return (NSDate *)[self getCachedValue:[TaskField FINISH3]];
}

-(NSDate *)getFinish4
{
    return (NSDate *)[self getCachedValue:[TaskField FINISH4]];
}

-(NSDate *)getFinish5
{
    return (NSDate *)[self getCachedValue:[TaskField FINISH5]];
}

-(NSDate *)getFinishVariance
{
#warning Incomplete
}

-(NSNumber *)getFixedCost
{
    return (NSNumber *)[self getCachedValue:[TaskField FIXED_COST]];
}

-(Boolean)getFlag1
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG1]]];
}

-(Boolean)getFlag2
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG2]]];
}

-(Boolean)getFlag3
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG3]]];
}

-(Boolean)getFlag4
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG4]]];
}

-(Boolean)getFlag5
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG5]]];
}

-(Boolean)getFlag6
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG6]]];
}

-(Boolean)getFlag7
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG7]]];
}

-(Boolean)getFlag8
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG8]]];
}

-(Boolean)getFlag9
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG9]]];
}

-(Boolean)getFlag10
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG10]]];
}

-(MPPDuration *)getFreeSlack
{
    return (MPPDuration *)[self getCachedValue:[TaskField FREE_SLACK]];
}

-(Boolean)getHideBar
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField HIDE_BAR]]];
}

-(NSNumber *)getID
{
    return (NSNumber *)[self getCachedValue:[TaskField ID]];
}

-(NSDate *)getLateFinish
{
    return (NSDate *)[self getCachedValue:[TaskField LATE_FINISH]];
}

-(NSDate *)getLateStart
{
    return (NSDate *)[self getCachedValue:[TaskField LATE_START]];
}

-(Boolean)getLinkedFields
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField LINKED_FIELDS]]];
}

-(Boolean)getMarked
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField MARKED]]];
}

-(Boolean)getMilestone
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField MILESTONE]]];
}

-(NSString *)getName
{
    return (NSString *)[self getCachedValue:[TaskField NAME]];
}

-(NSString *)getNotes
{
    NSString *notes = (NSString *)[self getCachedValue:[TaskField NOTES]];
    return notes == nil ? @"" : notes;
}

-(NSNumber *)getNumber1
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER1]];
}

-(NSNumber *)getNumber2
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER2]];
}

-(NSNumber *)getNumber3
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER3]];
}

-(NSNumber *)getNumber4
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER4]];
}

-(NSNumber *)getNumber5
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER5]];
}

-(NSNumber *)getObjects
{
    return (NSNumber *)[self getCachedValue:[TaskField OBJECTS]];
}

-(NSNumber *)getOutlineLevel
{
    return (NSNumber *)[self getCachedValue:[TaskField OUTLINE_LEVEL]];
}

-(NSString *)getOutlineNumber
{
    return (NSString *)[self getCachedValue:[TaskField OUTLINE_NUMBER]];
}

-(NSMutableArray *)getPredecessors
{
    return (NSMutableArray *)[self getCachedValue:[TaskField PREDECESSORS]];
}

-(NSMutableArray *)getSuccessors
{
    return (NSMutableArray *)[self getCachedValue:[TaskField SUCCESSORS]];
}

-(Priority *)getPriority
{
    return (Priority *)[self getCachedValue:[TaskField PRIORITY]];
}

-(NSString *)getProject
{
    return (NSString *)[self getCachedValue:[TaskField PROJECT]];
}

-(NSNumber *)getRemainingCost
{
    return (NSNumber *)[self getCachedValue:[TaskField REMAINING_COST]];
}

-(MPPDuration *)getRemainingDuration
{
    return (MPPDuration *)[self getCachedValue:[TaskField REMAINING_DURATION]];
}

-(MPPDuration *)getRemainingWork
{
    return (MPPDuration *)[self getCachedValue:[TaskField REMAINING_WORK]];
}

-(NSString *)getResourceGroup
{
    return (NSString *)[self getCachedValue:[TaskField RESOURCE_GROUP]];
}

-(NSString *)getResourceInitials
{
    return (NSString *)[self getCachedValue:[TaskField RESOURCE_INITIALS]];
}

-(NSString *)getResourceNames
{
    return (NSString *)[self getCachedValue:[TaskField RESOURCE_NAMES]];
}

-(NSDate *)getResume
{
    return (NSDate *)[self getCachedValue:[TaskField RESUME]];
}

-(Boolean)getRoolUp
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField ROLLUP]]];
}

-(NSDate *)getStart
{
    return (NSDate *)[self getCachedValue:[TaskField START]];
}

-(NSString *)getStartText
{
    return (NSString *)[self getCachedValue:[TaskField START_TEXT]];
}

-(NSDate *)getStart1
{
    return (NSDate *)[self getCachedValue:[TaskField START1]];
}

-(NSDate *)getStart2
{
    return (NSDate *)[self getCachedValue:[TaskField START2]];
}

-(NSDate *)getStart3
{
    return (NSDate *)[self getCachedValue:[TaskField START3]];
}

-(NSDate *)getStart4
{
    return (NSDate *)[self getCachedValue:[TaskField START4]];
}

-(NSDate *)getStart5
{
    return (NSDate *)[self getCachedValue:[TaskField START5]];
}

-(MPPDuration *)getStartVariance
{
#warning Incomplete
}

-(NSDate *)getStop
{
    return (NSDate *)[self getCachedValue:[TaskField STOP]];
}

-(NSString *)getSubprojectName
{
    return (NSString *)[self getCachedValue:[TaskField SUBPROJECT_FILE]];
}

-(Boolean)getSummary
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField SUMMARY]]];
}

-(NSNumber *)getSV
{
    NSNumber *variance = (NSNumber *)[self getCachedValue:[TaskField SV]];
    if(variance == nil)
    {
        NSNumber *bcwp = [self getBCWP];
        NSNumber *bcws = [self getBCWS];
        if(bcwp != nil && bcws != nil)
        {
            variance = [NSNumber numberWithDouble:[bcwp doubleValue] - [bcws doubleValue]];
            [self set:[TaskField SV] withObject:variance];
        }
    }
    
    return variance;
}

-(NSString *)getText1
{
    return (NSString *)[self getCachedValue:[TaskField TEXT1]];
}

-(NSString *)getText2
{
    return (NSString *)[self getCachedValue:[TaskField TEXT2]];
}

-(NSString *)getText3
{
    return (NSString *)[self getCachedValue:[TaskField TEXT3]];
}

-(NSString *)getText4
{
    return (NSString *)[self getCachedValue:[TaskField TEXT4]];
}

-(NSString *)getText5
{
    return (NSString *)[self getCachedValue:[TaskField TEXT5]];
}

-(NSString *)getText6
{
    return (NSString *)[self getCachedValue:[TaskField TEXT6]];
}

-(NSString *)getText7
{
    return (NSString *)[self getCachedValue:[TaskField TEXT7]];
}

-(NSString *)getText8
{
    return (NSString *)[self getCachedValue:[TaskField TEXT8]];
}

-(NSString *)getText9
{
    return (NSString *)[self getCachedValue:[TaskField TEXT9]];
}

-(NSString *)getText10
{
    return (NSString *)[self getCachedValue:[TaskField TEXT10]];
}

-(MPPDuration *)getTotalSlack
{
#warning Incomplete
}

-(NSNumber *)getUniqueID
{
    return (NSNumber *)[self getCachedValue:[TaskField UNIQUE_ID]];
}

-(Boolean)getUpdatedNeeded
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField UPDATE_NEEDED]]];
}

-(NSString *)getWBS
{
    return (NSString *)[self getCachedValue:[TaskField WBS]];
}

-(MPPDuration *)getWork
{
    return (MPPDuration *)[self getCachedValue:[TaskField WORK]];
}

-(MPPDuration *)getWorkVariance
{
    MPPDuration *variance = (MPPDuration *)[self getCachedValue:[TaskField WORK_VARIANCE]];
    if(variance == nil)
    {
        MPPDuration *work = [self getWork];
        MPPDuration *baselineWork = [self getBaselineWork];
        if(work != nil && baselineWork != nil)
        {
            variance = [MPPDuration getInstance:([work getDuration] - [[baselineWork convertUnits:[work getUnits] withDefaults:[[self getParentFile]getProjectHeader]]getDuration]) withIntType:[work getUnits]];
            [self set:[TaskField WORK_VARIANCE] withObject:variance];
        }
    }
    
    return variance;
}

-(int)getChildTaskCount
{
    return [_children count];
}

-(void)setParentTask:(Task *)parent
{
    _parent = parent;
}

-(Task *)getParentTask
{
    return _parent;
}

-(NSMutableArray *)getChildTasks
{
    return _children;
}

-(int)compareTo:(Task *)o
{
    int id1 = [NumberUtility getInt:[self getID]];
    int id2 = [NumberUtility getInt:[o getID]];
    return ((id1 < id2) ? -1 : ((id1 == id2) ? 0 : 1));
}

-(Boolean)getEstimated
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField ESTIMATED]]];
}

-(void)setEstimated:(Boolean)estimated
{
    [self set:[TaskField ESTIMATED] withBoolean:estimated];
}

-(NSDate *)getDeadline
{
    return (NSDate *)[self getCachedValue:[TaskField DEADLINE]];
}

-(void)setDeadLine:(NSDate *)deadline
{
    [self set:[TaskField DEADLINE] withObject:deadline];
}

-(TaskType *)getType
{
    return (TaskType *)[self getCachedValue:[TaskField TYPE]];
}

-(void)setType:(TaskType *)type
{
    [self set:[TaskField TYPE] withObject:type];
}

-(Boolean)getNull
{
    return _null;
}

-(void)setNull:(Boolean)isNull
{
    _null = isNull;
}

-(NSString *)getWBSLevel
{
    return _wbsLevel;
}

-(void)setWBSLevel:(NSString *)wbsLevel
{
    _wbsLevel = wbsLevel;
}

-(Boolean)getResumeValid
{
    return _resumeValid;
}

-(void)setResumeValid:(Boolean)resumeValid
{
    _resumeValid = resumeValid;
}

-(Boolean)getRecurring
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField RECURRING]]];
}

-(void)setRecurring:(Boolean)recurring
{
    [self set:[TaskField RECURRING] withBoolean:recurring];
}

-(Boolean)getOverAllocated
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField OVERALLOCATED]]];
}

-(void)setOverAllocated:(Boolean)overAllocated
{
    [self set:[TaskField OVERALLOCATED] withBoolean:overAllocated];
}

-(NSNumber *)getSubprojectTaskUniqueID
{
    return (NSNumber *)[self getCachedValue:[TaskField SUBPROJECT_UNIQUE_TASK_ID]];
}

-(void)setSubprojectTaskUniqueID:(NSNumber *)subprojectUniqueTaskID
{
    [self set:[TaskField SUBPROJECT_UNIQUE_TASK_ID] withObject:subprojectUniqueTaskID];
}

-(NSNumber *)getSubprojectTaskID
{
    return (NSNumber *)[self getCachedValue:[TaskField SUBPROJECT_TASK_ID]];
}

-(void)setSubprojectTaskID:(NSNumber *)subprojectTaskID
{
    [self set:[TaskField SUBPROJECT_TASK_ID] withObject:subprojectTaskID];
}

-(void)setSubprojectTaskUniqueIDOffset:(NSNumber *)offset
{
    [self set:[TaskField SUBPROJECT_TASKS_UNIQUEID_OFFSET] withObject:offset];
}

-(NSNumber *)getSubprojectTaskUniqueIDOffset
{
    return (NSNumber *)[self getCachedValue:[TaskField SUBPROJECT_TASKS_UNIQUEID_OFFSET]];
}

-(Boolean)getSubprojectReadOnly
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField SUBPROJECT_READ_ONLY]]];
}

-(void)setSubprojectReadOnly:(Boolean)subprojectReadOnly
{
    [self set:[TaskField SUBPROJECT_READ_ONLY] withBoolean:subprojectReadOnly];
}

-(Boolean)getExternalTask
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField EXTERNAL_TASK]]];
}

-(void)setExternalTask:(Boolean)externalTask
{
    [self set:[TaskField EXTERNAL_TASK] withBoolean:externalTask];
}

-(NSString *)getExternalTaskProject
{
    return _externalTaskProject;
}

-(void)setExternalTaskProject:(NSString *)externalTaskProject
{
    _externalTaskProject = externalTaskProject;
}

-(NSNumber *)getACWP
{
    return (NSNumber *)[self getCachedValue:[TaskField ACWP]];
}

-(void)setACWP:(NSNumber *)acwp
{
    [self set:[TaskField ACWP] withObject:acwp];
}

-(TimeUnit *)getLevelingDelayFormat
{
    return _levelingDelayFormat;
}

-(void)setLevelingDelayFormat:(TimeUnit *)levelingDelayFormat
{
    _levelingDelayFormat = levelingDelayFormat;
}

-(Boolean)getIgnoreResourceCalendar
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField IGNORE_RESOURCE_CALENDAR]]];
}

-(void)setIgnoreResourceCalendar:(Boolean)ignoreResourceCalendar
{
    [self set:[TaskField IGNORE_RESOURCE_CALENDAR] withBoolean:ignoreResourceCalendar];
}

-(NSNumber *)getPhysicalPercentComplete
{
    return (NSNumber *)[self getCachedValue:[TaskField PHYSICAL_PERCENT_COMPLETE]];
}

-(void)setPhysicalPercentComplete:(NSNumber *)physicalPercentComplete
{
    [self set:[TaskField PHYSICAL_PERCENT_COMPLETE] withObject:physicalPercentComplete];
}

-(EarnedValueMethod *)getEarnedValueMethod
{
    return _earnedValueMethod;
}

-(void)setEarnedValueMethod:(EarnedValueMethod *)earnedValueMethod
{
    _earnedValueMethod = earnedValueMethod;
}

-(MPPDuration *)getActualWorkProtected
{
    return _actualWorkProtected;
}

-(void)setActualWorkProtected:(MPPDuration *)actualWorkProtected
{
    _actualWorkProtected = actualWorkProtected;
}

-(MPPDuration *)getActualOvertimeWorkProtected
{
    return _actualOvertimeWorkProtected;
}

-(void)setActualOvertimeWorkProtected:(MPPDuration *)actualOvertimeWorkProtected
{
    _actualOvertimeWorkProtected = actualOvertimeWorkProtected;
}

-(MPPDuration *)getRegularWork
{
    return (MPPDuration *)[self getCachedValue:[TaskField REGULAR_WORK]];
}

-(void)setRegularWork:(MPPDuration *)regularWork
{
    [self set:[TaskField REGULAR_WORK] withObject:regularWork];
}

-(Boolean)getFlag11
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG11]]];
}

-(Boolean)getFlag12
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG12]]];
}

-(Boolean)getFlag13
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG13]]];
}

-(Boolean)getFlag14
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG14]]];
}

-(Boolean)getFlag15
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG15]]];
}

-(Boolean)getFlag16
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG16]]];
}

-(Boolean)getFlag17
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG17]]];
}

-(Boolean)getFlag18
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG18]]];
}

-(Boolean)getFlag19
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG19]]];
}

-(Boolean)getFlag20
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField FLAG20]]];
}

-(void)setFlag11:(Boolean)b
{
    [self set:[TaskField FLAG11] withBoolean:b];
}

-(void)setFlag12:(Boolean)b
{
    [self set:[TaskField FLAG12] withBoolean:b];
}

-(void)setFlag13:(Boolean)b
{
    [self set:[TaskField FLAG13] withBoolean:b];
}

-(void)setFlag14:(Boolean)b
{
    [self set:[TaskField FLAG14] withBoolean:b];
}

-(void)setFlag15:(Boolean)b
{
    [self set:[TaskField FLAG15] withBoolean:b];
}

-(void)setFlag16:(Boolean)b
{
    [self set:[TaskField FLAG16] withBoolean:b];
}

-(void)setFlag17:(Boolean)b
{
    [self set:[TaskField FLAG17] withBoolean:b];
}

-(void)setFlag18:(Boolean)b
{
    [self set:[TaskField FLAG18] withBoolean:b];
}

-(void)setFlag19:(Boolean)b
{
    [self set:[TaskField FLAG19] withBoolean:b];
}

-(void)setFlag20:(Boolean)b
{
    [self set:[TaskField FLAG20] withBoolean:b];
}

-(void)setEffortDriven:(Boolean)flag
{
    [self set:[TaskField EFFORT_DRIVEN] withBoolean:flag];
}

-(Boolean)getEffortDriven
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField EFFORT_DRIVEN]]];
}

-(NSString *)getText11
{
    return (NSString *)[self getCachedValue:[TaskField TEXT11]];
}

-(NSString *)getText12
{
    return (NSString *)[self getCachedValue:[TaskField TEXT12]];
}

-(NSString *)getText13
{
    return (NSString *)[self getCachedValue:[TaskField TEXT13]];
}

-(NSString *)getText14
{
    return (NSString *)[self getCachedValue:[TaskField TEXT14]];
}

-(NSString *)getText15
{
    return (NSString *)[self getCachedValue:[TaskField TEXT15]];
}

-(NSString *)getText16
{
    return (NSString *)[self getCachedValue:[TaskField TEXT16]];
}

-(NSString *)getText17
{
    return (NSString *)[self getCachedValue:[TaskField TEXT17]];
}

-(NSString *)getText18
{
    return (NSString *)[self getCachedValue:[TaskField TEXT18]];
}

-(NSString *)getText19
{
    return (NSString *)[self getCachedValue:[TaskField TEXT19]];
}

-(NSString *)getText20
{
    return (NSString *)[self getCachedValue:[TaskField TEXT20]];
}

-(NSString *)getText21
{
    return (NSString *)[self getCachedValue:[TaskField TEXT21]];
}

-(NSString *)getText22
{
    return (NSString *)[self getCachedValue:[TaskField TEXT22]];
}

-(NSString *)getText23
{
    return (NSString *)[self getCachedValue:[TaskField TEXT23]];
}

-(NSString *)getText24
{
    return (NSString *)[self getCachedValue:[TaskField TEXT24]];
}

-(NSString *)getText25
{
    return (NSString *)[self getCachedValue:[TaskField TEXT25]];
}

-(NSString *)getText26
{
    return (NSString *)[self getCachedValue:[TaskField TEXT26]];
}

-(NSString *)getText27
{
    return (NSString *)[self getCachedValue:[TaskField TEXT27]];
}

-(NSString *)getText28
{
    return (NSString *)[self getCachedValue:[TaskField TEXT28]];
}

-(NSString *)getText29
{
    return (NSString *)[self getCachedValue:[TaskField TEXT29]];
}

-(NSString *)getText30
{
    return (NSString *)[self getCachedValue:[TaskField TEXT30]];
}

-(void)setText11:(NSString *)string
{
    [self set:[TaskField TEXT11] withObject:string];
}

-(void)setText12:(NSString *)string
{
    [self set:[TaskField TEXT12] withObject:string];
}

-(void)setText13:(NSString *)string
{
    [self set:[TaskField TEXT13] withObject:string];
}

-(void)setText14:(NSString *)string
{
    [self set:[TaskField TEXT14] withObject:string];
}

-(void)setText15:(NSString *)string
{
    [self set:[TaskField TEXT15] withObject:string];
}

-(void)setText16:(NSString *)string
{
    [self set:[TaskField TEXT16] withObject:string];
}

-(void)setText17:(NSString *)string
{
    [self set:[TaskField TEXT17] withObject:string];
}

-(void)setText18:(NSString *)string
{
    [self set:[TaskField TEXT18] withObject:string];
}

-(void)setText19:(NSString *)string
{
    [self set:[TaskField TEXT19] withObject:string];
}

-(void)setText20:(NSString *)string
{
    [self set:[TaskField TEXT20] withObject:string];
}

-(void)setText21:(NSString *)string
{
    [self set:[TaskField TEXT21] withObject:string];
}

-(void)setText22:(NSString *)string
{
    [self set:[TaskField TEXT22] withObject:string];
}

-(void)setText23:(NSString *)string
{
    [self set:[TaskField TEXT23] withObject:string];
}

-(void)setText24:(NSString *)string
{
    [self set:[TaskField TEXT24] withObject:string];
}

-(void)setText25:(NSString *)string
{
    [self set:[TaskField TEXT25] withObject:string];
}

-(void)setText26:(NSString *)string
{
    [self set:[TaskField TEXT26] withObject:string];
}

-(void)setText27:(NSString *)string
{
    [self set:[TaskField TEXT27] withObject:string];
}

-(void)setText28:(NSString *)string
{
    [self set:[TaskField TEXT28] withObject:string];
}

-(void)setText29:(NSString *)string
{
    [self set:[TaskField TEXT29] withObject:string];
}

-(void)setText30:(NSString *)string
{
    [self set:[TaskField TEXT30] withObject:string];
}

-(void)setNumber6:(NSNumber *)val
{
#warning Incomplete
}

-(NSNumber *)getNumber6
{
#warning Incomplete
}

-(void)setNumber7:(NSNumber *)val
{
#warning Incomplete
}

-(NSNumber *)getNumber7
{
#warning Incomplete
}

-(void)setNumber8:(NSNumber *)val
{
#warning Incomplete
}

-(NSNumber *)getNumber8
{
#warning Incomplete
}

-(void)setNumber9:(NSNumber *)val
{
#warning Incomplete
}

-(NSNumber *)getNumber9
{
#warning Incomplete
}

-(void)setNumber10:(NSNumber *)val
{
#warning Incomplete
}

-(NSNumber *)getNumber10
{
#warning Incomplete
}

-(void)setNumber11:(NSNumber *)val
{
#warning Incomplete
}

-(NSNumber *)getNumber11
{
#warning Incomplete
}

-(void)setNumber12:(NSNumber *)val
{
#warning Incomplete
}

-(NSNumber *)getNumber12
{
#warning Incomplete
}

-(void)setNumber13:(NSNumber *)val
{
#warning Incomplete
}

-(NSNumber *)getNumber13
{
#warning Incomplete
}

-(void)setNumber14:(NSNumber *)val
{
#warning Incomplete
}

-(NSNumber *)getNumber14
{
#warning Incomplete
}

-(void)setNumber15:(NSNumber *)val
{
#warning Incomplete
}

-(NSNumber *)getNumber15
{
#warning Incomplete
}

-(void)setNumber16:(NSNumber *)val
{
#warning Incomplete
}

-(NSNumber *)getNumber16
{
#warning Incomplete
}

-(void)setNumber17:(NSNumber *)val
{
#warning Incomplete
}

-(NSNumber *)getNumber17
{
#warning Incomplete
}

-(void)setNumber18:(NSNumber *)val
{
#warning Incomplete
}

-(NSNumber *)getNumber18
{
#warning Incomplete
}

-(void)setNumber19:(NSNumber *)val
{
#warning Incomplete
}

-(NSNumber *)getNumber19
{
#warning Incomplete
}

-(void)setNumber20:(NSNumber *)val
{
#warning Incomplete
}

-(NSNumber *)getNumber20
{
#warning Incomplete
}

-(MPPDuration *)getDuration10
{
#warning Incomplete
}

-(MPPDuration *)getDuration4
{
#warning Incomplete
}

-(MPPDuration *)getDuration5
{
#warning Incomplete
}

-(MPPDuration *)getDuration6
{
#warning Incomplete
}

-(MPPDuration *)getDuration7
{
#warning Incomplete
}

-(MPPDuration *)getDuration8
{
#warning Incomplete
}

-(MPPDuration *)getDuration9
{
#warning Incomplete
}

-(void)setDuration10:(MPPDuration *)duration
{
#warning Incomplete
}

-(void)setDuration4:(MPPDuration *)duration
{
#warning Incomplete
}

-(void)setDuration5:(MPPDuration *)duration
{
#warning Incomplete
}

-(void)setDuration6:(MPPDuration *)duration
{
#warning Incomplete
}

-(void)setDuration7:(MPPDuration *)duration
{
#warning Incomplete
}

-(void)setDuration8:(MPPDuration *)duration
{
#warning Incomplete
}

-(void)setDuration9:(MPPDuration *)duration
{
#warning Incomplete
}

-(NSDate *)getDate1
{
#warning Incomplete
}

-(NSDate *)getDate10
{
#warning Incomplete
}

-(NSDate *)getDate2
{
#warning Incomplete
}

-(NSDate *)getDate3
{
#warning Incomplete
}

-(NSDate *)getDate4
{
#warning Incomplete
}

-(NSDate *)getDate5
{
#warning Incomplete
}

-(NSDate *)getDate6
{
#warning Incomplete
}

-(NSDate *)getDate7
{
#warning Incomplete
}

-(NSDate *)getDate8
{
#warning Incomplete
}

-(NSDate *)getDate9
{
#warning Incomplete
}

-(void)setDate1:(NSDate *)date
{
#warning Incomplete
}

-(void)setDate10:(NSDate *)date
{
#warning Incomplete
}

-(void)setDate2:(NSDate *)date
{
#warning Incomplete
}

-(void)setDate3:(NSDate *)date
{
#warning Incomplete
}

-(void)setDate4:(NSDate *)date
{
#warning Incomplete
}

-(void)setDate5:(NSDate *)date
{
#warning Incomplete
}

-(void)setDate6:(NSDate *)date
{
#warning Incomplete
}

-(void)setDate7:(NSDate *)date
{
#warning Incomplete
}

-(void)setDate8:(NSDate *)date
{
#warning Incomplete
}

-(void)setDate9:(NSDate *)date
{
#warning Incomplete
}

-(NSNumber *)getCost10
{
#warning Incomplete
}

-(NSNumber *)getCost4
{
#warning Incomplete
}

-(NSNumber *)getCost5
{
#warning Incomplete
}

-(NSNumber *)getCost6
{
#warning Incomplete
}

-(NSNumber *)getCost7
{
#warning Incomplete
}

-(NSNumber *)getCost8
{
#warning Incomplete
}

-(NSNumber *)getCost9
{
#warning Incomplete
}

-(void)setCost10:(NSNumber *)number
{
#warning Incomplete
}

-(void)setCost4:(NSNumber *)number
{
#warning Incomplete
}

-(void)setCost5:(NSNumber *)number
{
#warning Incomplete
}

-(void)setCost6:(NSNumber *)number
{
#warning Incomplete
}

-(void)setCost7:(NSNumber *)number
{
#warning Incomplete
}

-(void)setCost8:(NSNumber *)number
{
#warning Incomplete
}

-(void)setCost9:(NSNumber *)number
{
#warning Incomplete
}

-(NSDate *)getStart10
{
#warning Incomplete
}

-(NSDate *)getStart6
{
#warning Incomplete
}

-(NSDate *)getStart7
{
#warning Incomplete
}

-(NSDate *)getStart8
{
#warning Incomplete
}

-(NSDate *)getStart9
{
#warning Incomplete
}

-(void)setStart10:(NSDate *)date
{
#warning Incomplete
}

-(void)setStart6:(NSDate *)date
{
#warning Incomplete
}

-(void)setStart7:(NSDate *)date
{
#warning Incomplete
}

-(void)setStart8:(NSDate *)date
{
#warning Incomplete
}

-(void)setStart9:(NSDate *)date
{
#warning Incomplete
}

-(NSDate *)getFinish10
{
#warning Incomplete
}

-(NSDate *)getFinish6
{
#warning Incomplete
}

-(NSDate *)getFinish7
{
#warning Incomplete
}

-(NSDate *)getFinish8
{
#warning Incomplete
}

-(NSDate *)getFinish9
{
#warning Incomplete
}

-(void)setFinish10:(NSDate *)date
{
#warning Incomplete
}

-(void)setFinish6:(NSDate *)date
{
#warning Incomplete
}

-(void)setFinish7:(NSDate *)date
{
#warning Incomplete
}

-(void)setFinish8:(NSDate *)date
{
#warning Incomplete
}

-(void)setFinish9:(NSDate *)date
{
#warning Incomplete
}

-(NSNumber *)getOverTimeCost
{
#warning Incomplete
}

-(void)setOverTimeCost:(NSNumber *)number
{
#warning Incomplete
}

-(void)setOutlineCode1:(NSString *)value
{
#warning Incomplete
}

-(NSString *)getOutlineCode1
{
#warning Incomplete
}

-(void)setOutlineCode2:(NSString *)value
{
#warning Incomplete
}

-(NSString *)getOutlineCode2
{
#warning Incomplete
}

-(void)setOutlineCode3:(NSString *)value
{
#warning Incomplete
}

-(NSString *)getOutlineCode3
{
#warning Incomplete
}

-(void)setOutlineCode4:(NSString *)value
{
#warning Incomplete
}

-(NSString *)getOutlineCode4
{
#warning Incomplete
}

-(void)setOutlineCode5:(NSString *)value
{
#warning Incomplete
}

-(NSString *)getOutlineCode5
{
#warning Incomplete
}

-(void)setOutlineCode6:(NSString *)value
{
#warning Incomplete
}

-(NSString *)getOutlineCode6
{
#warning Incomplete
}

-(void)setOutlineCode7:(NSString *)value
{
#warning Incomplete
}

-(NSString *)getOutlineCode7
{
#warning Incomplete
}

-(void)setOutlineCode8:(NSString *)value
{
#warning Incomplete
}

-(NSString *)getOutlineCode8
{
#warning Incomplete
}

-(void)setOutlineCode9:(NSString *)value
{
#warning Incomplete
}

-(NSString *)getOutlineCode9
{
#warning Incomplete
}

-(void)setOutlineCode10:(NSString *)value
{
#warning Incomplete
}

-(NSString *)getOutlineCode10
{
#warning Incomplete
}

-(NSNumber *)getActualOvertimeCost
{
#warning Incomplete
}

-(void)setActualOvertimeCost:(NSNumber *)cost
{
#warning Incomplete
}

-(MPPDuration *)getActualOvertimeWork
{
#warning Incomplete
}

-(void)setActualOvertimeWork:(MPPDuration *)work
{
#warning Incomplete
}

-(AccrueType *)getFixedCostAccrual
{
#warning Incomplete
}

-(void)setFixedCostAccural:(AccrueType *)type
{
#warning Incomplete
}

-(NSString *)getHyperlink
{
#warning Incomplete
}

-(NSString *)getHyperlinkAddress
{
#warning Incomplete
}

-(NSString *)getHyperlinkSubAddress
{
#warning Incomplete
}

-(void)setHyperlink:(NSString *)text
{
#warning Incomplete
}

-(void)setHyperlinkAddress:(NSString *)text
{
#warning Incomplete
}

-(void)setHyperlinkSubAddress:(NSString *)text
{
#warning Incomplete
}

-(Boolean)getLevelAssignments
{
#warning Incomplete
}

-(void)setLevelAssignments:(Boolean)flag
{
#warning Incomplete
}

-(Boolean)getLevelingCanSplit
{
#warning Incomplete
}

-(void)setLevelingCanSplit:(Boolean)flag
{
#warning Incomplete
}

-(MPPDuration *)getOvertimeWork
{
#warning Incomplete
}

-(void)setOvertimeWork:(MPPDuration *)work
{
#warning Incomplete
}

-(NSDate *)getPreleveledStart
{
#warning Incomplete
}

-(NSDate *)getPreleveledFinish
{
#warning Incomplete
}

-(void)setPreleveledStart:(NSDate *)date
{
#warning Incomplete
}

-(void)setPreleveledFinish:(NSDate *)date
{
#warning Incomplete
}

-(MPPDuration *)getRemainingOvertimeWork
{
#warning Incomplete
}

-(void)setRemainingOvertimeWork:(MPPDuration *)work
{
#warning Incomplete
}

-(NSNumber *)getRemainingOvertimeCost
{
#warning Incomplete
}

-(void)setRemainingOvertimeCost:(NSNumber *)cost
{
#warning Incomplete
}

-(ProjectCalendar *)getCalendar
{
#warning Incomplete
}

-(void)setCalendar:(ProjectCalendar *)calendar
{
#warning Incomplete
}

-(Boolean)getExpanded
{
#warning Incomplete
}

-(void)setExpanded:(Boolean)expanded
{
#warning Incomplete
}

-(void)setStartSlack:(MPPDuration *)duration
{
#warning Incomplete
}

-(void)setFinishSlack:(MPPDuration *)duration
{
#warning Incomplete
}

-(MPPDuration *)getStartSlack
{
#warning Incomplete
}

-(MPPDuration *)getFinishSlack
{
#warning Incomplete
}

-(NSObject *)getFieldByAlias:(NSString *)alias
{
#warning Incomplete
}

-(void)setFieldByAlias:(NSString *)alias withValue:(NSObject *)value
{
#warning Incomplete
}

-(NSMutableArray *)getSplits
{
#warning Incomplete
}

-(void)setSplits:(NSMutableArray *)splts
{
#warning Incomplete
}

-(NSDate *)getSplitCompleteDuration
{
#warning Incomplete
}

-(void)setSplitCompleteDuration:(NSDate *)splitsComplete
{
#warning Incomplete
}

-(void)remove
{
#warning Incomplete
}

-(SubProject *)getSubProject
{
#warning Incomplete
}

-(void)setSubProject:(SubProject *)subProject
{
#warning Incomplete
}

-(NSNumber *)getEnterpriseCost:(int)index
{
#warning Incomplete
}

-(void)setEnterpriseCost:(int)index withValue:(NSNumber *)value
{
#warning Incomplete
}

-(NSDate *)getEnterpriseDate:(int)index
{
#warning Incomplete
}

-(void)setEnterpriseDate:(int)index withValue:(NSDate *)value
{
#warning Incomplete
}

-(MPPDuration *)getEnterpriseDuration:(int)index
{
#warning Incomplete
}

-(void)setEnterpriseDuration:(int)index withValue:(MPPDuration *)value
{
#warning Incomplete
}

-(Boolean *)getEnterpriseFlag:(int)index
{
#warning Incomplete
}

-(void)setEnterpriseFlag:(int)index withValue:(Boolean *)value
{
#warning Incomplete
}

-(NSNumber *)getEnterpriseNumber:(int)index
{
#warning Incomplete
}

-(void)setEnterpriseNumber:(int)index withValue:(NSNumber *)value
{
#warning Incomplete
}

-(NSString *)getEnterpriseText:(int)index
{
#warning Incomplete
}

-(void)setEnterpriseText:(int)index withValue:(NSString *)value
{
#warning Incomplete
}

-(void)setBaselineCost:(int)baselineNumber withValue:(NSNumber *)value
{
#warning Incomplete
}

-(void)setBaselineDuration:(int)baselineNumber withValue:(MPPDuration *)value
{
#warning Incomplete
}

-(void)setBaselineFinish:(int)baselineNumber withValue:(NSDate *)value
{
#warning Incomplete
}

-(void)setBaselineStart:(int)baselineNumber withValue:(NSDate *)value
{
#warning Incomplete
}

-(void)setBaselineWork:(int)baselineNumber withValue:(MPPDuration *)value
{
#warning Incomplete
}

-(NSNumber *)getBaslineCost:(int)baseline
{
#warning Incomplete
}

-(MPPDuration *)getBaslineDuration:(int)baseline
{
#warning Incomplete
}

-(NSString *)getBaslineDurationText:(int)baseline
{
#warning Incomplete
}

-(void)setBaselineDurationText:(int)baselineNumber withValue:(NSString *)value
{
#warning Incomplete
}

-(NSDate *)getBaselineFinish:(int)baselineNumber
{
#warning Incomplete
}

-(NSString *)getBaselineFinishText:(int)baselineNumber
{
#warning Incomplete
}

-(void)setBaselineFinishText:(int)baselineNumber withValue:(NSString *)value
{
#warning Incomplete
}

-(NSDate *)getBaselineStart:(int)baselineNumber
{
#warning Incomplete
}

-(NSString *)getBaselineStartText:(int)baselineNumber
{
#warning Incomplete
}

-(void)setBaselineStartText:(int)baselineNumber withValue:(NSString *)value
{
#warning Incomplete
}

-(MPPDuration *)getBaselineWork:(int)baselineNumber
{
#warning Incomplete
}

-(NSDate *)getCompleteThrough
{
#warning Incomplete
}

-(NSDate *)getSummaryProgress
{
#warning Incomplete
}

-(void)setSummaryProgress:(NSDate *)value
{
#warning Incomplete
}

-(CFUUIDRef *)getGUID
{
#warning Incomplete
}

-(void)setGUID:(CFUUIDRef *)value
{
#warning Incomplete
}

-(TaskMode *)getTaskMode
{
#warning Incomplete
}

-(void)setTaskMode:(TaskMode *)mode
{
#warning Incomplete
}

-(Boolean)getActive
{
#warning Incomplete
}

-(void)setActive:(Boolean)active
{
#warning Incomplete
}

-(Boolean)removePredecessor:(Task *)targetTask withType:(RelationType *)type withLag:(MPPDuration *)lag
{
#warning Incomplete
}

-(NSObject *)getCachedValue:(id<FieldType>)type
{
#warning Incomplete
}

-(NSObject *)getCurrentValue:(id<FieldType>)type
{
#warning Incomplete
}

-(void)set:(id<FieldType>)field withObject:(NSObject *)value
{
    if(field != nil)
    {
        int index = [field getValue];
        if(_eventsEnabled)
        {
            [self fireFieldChangeEvent:(TaskField *)field withOldValue:[_array objectAtIndex:index] withNewValue:value];
        }
        
        [_array replaceObjectAtIndex:index withObject:value];
    }
}

-(void)fireFieldChangeEvent:(TaskField *)field withOldValue:(NSObject *)oldValue withNewValue:(NSObject *)newValue
{
#warning Incomplete
}

-(void)addFieldListener:(id<FieldListener>)listener
{
#warning Incomplete
}

-(void)removeFieldListener:(id<FieldListener>)listener
{
#warning Incomplete
}

-(void)set:(id<FieldType>)field withBoolean:(Boolean)value
{
    [self set:field withObject:[NSNumber numberWithBool:value]];
}

-(NSString *)toString
{
#warning Incomplete
}

-(Boolean)isPredecessor:(Task *)task
{
#warning Incomplete
}

-(Boolean)isSuccessor:(Task *)task
{
#warning Incomplete
}

-(void)disableEvents
{
#warning Incomplete
}

-(void)enableEvents
{
#warning Incomplete
}

@end
