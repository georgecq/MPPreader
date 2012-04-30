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
#import "AccrueType.h"
#import "ProjectCalendar.h"
#import "ProjectHeader.h"
#import "DateUtility.h"
#import "SubProject.h"
#import "FieldListener.h"

@implementation Task

static NSMutableArray *_ENTERPRISE_COST_FIELDS = nil;
static NSMutableArray *_ENTERPRISE_DATE_FIELDS = nil;
static NSMutableArray *_ENTERPRISE_DURATION_FIELDS = nil;
static NSMutableArray *_ENTERPRISE_FLAG_FIELDS = nil;
static NSMutableArray *_ENTERPRISE_NUMBER_FIELDS = nil;
static NSMutableArray *_ENTERPRISE_TEXT_FIELDS = nil;
static NSMutableArray *_BASELINE_COSTS = nil;
static NSMutableArray *_BASELINE_DURATIONS = nil;
static NSMutableArray *_BASELINE_ESTIMATED_DURATIONS = nil;
static NSMutableArray *_BASELINE_STARTS = nil;
static NSMutableArray *_BASELINE_ESTIMATED_STARTS = nil;
static NSMutableArray *_BASELINE_FINISHES = nil;
static NSMutableArray *_BASELINE_ESTIMATED_FINISHES = nil;
static NSMutableArray *_BASELINE_WORKS = nil;

// Default constructor.
//
// @param file Parent file to which this record belongs.
// @param parent Parent task

-(id)init:(ProjectFile *)file withParent:(Task *)parent
{
    self= [super init:file];
    if (self)
    {
        _array = [[NSMutableArray alloc]init];
        _children = [[NSMutableArray alloc]init];
        _assignments = [[NSMutableArray alloc]init];
        
        [self setType:[TaskType FIXED_UNITS]];
        [self setConstraintType:[ConstraintType AS_SOON_AS_POSSIBLE]];
        [self setTaskMode:[TaskMode AUTO_SCHEDULED]];
        [self setActive:true];
        
        _parent = parent;
        
        if([file autoTaskUniqueID])
        {
            [self setUniqueID:[NSNumber numberWithInt:[file getTaskUniqueID]]];
        }
        
        if([file autoTaskID])
        {
            [self setID:[NSNumber numberWithInt:[file getTaskID]]];
        }
        
        if([file autoWBS])
        {
            [self generateWBS:parent];
        }
        
        if([file autoOutlineNumber])
        {
            [self generateOutlineNumber:parent];
        }
        
        if([file autoOutlineLevel])
        {
            if(parent == nil)
            {
                [self setOutlineLevel:[NSNumber numberWithInt:1]];
            }
            else
            {
                [self setOutlineLevel:[NSNumber numberWithInt:[[parent getOutlineLevel] intValue] + 1]];
            }
        }
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
        if([NumberUtility getInt:[self getUniqueID]] == 0)
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
        if([NumberUtility getInt:[self getUniqueID]] == 0)
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
    int outlineLevel = [NumberUtility getInt:[self getOutlineLevel]];
    
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
    
    if([[self getParentFile] autoOutlineLevel])
    {
        [child setOutlineLevel:[NSNumber numberWithInt:[[self getOutlineLevel]intValue] + 1]];
    }
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
        
        [assignment setTaskUniqueID:[self getUniqueID]];
        [assignment setWork:[self getDuration]];
        [assignment setUnits:[NSNumber numberWithDouble:[ResourceAssignment DEFAULT_UNITS]]];
        
        if(resource == nil)
        {
            [assignment setResourceUniqueID:[resource getUniqueID]];
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
    NSNumber *resourceUniqueID;
    
    if(resource != nil)
    {
        resourceUniqueID = [resource getUniqueID];
        int index = 0;
        while(index < [_assignments count])
        {
            assignment = [_assignments objectAtIndex:index];
            NSNumber *uniqueID = [assignment getResourceUniqueID];
            if([uniqueID intValue] == [resourceUniqueID intValue])
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
    NSNumber *previous = [self getID];
    
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
    NSNumber *previous = [self getUniqueID];
    
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
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField CONFIRMED]]];
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

-(MPPDuration *)getFinishVariance
{
    MPPDuration *variance = (MPPDuration *)[self getCachedValue:[TaskField FINISH_VARIANCE]];
    if(variance == nil)
    {
        TimeUnit *format = [[[self getParentFile] getProjectHeader] defaultDurationUnits];
        variance = [DateUtility getVariance:self withDate1:[self getBaselineFinish] withDate2:[self getFinish] withFormat:format];
        [self set:[TaskField FINISH_VARIANCE] withObject:variance];
    }
    
    return variance;
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
    MPPDuration *variance = (MPPDuration *)[self getCachedValue:[TaskField START_VARIANCE]];
    if(variance == nil)
    {
        TimeUnit *format = [[[self getParentFile] getProjectHeader] defaultDurationUnits];
        variance = [DateUtility getVariance:self withDate1:[self getBaselineStart] withDate2:[self getStart] withFormat:format];
        [self set:[TaskField START_VARIANCE] withObject:variance];
    }
    
    return variance;
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
    MPPDuration *totalSlack = (MPPDuration *)[self getCachedValue:[TaskField TOTAL_SLACK]];
    if(totalSlack == nil)
    {
        MPPDuration *duration = [self getDuration];
        if(duration == nil)
        {
            duration = [MPPDuration getInstance:0 withIntType:[TimeUnit DAYS]];
        }
        
        TimeUnit *units = [duration getUnits];
        
        MPPDuration *startSlack = [self getStartSlack];
        if(startSlack == nil)
        {
            startSlack = [MPPDuration getInstance:0 withIntType:units];
        }
        else
        {
            if([startSlack getUnits] != units)
            {
                startSlack = [startSlack convertUnits:units withDefaults:[[self getParentFile]getProjectHeader]];
            }
        }
        
        MPPDuration *finishSlack = [self getFinishSlack];
        if(finishSlack == nil)
        {
            finishSlack = [MPPDuration getInstance:0 withIntType:units];
        }
        else
        {
            if([finishSlack getUnits] != units)
            {
                finishSlack = [finishSlack convertUnits:units withDefaults:[[self getParentFile]getProjectHeader]];
            }
        }
        
        double startSlackDuration = [startSlack getDuration];
        double finishSlackDuration = [finishSlack getDuration];
        
        if(startSlackDuration == 0 || finishSlackDuration == 0)
        {
            if(startSlackDuration != 0)
            {
                totalSlack =  startSlack;
            }
            else
            {
                totalSlack = finishSlack;
            }
        }
        else
        {
            if(startSlackDuration < finishSlackDuration)
            {
                totalSlack = startSlack;
            }
            else
            {
                totalSlack = finishSlack;
            }
        }
        
        [self set:[TaskField TOTAL_SLACK] withObject:totalSlack];
    }
    
    return totalSlack;
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
    [self set:[TaskField NUMBER6] withObject:val];
}

-(NSNumber *)getNumber6
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER6]];
}

-(void)setNumber7:(NSNumber *)val
{
    [self set:[TaskField NUMBER7] withObject:val];
}

-(NSNumber *)getNumber7
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER7]];
}

-(void)setNumber8:(NSNumber *)val
{
    [self set:[TaskField NUMBER8] withObject:val];
}

-(NSNumber *)getNumber8
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER8]];
}

-(void)setNumber9:(NSNumber *)val
{
    [self set:[TaskField NUMBER9] withObject:val];
}

-(NSNumber *)getNumber9
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER9]];
}

-(void)setNumber10:(NSNumber *)val
{
    [self set:[TaskField NUMBER10] withObject:val];
}

-(NSNumber *)getNumber10
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER10]];
}

-(void)setNumber11:(NSNumber *)val
{
    [self set:[TaskField NUMBER11] withObject:val];
}

-(NSNumber *)getNumber11
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER11]];
}

-(void)setNumber12:(NSNumber *)val
{
    [self set:[TaskField NUMBER12] withObject:val];
}

-(NSNumber *)getNumber12
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER12]];
}

-(void)setNumber13:(NSNumber *)val
{
    [self set:[TaskField NUMBER13] withObject:val];
}

-(NSNumber *)getNumber13
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER13]];
}

-(void)setNumber14:(NSNumber *)val
{
    [self set:[TaskField NUMBER14] withObject:val];
}

-(NSNumber *)getNumber14
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER14]];
}

-(void)setNumber15:(NSNumber *)val
{
    [self set:[TaskField NUMBER15] withObject:val];
}

-(NSNumber *)getNumber15
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER15]];
}

-(void)setNumber16:(NSNumber *)val
{
    [self set:[TaskField NUMBER16] withObject:val];
}

-(NSNumber *)getNumber16
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER16]];
}

-(void)setNumber17:(NSNumber *)val
{
    [self set:[TaskField NUMBER17] withObject:val];
}

-(NSNumber *)getNumber17
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER17]];
}

-(void)setNumber18:(NSNumber *)val
{
    [self set:[TaskField NUMBER18] withObject:val];
}

-(NSNumber *)getNumber18
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER18]];
}

-(void)setNumber19:(NSNumber *)val
{
    [self set:[TaskField NUMBER19] withObject:val];
}

-(NSNumber *)getNumber19
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER19]];
}

-(void)setNumber20:(NSNumber *)val
{
    [self set:[TaskField NUMBER20] withObject:val];
}

-(NSNumber *)getNumber20
{
    return (NSNumber *)[self getCachedValue:[TaskField NUMBER20]];
}

-(MPPDuration *)getDuration10
{
    return (MPPDuration *)[self getCachedValue:[TaskField DURATION10]];
}

-(MPPDuration *)getDuration4
{
    return (MPPDuration *)[self getCachedValue:[TaskField DURATION4]];
}

-(MPPDuration *)getDuration5
{
    return (MPPDuration *)[self getCachedValue:[TaskField DURATION5]];
}

-(MPPDuration *)getDuration6
{
    return (MPPDuration *)[self getCachedValue:[TaskField DURATION6]];
}

-(MPPDuration *)getDuration7
{
    return (MPPDuration *)[self getCachedValue:[TaskField DURATION7]];
}

-(MPPDuration *)getDuration8
{
    return (MPPDuration *)[self getCachedValue:[TaskField DURATION8]];
}

-(MPPDuration *)getDuration9
{
    return (MPPDuration *)[self getCachedValue:[TaskField DURATION9]];
}

-(void)setDuration10:(MPPDuration *)duration
{
    [self set:[TaskField DURATION10] withObject:duration];
}

-(void)setDuration4:(MPPDuration *)duration
{
    [self set:[TaskField DURATION4] withObject:duration];
}

-(void)setDuration5:(MPPDuration *)duration
{
    [self set:[TaskField DURATION5] withObject:duration];
}

-(void)setDuration6:(MPPDuration *)duration
{
    [self set:[TaskField DURATION6] withObject:duration];
}

-(void)setDuration7:(MPPDuration *)duration
{
    [self set:[TaskField DURATION7] withObject:duration];
}

-(void)setDuration8:(MPPDuration *)duration
{
    [self set:[TaskField DURATION8] withObject:duration];
}

-(void)setDuration9:(MPPDuration *)duration
{
    [self set:[TaskField DURATION9] withObject:duration];
}

-(NSDate *)getDate1
{
    return (NSDate *)[self getCachedValue:[TaskField DATE1]];
}

-(NSDate *)getDate10
{
    return (NSDate *)[self getCachedValue:[TaskField DATE10]];
}

-(NSDate *)getDate2
{
    return (NSDate *)[self getCachedValue:[TaskField DATE2]];
}

-(NSDate *)getDate3
{
    return (NSDate *)[self getCachedValue:[TaskField DATE3]];
}

-(NSDate *)getDate4
{
    return (NSDate *)[self getCachedValue:[TaskField DATE4]];
}

-(NSDate *)getDate5
{
    return (NSDate *)[self getCachedValue:[TaskField DATE5]];
}

-(NSDate *)getDate6
{
    return (NSDate *)[self getCachedValue:[TaskField DATE6]];
}

-(NSDate *)getDate7
{
    return (NSDate *)[self getCachedValue:[TaskField DATE7]];
}

-(NSDate *)getDate8
{
    return (NSDate *)[self getCachedValue:[TaskField DATE8]];
}

-(NSDate *)getDate9
{
    return (NSDate *)[self getCachedValue:[TaskField DATE9]];
}

-(void)setDate1:(NSDate *)date
{
    [self set:[TaskField DATE1] withObject:date];
}

-(void)setDate10:(NSDate *)date
{
    [self set:[TaskField DATE10] withObject:date];
}

-(void)setDate2:(NSDate *)date
{
    [self set:[TaskField DATE2] withObject:date];
}

-(void)setDate3:(NSDate *)date
{
    [self set:[TaskField DATE3] withObject:date];
}

-(void)setDate4:(NSDate *)date
{
    [self set:[TaskField DATE4] withObject:date];
}

-(void)setDate5:(NSDate *)date
{
    [self set:[TaskField DATE5] withObject:date];
}

-(void)setDate6:(NSDate *)date
{
    [self set:[TaskField DATE6] withObject:date];
}

-(void)setDate7:(NSDate *)date
{
    [self set:[TaskField DATE7] withObject:date];
}

-(void)setDate8:(NSDate *)date
{
    [self set:[TaskField DATE8] withObject:date];
}

-(void)setDate9:(NSDate *)date
{
    [self set:[TaskField DATE9] withObject:date];
}

-(NSNumber *)getCost10
{
    return (NSNumber *)[self getCachedValue:[TaskField COST10]];
}

-(NSNumber *)getCost4
{
    return (NSNumber *)[self getCachedValue:[TaskField COST4]];
}

-(NSNumber *)getCost5
{
    return (NSNumber *)[self getCachedValue:[TaskField COST5]];
}

-(NSNumber *)getCost6
{
    return (NSNumber *)[self getCachedValue:[TaskField COST6]];
}

-(NSNumber *)getCost7
{
    return (NSNumber *)[self getCachedValue:[TaskField COST7]];
}

-(NSNumber *)getCost8
{
    return (NSNumber *)[self getCachedValue:[TaskField COST8]];
}

-(NSNumber *)getCost9
{
    return (NSNumber *)[self getCachedValue:[TaskField COST9]];
}

-(void)setCost10:(NSNumber *)number
{
    [self set:[TaskField COST10] withObject:number];
}

-(void)setCost4:(NSNumber *)number
{
    [self set:[TaskField COST4] withObject:number];
}

-(void)setCost5:(NSNumber *)number
{
    [self set:[TaskField COST5] withObject:number];
}

-(void)setCost6:(NSNumber *)number
{
    [self set:[TaskField COST6] withObject:number];
}

-(void)setCost7:(NSNumber *)number
{
    [self set:[TaskField COST7] withObject:number];
}

-(void)setCost8:(NSNumber *)number
{
    [self set:[TaskField COST8] withObject:number];
}

-(void)setCost9:(NSNumber *)number
{
    [self set:[TaskField COST9] withObject:number];
}

-(NSDate *)getStart10
{
    return (NSDate *)[self getCachedValue:[TaskField START10]];
}

-(NSDate *)getStart6
{
    return (NSDate *)[self getCachedValue:[TaskField START6]];
}

-(NSDate *)getStart7
{
    return (NSDate *)[self getCachedValue:[TaskField START7]];
}

-(NSDate *)getStart8
{
    return (NSDate *)[self getCachedValue:[TaskField START8]];
}

-(NSDate *)getStart9
{
    return (NSDate *)[self getCachedValue:[TaskField START9]];
}

-(void)setStart10:(NSDate *)date
{
    [self set:[TaskField START10] withObject:date];
}

-(void)setStart6:(NSDate *)date
{
    [self set:[TaskField START6] withObject:date];
}

-(void)setStart7:(NSDate *)date
{
    [self set:[TaskField START7] withObject:date];
}

-(void)setStart8:(NSDate *)date
{
    [self set:[TaskField START8] withObject:date];
}

-(void)setStart9:(NSDate *)date
{
    [self set:[TaskField START9] withObject:date];
}

-(NSDate *)getFinish10
{
    return (NSDate *)[self getCachedValue:[TaskField FINISH10]];
}

-(NSDate *)getFinish6
{
    return (NSDate *)[self getCachedValue:[TaskField FINISH6]];
}

-(NSDate *)getFinish7
{
    return (NSDate *)[self getCachedValue:[TaskField FINISH7]];
}

-(NSDate *)getFinish8
{
    return (NSDate *)[self getCachedValue:[TaskField FINISH8]];
}

-(NSDate *)getFinish9
{
    return (NSDate *)[self getCachedValue:[TaskField FINISH9]];
}

-(void)setFinish10:(NSDate *)date
{
    [self set:[TaskField FINISH10] withObject:date];
}

-(void)setFinish6:(NSDate *)date
{
    [self set:[TaskField FINISH6] withObject:date];
}

-(void)setFinish7:(NSDate *)date
{
    [self set:[TaskField FINISH7] withObject:date];
}

-(void)setFinish8:(NSDate *)date
{
    [self set:[TaskField FINISH8] withObject:date];
}

-(void)setFinish9:(NSDate *)date
{
    [self set:[TaskField FINISH9] withObject:date];
}

-(NSNumber *)getOverTimeCost
{
    return (NSNumber *)[self getCachedValue:[TaskField OVERTIME_COST]];
}

-(void)setOverTimeCost:(NSNumber *)number
{
    [self set:[TaskField OVERTIME_COST] withObject:number];
}

-(void)setOutlineCode1:(NSString *)value
{
    [self set:[TaskField OUTLINE_CODE1] withObject:value];
}

-(NSString *)getOutlineCode1
{
    return (NSString *)[self getCachedValue:[TaskField OUTLINE_CODE1]];
}

-(void)setOutlineCode2:(NSString *)value
{
    [self set:[TaskField OUTLINE_CODE2] withObject:value];
}

-(NSString *)getOutlineCode2
{
    return (NSString *)[self getCachedValue:[TaskField OUTLINE_CODE2]];
}

-(void)setOutlineCode3:(NSString *)value
{
    [self set:[TaskField OUTLINE_CODE3] withObject:value];
}

-(NSString *)getOutlineCode3
{
    return (NSString *)[self getCachedValue:[TaskField OUTLINE_CODE3]];
}

-(void)setOutlineCode4:(NSString *)value
{
    [self set:[TaskField OUTLINE_CODE4] withObject:value];
}

-(NSString *)getOutlineCode4
{
    return (NSString *)[self getCachedValue:[TaskField OUTLINE_CODE4]];
}

-(void)setOutlineCode5:(NSString *)value
{
    [self set:[TaskField OUTLINE_CODE5] withObject:value];
}

-(NSString *)getOutlineCode5
{
    return (NSString *)[self getCachedValue:[TaskField OUTLINE_CODE5]];
}

-(void)setOutlineCode6:(NSString *)value
{
    [self set:[TaskField OUTLINE_CODE6] withObject:value];
}

-(NSString *)getOutlineCode6
{
    return (NSString *)[self getCachedValue:[TaskField OUTLINE_CODE6]];
}

-(void)setOutlineCode7:(NSString *)value
{
    [self set:[TaskField OUTLINE_CODE7] withObject:value];
}

-(NSString *)getOutlineCode7
{
    return (NSString *)[self getCachedValue:[TaskField OUTLINE_CODE7]];
}

-(void)setOutlineCode8:(NSString *)value
{
    [self set:[TaskField OUTLINE_CODE8] withObject:value];
}

-(NSString *)getOutlineCode8
{
    return (NSString *)[self getCachedValue:[TaskField OUTLINE_CODE8]];
}

-(void)setOutlineCode9:(NSString *)value
{
    [self set:[TaskField OUTLINE_CODE9] withObject:value];
}

-(NSString *)getOutlineCode9
{
    return (NSString *)[self getCachedValue:[TaskField OUTLINE_CODE9]];
}

-(void)setOutlineCode10:(NSString *)value
{
    [self set:[TaskField OUTLINE_CODE10] withObject:value];
}

-(NSString *)getOutlineCode10
{
    return (NSString *)[self getCachedValue:[TaskField OUTLINE_CODE10]];
}

-(NSNumber *)getActualOvertimeCost
{
    return (NSNumber *)[self getCachedValue:[TaskField ACTUAL_OVERTIME_COST]];
}

-(void)setActualOvertimeCost:(NSNumber *)cost
{
    [self set:[TaskField ACTUAL_OVERTIME_COST] withObject:cost];
}

-(MPPDuration *)getActualOvertimeWork
{
    return (MPPDuration *)[self getCachedValue:[TaskField ACTUAL_OVERTIME_WORK]];
}

-(void)setActualOvertimeWork:(MPPDuration *)work
{
    [self set:[TaskField ACTUAL_OVERTIME_WORK] withObject:work];
}

-(AccrueType *)getFixedCostAccrual
{
    return (AccrueType *)[self getCachedValue:[TaskField FIXED_COST_ACCRUAL]];
}

-(void)setFixedCostAccural:(AccrueType *)type
{
    [self set:[TaskField FIXED_COST_ACCRUAL] withObject:type];
}

-(NSString *)getHyperlink
{
    return (NSString *)[self getCachedValue:[TaskField HYPERLINK]];
}

-(NSString *)getHyperlinkAddress
{
    return (NSString *)[self getCachedValue:[TaskField HYPERLINK_ADDRESS]];
}

-(NSString *)getHyperlinkSubAddress
{
    return (NSString *)[self getCachedValue:[TaskField HYPERLINK_SUBADDRESS]];
}

-(void)setHyperlink:(NSString *)text
{
    [self set:[TaskField HYPERLINK] withObject:text];
}

-(void)setHyperlinkAddress:(NSString *)text
{
    [self set:[TaskField HYPERLINK_ADDRESS] withObject:text];
}

-(void)setHyperlinkSubAddress:(NSString *)text
{
    [self set:[TaskField HYPERLINK_SUBADDRESS] withObject:text];
}

-(Boolean)getLevelAssignments
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField LEVEL_ASSIGNMENTS]]];
}

-(void)setLevelAssignments:(Boolean)flag
{
    [self set:[TaskField LEVEL_ASSIGNMENTS] withBoolean:flag];
}

-(Boolean)getLevelingCanSplit
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField LEVELING_CAN_SPLIT]]];
}

-(void)setLevelingCanSplit:(Boolean)flag
{
    [self set:[TaskField LEVELING_CAN_SPLIT] withBoolean:flag];
}

-(MPPDuration *)getOvertimeWork
{
    return (MPPDuration *)[self getCachedValue:[TaskField OVERTIME_WORK]];
}

-(void)setOvertimeWork:(MPPDuration *)work
{
    [self set:[TaskField OVERTIME_WORK] withObject:work];
}

-(NSDate *)getPreleveledStart
{
    return (NSDate *)[self getCachedValue:[TaskField PRELEVELED_START]];
}

-(NSDate *)getPreleveledFinish
{
    return (NSDate *)[self getCachedValue:[TaskField PRELEVELED_FINISH]];
}

-(void)setPreleveledStart:(NSDate *)date
{
    [self set:[TaskField PRELEVELED_START] withObject:date];
}

-(void)setPreleveledFinish:(NSDate *)date
{
    [self set:[TaskField PRELEVELED_FINISH] withObject:date];
}

-(MPPDuration *)getRemainingOvertimeWork
{
    return (MPPDuration *)[self getCachedValue:[TaskField REMAINING_OVERTIME_WORK]];
}

-(void)setRemainingOvertimeWork:(MPPDuration *)work
{
    [self set:[TaskField REMAINING_OVERTIME_WORK] withObject:work];
}

-(NSNumber *)getRemainingOvertimeCost
{
    return (NSNumber *)[self getCachedValue:[TaskField REMAINING_OVERTIME_COST]];
}

-(void)setRemainingOvertimeCost:(NSNumber *)cost
{
    [self set:[TaskField REMAINING_OVERTIME_COST] withObject:cost];
}

-(ProjectCalendar *)getCalendar
{
    return (ProjectCalendar *)[self getCachedValue:[TaskField CALENDAR]];
}

-(void)setCalendar:(ProjectCalendar *)calendar
{
    [self set:[TaskField CALENDAR] withObject:calendar];
}

-(Boolean)getExpanded
{
    return _expanded;
}

-(void)setExpanded:(Boolean)expanded
{
    _expanded = expanded;
}

-(void)setStartSlack:(MPPDuration *)duration
{
    [self set:[TaskField START_SLACK] withObject:duration];
}

-(void)setFinishSlack:(MPPDuration *)duration
{
    [self set:[TaskField FINISH_SLACK] withObject:duration];
}

-(MPPDuration *)getStartSlack
{
    MPPDuration *startSlack = (MPPDuration *)[self getCachedValue:[TaskField START_SLACK]];
    if(startSlack == nil)
    {
        MPPDuration *duration = [self getDuration];
        if(duration != nil)
        {
            startSlack = [DateUtility getVariance:self withDate1:[self getLateStart] withDate2:[self getEarlyStart] withFormat:[duration getUnits]];
            [self set:[TaskField START_SLACK] withObject:startSlack];
        }
    }
    
    return startSlack;
}

-(MPPDuration *)getFinishSlack
{
    MPPDuration *finishSlack = (MPPDuration *)[self getCachedValue:[TaskField FINISH_SLACK]];
    if(finishSlack == nil)
    {
        MPPDuration *duration = [self getDuration];
        if(duration != nil)
        {
            finishSlack = [DateUtility getVariance:self withDate1:[self getLateFinish] withDate2:[self getEarlyFinish] withFormat:[duration getUnits]];
            [self set:[TaskField FINISH_SLACK] withObject:finishSlack];
        }
    }
    
    return finishSlack;
}

-(NSObject *)getFieldByAlias:(NSString *)alias
{
    return [self getCachedValue:[[self getParentFile] getAliasTaskField:alias]];
}

-(void)setFieldByAlias:(NSString *)alias withValue:(NSObject *)value
{
    [self set:[[self getParentFile] getAliasTaskField:alias] withObject:value];
}

-(NSMutableArray *)getSplits
{
    return _splits;
}

-(void)setSplits:(NSMutableArray *)splits
{
    _splits = splits;
}

-(NSDate *)getSplitCompleteDuration
{
    return _splitsComplete;
}

-(void)setSplitCompleteDuration:(NSDate *)splitsComplete
{
    _splitsComplete = splitsComplete;
}

-(void)remove
{
    [[self getParentFile]removeTask:self];
}

-(SubProject *)getSubProject
{
    return _subProject;
}

-(void)setSubProject:(SubProject *)subProject
{
    _subProject = subProject;
}

-(NSNumber *)getEnterpriseCost:(int)index
{
    return (NSNumber *)[self getCachedValue:[self selectField:[Task ENTERPRISE_COST_FIELDS] withIndex:index]];
}

-(void)setEnterpriseCost:(int)index withValue:(NSNumber *)value
{
    [self set:[self selectField:[Task ENTERPRISE_COST_FIELDS] withIndex:index] withObject:value];
}

-(NSDate *)getEnterpriseDate:(int)index
{
    return (NSDate *)[self getCachedValue:[self selectField:[Task ENTERPRISE_DATE_FIELDS] withIndex:index]];
}

-(void)setEnterpriseDate:(int)index withValue:(NSDate *)value
{
    [self set:[self selectField:[Task ENTERPRISE_DATE_FIELDS] withIndex:index] withObject:value];
}

-(MPPDuration *)getEnterpriseDuration:(int)index
{
    return (MPPDuration *)[self getCachedValue:[self selectField:[Task ENTERPRISE_DURATION_FIELDS] withIndex:index]];
}

-(void)setEnterpriseDuration:(int)index withValue:(MPPDuration *)value
{
    [self set:[self selectField:[Task ENTERPRISE_DURATION_FIELDS] withIndex:index] withObject:value];
}

-(Boolean)getEnterpriseFlag:(int)index
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[self selectField:[Task ENTERPRISE_FLAG_FIELDS] withIndex:index]]];
}

-(void)setEnterpriseFlag:(int)index withValue:(Boolean)value
{
    [self set:[self selectField:[Task ENTERPRISE_FLAG_FIELDS] withIndex:index] withBoolean:value];
}

-(NSNumber *)getEnterpriseNumber:(int)index
{
    return (NSNumber *)[self getCachedValue:[self selectField:[Task ENTERPRISE_NUMBER_FIELDS] withIndex:index]];
}

-(void)setEnterpriseNumber:(int)index withValue:(NSNumber *)value
{
    [self set:[self selectField:[Task ENTERPRISE_NUMBER_FIELDS] withIndex:index] withObject:value];
}

-(NSString *)getEnterpriseText:(int)index
{
    return (NSString *)[self getCachedValue:[self selectField:[Task ENTERPRISE_TEXT_FIELDS] withIndex:index]];
}

-(void)setEnterpriseText:(int)index withValue:(NSString *)value
{
    [self set:[self selectField:[Task ENTERPRISE_TEXT_FIELDS] withIndex:index] withObject:value];
}

-(void)setBaselineCost:(int)baselineNumber withValue:(NSNumber *)value
{
    [self set:[self selectField:[Task BASELINE_COSTS] withIndex:baselineNumber] withObject:value];
}

-(void)setBaselineDuration:(int)baselineNumber withValue:(MPPDuration *)value
{
    [self set:[self selectField:[Task BASELINE_DURATIONS] withIndex:baselineNumber] withObject:value];
}

-(void)setBaselineFinish:(int)baselineNumber withValue:(NSDate *)value
{
    [self set:[self selectField:[Task BASELINE_FINISHES] withIndex:baselineNumber] withObject:value];
}

-(void)setBaselineStart:(int)baselineNumber withValue:(NSDate *)value
{
    [self set:[self selectField:[Task BASELINE_STARTS] withIndex:baselineNumber] withObject:value];
}

-(void)setBaselineWork:(int)baselineNumber withValue:(MPPDuration *)value
{
    [self set:[self selectField:[Task BASELINE_WORKS] withIndex:baselineNumber] withObject:value];
}

-(NSNumber *)getBaslineCost:(int)baseline
{
    return (NSNumber *)[self getCachedValue:[self selectField:[Task BASELINE_COSTS] withIndex:baseline]];
}

-(MPPDuration *)getBaslineDuration:(int)baseline
{
    NSObject *result = [self getCachedValue:[self selectField:[Task BASELINE_DURATIONS] withIndex:baseline]];
    
    if(result == nil)
    {
        result = [self getCachedValue:[self selectField:[Task BASELINE_ESTIMATED_DURATIONS] withIndex:baseline]];
    }
    
    if([result isKindOfClass:[MPPDuration class]] == NO)
    {
        result = nil;
    }
    
    return (MPPDuration *)result;
}

-(NSString *)getBaslineDurationText:(int)baseline
{
    NSObject *result = [self getCachedValue:[self selectField:[Task BASELINE_DURATIONS] withIndex:baseline]];
    
    if(result == nil)
    {
        result = [self getCachedValue:[self selectField:[Task BASELINE_ESTIMATED_DURATIONS] withIndex:baseline]];
    }
    
    if([result isKindOfClass:[MPPDuration class]] == NO)
    {
        result = nil;
    }
    
    return (NSString *)result;
}

-(void)setBaselineDurationText:(int)baselineNumber withValue:(NSString *)value
{
    [self set:[self selectField:[Task BASELINE_DURATIONS] withIndex:baselineNumber] withObject:value];
}

-(NSDate *)getBaselineFinish:(int)baselineNumber
{
    NSObject *result = [self getCachedValue:[self selectField:[Task BASELINE_FINISHES] withIndex:baselineNumber]];
    
    if(result == nil)
    {
        result = [self getCachedValue:[self selectField:[Task BASELINE_ESTIMATED_FINISHES] withIndex:baselineNumber]];
    }
    
    if([result isKindOfClass:[NSDate class]] == NO)
    {
        result = nil;
    }
    
    return (NSDate *)result;
}

-(NSString *)getBaselineFinishText:(int)baselineNumber
{
    NSObject *result = [self getCachedValue:[self selectField:[Task BASELINE_FINISHES] withIndex:baselineNumber]];
    
    if(result == nil)
    {
        result = [self getCachedValue:[self selectField:[Task BASELINE_ESTIMATED_FINISHES] withIndex:baselineNumber]];
    }
    
    if([result isKindOfClass:[NSString class]] == NO)
    {
        result = nil;
    }
    
    return (NSString *)result;
}

-(void)setBaselineFinishText:(int)baselineNumber withValue:(NSString *)value
{
    [self set:[self selectField:[Task BASELINE_FINISHES] withIndex:baselineNumber] withObject:value];
}

-(NSDate *)getBaselineStart:(int)baselineNumber
{
    NSObject *result = [self getCachedValue:[self selectField:[Task BASELINE_STARTS] withIndex:baselineNumber]];
    
    if(result == nil)
    {
        result = [self getCachedValue:[self selectField:[Task BASELINE_ESTIMATED_STARTS] withIndex:baselineNumber]];
    }
    
    if([result isKindOfClass:[NSDate class]] == NO)
    {
        result = nil;
    }
    
    return (NSDate *)result;
}

-(NSString *)getBaselineStartText:(int)baselineNumber
{
    NSObject *result = [self getCachedValue:[self selectField:[Task BASELINE_STARTS] withIndex:baselineNumber]];
    
    if(result == nil)
    {
        result = [self getCachedValue:[self selectField:[Task BASELINE_ESTIMATED_STARTS] withIndex:baselineNumber]];
    }
    
    if([result isKindOfClass:[NSString class]] == NO)
    {
        result = nil;
    }
    
    return (NSString *)result;
}

-(void)setBaselineStartText:(int)baselineNumber withValue:(NSString *)value
{
    [self set:[self selectField:[Task BASELINE_STARTS] withIndex:baselineNumber] withObject:value];
}

-(MPPDuration *)getBaselineWork:(int)baselineNumber
{
    return (MPPDuration *)[self getCachedValue:[self selectField:[Task BASELINE_WORKS] withIndex:baselineNumber]];
}

-(NSDate *)getCompleteThrough
{
    NSDate *value = (NSDate *)[self getCachedValue:[TaskField COMPLETE_THROUGH]];
    if(value == nil)
    {
        int percentComplete = [NumberUtility getInt:[self getPercentageComplete]];
        switch (percentComplete) 
        {
            case 0:
                break;
            case 100:
                value = [self getActualFinish];
                break;
            default:
            {
                MPPDuration *duration = [self getDuration]; 
                double durationValue = ([duration getDuration] * percentComplete) / 100.0;
                duration = [MPPDuration getInstance:durationValue withDoubleType:[duration getUnits]];
                ProjectCalendar *calendar = [self getCalendar];
                if(calendar == nil)
                {
                    calendar = [[self getParentFile]getCalendar];
                }
                
                value = [calendar getDate:[self getActualStart] withDuration:duration withNextWorkStart:true];
                break;
            }   
        }
        
        [self set:[TaskField COMPLETE_THROUGH] withObject:value];
    }
    
    return value;
}

-(NSDate *)getSummaryProgress
{
    return (NSDate *)[self getCachedValue:[TaskField SUMMARY_PROGRESS]];
}

-(void)setSummaryProgress:(NSDate *)value
{
    [self set:[TaskField SUMMARY_PROGRESS] withObject:value];
}

-(NSString *)getGUID
{
    return (NSString *)[self getCachedValue:[TaskField GUID]];
}

-(void)setGUID:(NSString *)value
{
    [self set:[TaskField GUID] withObject:value];
}

-(TaskMode *)getTaskMode
{
    return (TaskMode *)[self getCachedValue:[TaskField TASK_MODE]];
}

-(void)setTaskMode:(TaskMode *)mode
{
    [self set:[TaskField TASK_MODE] withObject:mode];
}

-(Boolean)getActive
{
    return [BooleanUtility getBoolean:(NSNumber *)[self getCachedValue:[TaskField SUMMARY_PROGRESS]]];
}

-(void)setActive:(Boolean)active
{
    [self set:[TaskField ACTIVE] withBoolean:active];
}

-(Boolean)removePredecessor:(Task *)targetTask withType:(RelationType *)type withLag:(MPPDuration *)lag
{
    Boolean matchFound = false;
    
    NSMutableArray *predecessorList = [self getPredecessors];
    if(predecessorList != nil && [predecessorList count] > 0)
    {
        if(lag == nil)
        {
            lag = [MPPDuration getInstance:0 withIntType:[TimeUnit DAYS]];
        }
        
        matchFound = [self removeRelation:predecessorList withTargetTask:targetTask withType:type withLag:lag];
        
        if(matchFound)
        {
            NSMutableArray *successorList = [targetTask getSuccessors];
            if(successorList != nil && [successorList count] > 0)
            {
                [self removeRelation:successorList withTargetTask:self withType:type withLag:lag];
            }
        }
    }
    
    return matchFound;
}

-(Boolean)removeRelation:(NSMutableArray *)relationList withTargetTask:(Task *)targetTask withType:(RelationType *)type withLag:(MPPDuration *)lag
{
    Boolean matchFound = false;
    for(Relation *relation in relationList)
    {
        if([relation getTargetTask] == targetTask)
        {
            if([relation getType] == type && [[relation getLag]compareTo:lag] == 0)
            {
                [relationList removeObject:relation];
                matchFound = true;
                break;
            }
        }
    }
    
    return matchFound;
}

-(TaskField *)selectField:(NSMutableArray *)fields withIndex:(int)index
{
    if (index < 1 || index > [fields count]) {
        [NSException raise:@"Invalid index" format:@"%d is not a valid field index", index];
    }
    
    return (TaskField *)[fields objectAtIndex:index];
}

-(NSObject *)getCachedValue:(id<FieldType>)field
{
    return field == nil ? nil : [_array objectAtIndex:[field getValue]]; 
}

-(NSObject *)getCurrentValue:(id<FieldType>)field
{
    NSObject *result = nil;
    if(field != nil)
    {       
        if((TaskField *)field == [TaskField START_VARIANCE])
        {
            result = [self getStartVariance];
        }else if((TaskField *)field == [TaskField COST_VARIANCE])
        {
            result = [self getStartVariance];
        }else if((TaskField *)field == [TaskField DURATION_VARIANCE])
        {
            result = [self getStartVariance];
        }else if((TaskField *)field == [TaskField WORK_VARIANCE])
        {
            result = [self getStartVariance];
        }else if((TaskField *)field == [TaskField CV])
        {
            result = [self getStartVariance];
        }else if((TaskField *)field == [TaskField SV])
        {
            result = [self getStartVariance];
        }else if((TaskField *)field == [TaskField TOTAL_SLACK])
        {
            result = [self getStartVariance];
        }else if((TaskField *)field == [TaskField CRITICAL])
        {
            result = [self getStartVariance];
        }else if((TaskField *)field == [TaskField COMPLETE_THROUGH])
        {
            result = [self getStartVariance];
        }else 
        {
            result = [_array objectAtIndex:[field getValue]];
        }
    }
    
    return result;
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
    if(field == [TaskField START] || field == [TaskField BASELINE_START])
    {
        [_array replaceObjectAtIndex:[[TaskField START_VARIANCE] getValue] withObject:nil];
    }else if(field == [TaskField FINISH] || field == [TaskField BASELINE_FINISH])
    {
        [_array replaceObjectAtIndex:[[TaskField FINISH_VARIANCE] getValue] withObject:nil];
    }else if(field == [TaskField COST] || field == [TaskField BASELINE_COST])
    {
        [_array replaceObjectAtIndex:[[TaskField COST_VARIANCE] getValue] withObject:nil];
    }else if(field == [TaskField DURATION])
    {
        [_array replaceObjectAtIndex:[[TaskField DURATION_VARIANCE] getValue] withObject:nil];
        [_array replaceObjectAtIndex:[[TaskField COMPLETE_THROUGH] getValue] withObject:nil];
    }else if(field == [TaskField BASELINE_DURATION])
    {
        [_array replaceObjectAtIndex:[[TaskField DURATION_VARIANCE] getValue] withObject:nil];
    }else if(field == [TaskField WORK] || field == [TaskField BASELINE_WORK])
    {
        [_array replaceObjectAtIndex:[[TaskField WORK_VARIANCE] getValue] withObject:nil];
    }else if(field == [TaskField BCWP] || field == [TaskField ACWP])
    {
        [_array replaceObjectAtIndex:[[TaskField CV] getValue] withObject:nil];
        [_array replaceObjectAtIndex:[[TaskField SV] getValue] withObject:nil];
    }else if(field == [TaskField BCWS])
    {
        [_array replaceObjectAtIndex:[[TaskField SV] getValue] withObject:nil];
    }else if(field == [TaskField START_SLACK] || field == [TaskField FINISH_SLACK])
    {
        [_array replaceObjectAtIndex:[[TaskField TOTAL_SLACK] getValue] withObject:nil];
        [_array replaceObjectAtIndex:[[TaskField CRITICAL] getValue] withObject:nil];
    }else if(field == [TaskField EARLY_FINISH] || field == [TaskField LATE_FINISH])
    {
        [_array replaceObjectAtIndex:[[TaskField FINISH_SLACK] getValue] withObject:nil];
        [_array replaceObjectAtIndex:[[TaskField TOTAL_SLACK] getValue] withObject:nil];
        [_array replaceObjectAtIndex:[[TaskField CRITICAL] getValue] withObject:nil];
    }else if(field == [TaskField ACTUAL_START] || field == [TaskField PERCENT_COMPLETE])
    {
        [_array replaceObjectAtIndex:[[TaskField COMPLETE_THROUGH] getValue] withObject:nil];
    }
    
    if(_listeners != nil)
    {
        for (id<FieldListener> listener in _listeners) 
        {
            [listener fieldChange:self withType:field withOldValue:oldValue withNewValue:newValue];
        }
    }
}

-(void)addFieldListener:(id<FieldListener>)listener
{
    if(_listeners == nil)
    {
        _listeners = [[NSMutableArray alloc]init];
    }
    [_listeners addObject:listener];
}

-(void)removeFieldListener:(id<FieldListener>)listener
{
    if(_listeners == nil)
    {
        [_listeners removeObject:listener];
    }
}

-(void)set:(id<FieldType>)field withBoolean:(Boolean)value
{
    [self set:field withObject:[NSNumber numberWithBool:value]];
}

-(NSString *)toString
{
    NSString *project = [self getSubProject] == nil ? @"" : [NSString stringWithFormat:@" project=%@", [[self getSubProject]toString]];
    
    NSString *task = [NSString stringWithFormat:@"[Task id=%d uniqueID=%d name=%@", [self getID], [self getUniqueID], [self getName]];
    
    NSString *externalTask = [self getExternalTask] ? [NSString stringWithFormat:@" [EXTERNAL uid=%d id=%d]"] : @"]";
    
    NSString *result = [task stringByAppendingString:externalTask];
    
    if([project isEqualToString:@""] == NO)
    {
        result = [result stringByAppendingString:project];
    } 
    
    return result;
}

-(Boolean)isPredecessor:(Task *)task
{
    return [self isRelated:task withList:[self getPredecessors]];
}

-(Boolean)isSuccessor:(Task *)task
{
    return [self isRelated:task withList:[self getSuccessors]];
}

-(Boolean)isRelated:(Task *)task withList:(NSMutableArray *)list
{
    Boolean result = false;
    if(list != nil)
    {
        for(Relation *relation in list)
        {
            if([[relation getTargetTask]getUniqueID] == [task getUniqueID])
            {
                result = true;
                break;
            }
        }
    }
    
    return result;
}

-(void)disableEvents
{
    _eventsEnabled = false;
}

-(void)enableEvents
{
    _eventsEnabled = true;
}

+(NSMutableArray *)ENTERPRISE_COST_FIELDS
{
    if(_ENTERPRISE_COST_FIELDS == nil)
    {
        _ENTERPRISE_COST_FIELDS = [[NSMutableArray alloc]initWithObjects:[TaskField ENTERPRISE_COST1], [TaskField ENTERPRISE_COST2], [TaskField ENTERPRISE_COST3], [TaskField ENTERPRISE_COST4], [TaskField ENTERPRISE_COST5], [TaskField ENTERPRISE_COST6], [TaskField ENTERPRISE_COST7], [TaskField ENTERPRISE_COST8], [TaskField ENTERPRISE_COST9], [TaskField ENTERPRISE_COST10], nil];
    }
    return _ENTERPRISE_COST_FIELDS;
}

+(NSMutableArray *)ENTERPRISE_DATE_FIELDS 
{
    if(_ENTERPRISE_DATE_FIELDS == nil)
    {
        _ENTERPRISE_DATE_FIELDS = [[NSMutableArray alloc]initWithObjects:[TaskField ENTERPRISE_DATE1], [TaskField ENTERPRISE_DATE2], [TaskField ENTERPRISE_DATE3], [TaskField ENTERPRISE_DATE4], [TaskField ENTERPRISE_DATE5], [TaskField ENTERPRISE_DATE6], [TaskField ENTERPRISE_DATE7], [TaskField ENTERPRISE_DATE8], [TaskField ENTERPRISE_DATE9], [TaskField ENTERPRISE_DATE10], [TaskField ENTERPRISE_DATE11], [TaskField ENTERPRISE_DATE12], [TaskField ENTERPRISE_DATE13], [TaskField ENTERPRISE_DATE14], [TaskField ENTERPRISE_DATE15], [TaskField ENTERPRISE_DATE16], [TaskField ENTERPRISE_DATE17], [TaskField ENTERPRISE_DATE18], [TaskField ENTERPRISE_DATE19], [TaskField ENTERPRISE_DATE20], [TaskField ENTERPRISE_DATE21], [TaskField ENTERPRISE_DATE22], [TaskField ENTERPRISE_DATE23], [TaskField ENTERPRISE_DATE24], [TaskField ENTERPRISE_DATE25], [TaskField ENTERPRISE_DATE26], [TaskField ENTERPRISE_DATE27], [TaskField ENTERPRISE_DATE28], [TaskField ENTERPRISE_DATE29], [TaskField ENTERPRISE_DATE30], nil];
    }
    return _ENTERPRISE_DATE_FIELDS;
}

+(NSMutableArray *)ENTERPRISE_DURATION_FIELDS 
{
    if(_ENTERPRISE_DURATION_FIELDS == nil)
    {
        _ENTERPRISE_DURATION_FIELDS = [[NSMutableArray alloc]initWithObjects:[TaskField ENTERPRISE_DURATION1], [TaskField ENTERPRISE_DURATION2], [TaskField ENTERPRISE_DURATION3], [TaskField ENTERPRISE_DURATION4], [TaskField ENTERPRISE_DURATION5], [TaskField ENTERPRISE_DURATION6], [TaskField ENTERPRISE_DURATION7], [TaskField ENTERPRISE_DURATION8], [TaskField ENTERPRISE_DURATION9], [TaskField ENTERPRISE_DURATION10], nil];
    }
    return _ENTERPRISE_DURATION_FIELDS;
}

+(NSMutableArray *)ENTERPRISE_FLAG_FIELDS 
{
    if(_ENTERPRISE_FLAG_FIELDS == nil)
    {
        _ENTERPRISE_FLAG_FIELDS = [[NSMutableArray alloc]initWithObjects:[TaskField ENTERPRISE_FLAG1], [TaskField ENTERPRISE_FLAG2], [TaskField ENTERPRISE_FLAG3], [TaskField ENTERPRISE_FLAG4], [TaskField ENTERPRISE_FLAG5], [TaskField ENTERPRISE_FLAG6], [TaskField ENTERPRISE_FLAG7], [TaskField ENTERPRISE_FLAG8], [TaskField ENTERPRISE_FLAG9], [TaskField ENTERPRISE_FLAG10], [TaskField ENTERPRISE_FLAG11], [TaskField ENTERPRISE_FLAG12], [TaskField ENTERPRISE_FLAG13], [TaskField ENTERPRISE_FLAG14], [TaskField ENTERPRISE_FLAG15], [TaskField ENTERPRISE_FLAG16], [TaskField ENTERPRISE_FLAG17], [TaskField ENTERPRISE_FLAG18], [TaskField ENTERPRISE_FLAG19], [TaskField ENTERPRISE_FLAG20], nil];
    }
    return _ENTERPRISE_FLAG_FIELDS;
}

+(NSMutableArray *)ENTERPRISE_NUMBER_FIELDS 
{
    if(_ENTERPRISE_NUMBER_FIELDS == nil)
    {
        _ENTERPRISE_NUMBER_FIELDS = [[NSMutableArray alloc]initWithObjects:[TaskField ENTERPRISE_NUMBER1], [TaskField ENTERPRISE_NUMBER2], [TaskField ENTERPRISE_NUMBER3], [TaskField ENTERPRISE_NUMBER4], [TaskField ENTERPRISE_NUMBER5], [TaskField ENTERPRISE_NUMBER6], [TaskField ENTERPRISE_NUMBER7], [TaskField ENTERPRISE_NUMBER8], [TaskField ENTERPRISE_NUMBER9], [TaskField ENTERPRISE_NUMBER10], [TaskField ENTERPRISE_NUMBER11], [TaskField ENTERPRISE_NUMBER12], [TaskField ENTERPRISE_NUMBER13], [TaskField ENTERPRISE_NUMBER14], [TaskField ENTERPRISE_NUMBER15], [TaskField ENTERPRISE_NUMBER16], [TaskField ENTERPRISE_NUMBER17], [TaskField ENTERPRISE_NUMBER18], [TaskField ENTERPRISE_NUMBER19], [TaskField ENTERPRISE_NUMBER20], [TaskField ENTERPRISE_NUMBER21], [TaskField ENTERPRISE_NUMBER22], [TaskField ENTERPRISE_NUMBER23], [TaskField ENTERPRISE_NUMBER24], [TaskField ENTERPRISE_NUMBER25], [TaskField ENTERPRISE_NUMBER26], [TaskField ENTERPRISE_NUMBER27], [TaskField ENTERPRISE_NUMBER28], [TaskField ENTERPRISE_NUMBER29], [TaskField ENTERPRISE_NUMBER30], [TaskField ENTERPRISE_NUMBER31], [TaskField ENTERPRISE_NUMBER32], [TaskField ENTERPRISE_NUMBER33], [TaskField ENTERPRISE_NUMBER34], [TaskField ENTERPRISE_NUMBER35], [TaskField ENTERPRISE_NUMBER36], [TaskField ENTERPRISE_NUMBER37], [TaskField ENTERPRISE_NUMBER38], [TaskField ENTERPRISE_NUMBER39], [TaskField ENTERPRISE_NUMBER40], nil];
    }
    return _ENTERPRISE_NUMBER_FIELDS;
}

+(NSMutableArray *)ENTERPRISE_TEXT_FIELDS 
{
    if(_ENTERPRISE_TEXT_FIELDS == nil)
    {
        _ENTERPRISE_TEXT_FIELDS = [[NSMutableArray alloc]initWithObjects:[TaskField ENTERPRISE_TEXT1], [TaskField ENTERPRISE_TEXT2], [TaskField ENTERPRISE_TEXT3], [TaskField ENTERPRISE_TEXT4], [TaskField ENTERPRISE_TEXT5], [TaskField ENTERPRISE_TEXT6], [TaskField ENTERPRISE_TEXT7], [TaskField ENTERPRISE_TEXT8], [TaskField ENTERPRISE_TEXT9], [TaskField ENTERPRISE_TEXT10], [TaskField ENTERPRISE_TEXT11], [TaskField ENTERPRISE_TEXT12], [TaskField ENTERPRISE_TEXT13], [TaskField ENTERPRISE_TEXT14], [TaskField ENTERPRISE_TEXT15], [TaskField ENTERPRISE_TEXT16], [TaskField ENTERPRISE_TEXT17], [TaskField ENTERPRISE_TEXT18], [TaskField ENTERPRISE_TEXT19], [TaskField ENTERPRISE_TEXT20], [TaskField ENTERPRISE_TEXT21], [TaskField ENTERPRISE_TEXT22], [TaskField ENTERPRISE_TEXT23], [TaskField ENTERPRISE_TEXT24], [TaskField ENTERPRISE_TEXT25], [TaskField ENTERPRISE_TEXT26], [TaskField ENTERPRISE_TEXT27], [TaskField ENTERPRISE_TEXT28], [TaskField ENTERPRISE_TEXT29], [TaskField ENTERPRISE_TEXT30], [TaskField ENTERPRISE_TEXT31], [TaskField ENTERPRISE_TEXT32], [TaskField ENTERPRISE_TEXT33], [TaskField ENTERPRISE_TEXT34], [TaskField ENTERPRISE_TEXT35], [TaskField ENTERPRISE_TEXT36], [TaskField ENTERPRISE_TEXT37], [TaskField ENTERPRISE_TEXT38], [TaskField ENTERPRISE_TEXT39], [TaskField ENTERPRISE_TEXT40], nil];
    }
    return _ENTERPRISE_TEXT_FIELDS;
}

+(NSMutableArray *)BASELINE_COSTS 
{
    if(_BASELINE_COSTS == nil)
    {
        _BASELINE_COSTS = [[NSMutableArray alloc]initWithObjects:[TaskField BASELINE1_COST], [TaskField BASELINE2_COST], [TaskField BASELINE3_COST], [TaskField BASELINE4_COST], [TaskField BASELINE5_COST], [TaskField BASELINE6_COST], [TaskField BASELINE7_COST], [TaskField BASELINE8_COST], [TaskField BASELINE9_COST], [TaskField BASELINE10_COST], nil];
    }
    return _BASELINE_COSTS;
}

+(NSMutableArray *)BASELINE_DURATIONS 
{
    if(_BASELINE_DURATIONS == nil)
    {
        _BASELINE_DURATIONS = [[NSMutableArray alloc]initWithObjects:[TaskField BASELINE1_DURATION], [TaskField BASELINE2_DURATION], [TaskField BASELINE3_DURATION], [TaskField BASELINE4_DURATION], [TaskField BASELINE5_DURATION], [TaskField BASELINE6_DURATION], [TaskField BASELINE7_DURATION], [TaskField BASELINE8_DURATION], [TaskField BASELINE9_DURATION], [TaskField BASELINE10_DURATION], nil];
    }
    return _BASELINE_DURATIONS;
}

+(NSMutableArray *)BASELINE_ESTIMATED_DURATIONS 
{
    if(_BASELINE_ESTIMATED_DURATIONS == nil)
    {
        _BASELINE_ESTIMATED_DURATIONS = [[NSMutableArray alloc]initWithObjects:[TaskField BASELINE1_ESTIMATED_DURATION], [TaskField BASELINE2_ESTIMATED_DURATION], [TaskField BASELINE3_ESTIMATED_DURATION], [TaskField BASELINE4_ESTIMATED_DURATION], [TaskField BASELINE5_ESTIMATED_DURATION], [TaskField BASELINE6_ESTIMATED_DURATION], [TaskField BASELINE7_ESTIMATED_DURATION], [TaskField BASELINE8_ESTIMATED_DURATION], [TaskField BASELINE9_ESTIMATED_DURATION], [TaskField BASELINE10_ESTIMATED_DURATION], nil];
    }
    return _BASELINE_ESTIMATED_DURATIONS;
}

+(NSMutableArray *)BASELINE_STARTS 
{
    if(_BASELINE_STARTS == nil)
    {
        _BASELINE_STARTS = [[NSMutableArray alloc]initWithObjects:[TaskField BASELINE1_START], [TaskField BASELINE2_START], [TaskField BASELINE3_START], [TaskField BASELINE4_START], [TaskField BASELINE5_START], [TaskField BASELINE6_START], [TaskField BASELINE7_START], [TaskField BASELINE8_START], [TaskField BASELINE9_START], [TaskField BASELINE10_START], nil];
    }
    return _BASELINE_STARTS;
}

+(NSMutableArray *)BASELINE_ESTIMATED_STARTS 
{
    if(_BASELINE_ESTIMATED_STARTS == nil)
    {
        _BASELINE_ESTIMATED_STARTS = [[NSMutableArray alloc]initWithObjects:[TaskField BASELINE1_ESTIMATED_START], [TaskField BASELINE2_ESTIMATED_START], [TaskField BASELINE3_ESTIMATED_START], [TaskField BASELINE4_ESTIMATED_START], [TaskField BASELINE5_ESTIMATED_START], [TaskField BASELINE6_ESTIMATED_START], [TaskField BASELINE7_ESTIMATED_START], [TaskField BASELINE8_ESTIMATED_START], [TaskField BASELINE9_ESTIMATED_START], [TaskField BASELINE10_ESTIMATED_START], nil];
    }
    return _BASELINE_ESTIMATED_STARTS;
}

+(NSMutableArray *)BASELINE_FINISHES 
{
    if(_BASELINE_FINISHES == nil)
    {
        _BASELINE_FINISHES = [[NSMutableArray alloc]initWithObjects:[TaskField BASELINE1_FINISH], [TaskField BASELINE2_FINISH], [TaskField BASELINE3_FINISH], [TaskField BASELINE4_FINISH], [TaskField BASELINE5_FINISH], [TaskField BASELINE6_FINISH], [TaskField BASELINE7_FINISH], [TaskField BASELINE8_FINISH], [TaskField BASELINE9_FINISH], [TaskField BASELINE10_FINISH], nil];
    }
    return _BASELINE_FINISHES;
}

+(NSMutableArray *)BASELINE_ESTIMATED_FINISHES 
{
    if(_BASELINE_ESTIMATED_FINISHES == nil)
    {
        _BASELINE_ESTIMATED_FINISHES = [[NSMutableArray alloc]initWithObjects:[TaskField BASELINE1_ESTIMATED_FINISH], [TaskField BASELINE2_ESTIMATED_FINISH], [TaskField BASELINE3_ESTIMATED_FINISH], [TaskField BASELINE4_ESTIMATED_FINISH], [TaskField BASELINE5_ESTIMATED_FINISH], [TaskField BASELINE6_ESTIMATED_FINISH], [TaskField BASELINE7_ESTIMATED_FINISH], [TaskField BASELINE8_ESTIMATED_FINISH], [TaskField BASELINE9_ESTIMATED_FINISH], [TaskField BASELINE10_ESTIMATED_FINISH], nil];
    }
    return _BASELINE_ESTIMATED_FINISHES;
}

+(NSMutableArray *)BASELINE_WORKS 
{
    if(_BASELINE_WORKS == nil)
    {
        _BASELINE_WORKS = [[NSMutableArray alloc]initWithObjects:[TaskField BASELINE1_WORK], [TaskField BASELINE2_WORK], [TaskField BASELINE3_WORK], [TaskField BASELINE4_WORK], [TaskField BASELINE5_WORK], [TaskField BASELINE6_WORK], [TaskField BASELINE7_WORK], [TaskField BASELINE8_WORK], [TaskField BASELINE9_WORK], [TaskField BASELINE10_WORK], nil];
    }
    return _BASELINE_WORKS;
}

@end
