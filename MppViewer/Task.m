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

@implementation Task

// Default constructor.
//
// @param file Parent file to which this record belongs.
// @param parent Parent task

-(id)init:(ProjectFile *) file: (Task *) parent
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

-(void)generateWBS:(Task *)parent
{
#warning Incomplete
}

-(void)generateOutlineNumber:(Task *)parent
{
#warning Incomplete
}

-(void)setNotes:(NSString *)notes
{
#warning Incomplete
}

-(Task *)addTask
{
#warning Incomplete
}

-(void)addChildTask:(Task *)child with:(int)childOutlineLevel
{
#warning Incomplete
}

-(void)addChildTask:(Task *)child
{
#warning Incomplete
}

-(void)removeChildTask:(Task *) child
{
#warning Incomplete
}

-(void)clearChildTasks
{
#warning Incomplete
}

-(RecurringTask *)addRecurringTask
{
#warning Incomplete
}

-(RecurringTask *)getRecurringTask
{
#warning Incomplete
}

-(ResourceAssignment *)addResourceAssignment:(Resource *)resource
{
#warning Incomplete
}

-(void)addResourceAssignmentWithAssignment:(ResourceAssignment *)assignment
{
#warning Incomplete
}

-(NSMutableArray *)getResourceAssignments
{
#warning Incomplete
}

-(void)removeResourceAssignment:(ResourceAssignment *)assignment
{
#warning Incomplete
}

-(Relation *)addPredecessor:(Task *)targetTask withType:(RelationType *)type withDuration:(MPPDuration *)lag
{
#warning Incomplete
}

-(void)setPercentageComplete:(NSNumber *)val
{
#warning Incomplete
}

-(void)setPercentageWorkComplete:(NSNumber *)val
{
#warning Incomplete
}

-(void)setActualCost:(NSNumber *)val
{
#warning Incomplete
}

-(void)setActualDuration:(MPPDuration *)val
{
#warning Incomplete
}

-(void)setActualFinish:(NSDate *)val
{
#warning Incomplete
}

-(void)setActualStart:(NSDate *)val
{
#warning Incomplete
}

-(void)setActualWork:(MPPDuration *)val
{
#warning Incomplete
}

-(void)setBaselineCost:(NSNumber *)val
{
#warning Incomplete
}

-(void)setBaselineDuration:(MPPDuration *)val
{
#warning Incomplete
}

-(void)setBaselineFinish:(NSDate *)val
{
#warning Incomplete
}

-(void)setBaselineStart:(NSDate *)val
{
#warning Incomplete
}

-(void)setBaselineWork:(MPPDuration *)val
{
#warning Incomplete
}

-(void)setBCWP:(NSNumber *)val
{
#warning Incomplete
}

-(void)setBCWS:(NSNumber *)val
{
#warning Incomplete
}

-(void)setConfirmed:(Boolean) val
{
#warning Incomplete
}

-(void)setConstraintDate:(NSDate *)val
{
#warning Incomplete
}

-(void)setConstraintType:(ConstraintType *)val
{
#warning Incomplete
}

-(void)setContact:(NSString *)val
{
#warning Incomplete
}

-(void)setCost:(NSNumber *)val
{
#warning Incomplete
}

-(void)setCost1:(NSNumber *)val
{
#warning Incomplete
}

-(void)setCost2:(NSNumber *)val
{
#warning Incomplete
}

-(void)setCost3:(NSNumber *)val
{
#warning Incomplete
}

-(void)setCostVariance:(NSNumber *)val
{
#warning Incomplete
}

-(void)setCreateDate:(NSDate *)val
{
#warning Incomplete
}

-(void)setCritical:(Boolean)val
{
#warning Incomplete
}

-(void)setCV:(NSNumber *)val
{
#warning Incomplete
}

-(void)setLevelingDelay:(MPPDuration *)val
{
#warning Incomplete
}

-(void)setDuration:(MPPDuration *)val
{
#warning Incomplete
}

-(void)setDurationText:(NSString *)val
{
#warning Incomplete
}

-(void)setManualDuration:(MPPDuration *)dur
{
#warning Incomplete
}

-(MPPDuration *)getManualDuration
{
#warning Incomplete
}

-(void)setDuration1:(MPPDuration *)duration
{
#warning Incomplete
}

-(void)setDuration2:(MPPDuration *)duration
{
#warning Incomplete
}

-(void)setDuration3:(MPPDuration *)duration
{
#warning Incomplete
}

-(void)setDurationVariance:(MPPDuration *)duration
{
#warning Incomplete
}

-(void)setEarlyFinish:(NSDate *)date
{
#warning Incomplete
}

-(void)setEarlyStart:(NSDate *)date
{
#warning Incomplete
}

-(void)setFinish:(NSDate *)date
{
#warning Incomplete
}

-(void)setFinishText:(NSString *)val
{
#warning Incomplete
}

-(void)setFinish1:(NSDate *)date
{
#warning Incomplete
}

-(void)setFinish2:(NSDate *)date
{
#warning Incomplete
}

-(void)setFinish3:(NSDate *)date
{
#warning Incomplete
}

-(void)setFinish4:(NSDate *)date
{
#warning Incomplete
}

-(void)setFinish5:(NSDate *)date
{
#warning Incomplete
}

-(void)setFinishVariance:(MPPDuration *)duration
{
#warning Incomplete
}

-(void)setFixedCost:(NSNumber *)val
{
#warning Incomplete
}

-(void)setFlag1:(Boolean)val
{
#warning Incomplete
}

-(void)setFlag2:(Boolean)val
{
#warning Incomplete
}

-(void)setFlag3:(Boolean)val
{
#warning Incomplete
}

-(void)setFlag4:(Boolean)val
{
#warning Incomplete
}

-(void)setFlag5:(Boolean)val
{
#warning Incomplete
}

-(void)setFlag6:(Boolean)val
{
#warning Incomplete
}

-(void)setFlag7:(Boolean)val
{
#warning Incomplete
}

-(void)setFlag8:(Boolean)val
{
#warning Incomplete
}

-(void)setFlag9:(Boolean)val
{
#warning Incomplete
}

-(void)setFlag10:(Boolean)val
{
#warning Incomplete
}

-(void)setFreeSlack:(MPPDuration *)duration
{
#warning Incomplete
}

-(void)setHideBar:(Boolean)flag
{
#warning Incomplete
}

-(void)setID:(NSInteger)val
{
#warning Incomplete
}

-(void)setLateFinish:(NSDate *)date
{
#warning Incomplete
}

-(void)setLateStart:(NSDate *)date
{
#warning Incomplete
}

-(void)setLinkedFields:(Boolean)flag
{
#warning Incomplete
}

-(void)setMarked:(Boolean)flag
{
#warning Incomplete
}

-(void)setMilestone:(Boolean)flag
{
#warning Incomplete
}

-(void)setName:(NSString *)name
{
#warning Incomplete
}

-(void)setNumber1:(NSNumber *)val
{
#warning Incomplete
}

-(void)setNumber2:(NSNumber *)val
{
#warning Incomplete
}

-(void)setNumber3:(NSNumber *)val
{
#warning Incomplete
}

-(void)setNumber4:(NSNumber *)val
{
#warning Incomplete
}

-(void)setNumber5:(NSNumber *)val
{
#warning Incomplete
}

-(void)setObjects:(NSInteger)val
{
#warning Incomplete
}

-(void)setOutlineLevel:(NSInteger)val
{
#warning Incomplete
}

-(void)setOutlineNumber:(NSString *)val
{
#warning Incomplete
}

-(void)setPriority:(Priority *)priority
{
#warning Incomplete
}

-(void)setProject:(NSString *)val
{
#warning Incomplete
}

-(void)setRemainingCost:(NSNumber *)val
{
#warning Incomplete
}

-(void)setRemainingDuration:(MPPDuration *)val
{
#warning Incomplete
}

-(void)setRemainingWork:(MPPDuration *)val
{
#warning Incomplete
}

-(void)setResourceGroup:(NSString *)val
{
#warning Incomplete
}

-(void)setResourceInitials:(NSString *)val
{
#warning Incomplete
}

-(void)setResourceNames:(NSString *)val
{
#warning Incomplete
}

-(void)setResume:(NSDate *)val
{
#warning Incomplete
}

-(void)setRollup:(Boolean)val
{
#warning Incomplete
}

-(void)setStart:(NSDate *)val
{
#warning Incomplete
}

-(void)setStartText:(NSString *)val
{
#warning Incomplete
}

-(void)setStart1:(NSDate *)val
{
#warning Incomplete
}

-(void)setStart2:(NSDate *)val
{
#warning Incomplete
}

-(void)setStart3:(NSDate *)val
{
#warning Incomplete
}

-(void)setStart4:(NSDate *)val
{
#warning Incomplete
}

-(void)setStart5:(NSDate *)val
{
#warning Incomplete
}

-(void)setStartVariance:(MPPDuration *)val
{
#warning Incomplete
}

-(void)setStop:(NSDate *)val
{
#warning Incomplete
}

-(void)setSubprojectName:(NSString *)val
{
#warning Incomplete
}

-(void)setSummary:(Boolean)val
{
#warning Incomplete
}

-(void)setSV:(NSNumber *)val
{
#warning Incomplete
}

-(void)setText1:(NSString *)val
{
#warning Incomplete
}

-(void)setText2:(NSString *)val
{
#warning Incomplete
}

-(void)setText3:(NSString *)val
{
#warning Incomplete
}

-(void)setText4:(NSString *)val
{
#warning Incomplete
}

-(void)setText5:(NSString *)val
{
#warning Incomplete
}

-(void)setText6:(NSString *)val
{
#warning Incomplete
}

-(void)setText7:(NSString *)val
{
#warning Incomplete
}

-(void)setText8:(NSString *)val
{
#warning Incomplete
}

-(void)setText9:(NSString *)val
{
#warning Incomplete
}

-(void)setText10:(NSString *)val
{
#warning Incomplete
}

-(void)setTotalSlack:(MPPDuration *)val
{
#warning Incomplete
}

-(void)setUniqueID:(NSInteger)val
{
#warning Incomplete
}

-(void)setUpdateNeeded:(Boolean)val
{
#warning Incomplete
}

-(void)setWBS:(NSString *)val
{
#warning Incomplete
}

-(void)setWork:(MPPDuration *)val
{
#warning Incomplete
}

-(void)setWorkVariance:(MPPDuration *)val
{
#warning Incomplete
}

-(NSNumber *)getPercentageComplete
{
#warning Incomplete
}

-(NSNumber *)getPercentageWorkComplete
{
#warning Incomplete
}

-(NSNumber *)getActualCost
{
#warning Incomplete
}

-(MPPDuration *)getActualDuration
{
#warning Incomplete
}

-(NSDate *)getActualFinish
{
#warning Incomplete
}

-(NSDate *)getActualStart
{
#warning Incomplete
}

-(MPPDuration *)getActualWork
{
#warning Incomplete
}

-(NSNumber *)getBaselineCost
{
#warning Incomplete
}

-(MPPDuration *)getBaselineDuration
{
#warning Incomplete
}

-(NSString *)getBaselineDurationText
{
#warning Incomplete
}

-(void)setBaselineDurationText:(NSString *)val
{
#warning Incomplete
}

-(NSDate *)getBaselineFinish
{
#warning Incomplete
}

-(NSString *)getBaselineFinishText
{
#warning Incomplete
}

-(void)setBaselineFinishText:(NSString *)val
{
#warning Incomplete
}

-(NSDate *)getBaselineStart
{
#warning Incomplete
}

-(NSString *)getBaselineStartText
{
#warning Incomplete
}

-(void)setBaselineStartText:(NSString *)val
{
#warning Incomplete
}

-(MPPDuration *)getBaselineWork
{
#warning Incomplete
}

-(NSNumber *)getBCWP
{
#warning Incomplete
}

-(NSNumber *)getBCWS
{
#warning Incomplete
}

-(Boolean)getConfirmed
{
#warning Incomplete
}

-(NSDate *)getConstraintDate
{
#warning Incomplete
}

-(ConstraintType *)getConstraintType
{
#warning Incomplete
}

-(NSString *)getContact
{
#warning Incomplete
}

-(NSNumber *)getCost
{
#warning Incomplete
}

-(NSNumber *)getCost1
{
#warning Incomplete
}

-(NSNumber *)getCost2
{
#warning Incomplete
}

-(NSNumber *)getCost3
{
#warning Incomplete
}

-(NSNumber *)getCostVariance
{
#warning Incomplete
}

-(NSDate *)getCreateDate
{
#warning Incomplete
}

-(Boolean)getCritical
{
#warning Incomplete
}

-(NSNumber *)getCV
{
#warning Incomplete
}

-(MPPDuration *)getLevelingDelay
{
#warning Incomplete
}

-(MPPDuration *)getDuration
{
#warning Incomplete
}

-(NSString *)getDurationText
{
#warning Incomplete
}

-(MPPDuration *)getDuration1
{
#warning Incomplete
}

-(MPPDuration *)getDuration2
{
#warning Incomplete
}

-(MPPDuration *)getDuration3
{
#warning Incomplete
}

-(MPPDuration *)getDurationVariance
{
#warning Incomplete
}

-(NSDate *)getEarlyFinish
{
#warning Incomplete
}

-(NSDate *)getEarlyStart
{
#warning Incomplete
}

-(NSDate *)getFinish
{
#warning Incomplete
}

-(NSString *)getFinishText
{
#warning Incomplete
}

-(NSDate *)getFinish1
{
#warning Incomplete
}

-(NSDate *)getFinish2
{
#warning Incomplete
}

-(NSDate *)getFinish3
{
#warning Incomplete
}

-(NSDate *)getFinish4
{
#warning Incomplete
}

-(NSDate *)getFinish5
{
#warning Incomplete
}

-(NSDate *)getFinishVariance
{
#warning Incomplete
}

-(NSNumber *)getFixedCost
{
#warning Incomplete
}

-(Boolean)getFlag1
{
#warning Incomplete
}

-(Boolean)getFlag2
{
#warning Incomplete
}

-(Boolean)getFlag3
{
#warning Incomplete
}

-(Boolean)getFlag4
{
#warning Incomplete
}

-(Boolean)getFlag5
{
#warning Incomplete
}

-(Boolean)getFlag6
{
#warning Incomplete
}

-(Boolean)getFlag7
{
#warning Incomplete
}

-(Boolean)getFlag8
{
#warning Incomplete
}

-(Boolean)getFlag9
{
#warning Incomplete
}

-(Boolean)getFlag10
{
#warning Incomplete
}

-(MPPDuration *)getFreeSlack
{
#warning Incomplete
}

-(Boolean)getHideBar
{
#warning Incomplete
}

-(NSInteger)getID
{
#warning Incomplete
}

-(NSDate *)getLateFinish
{
#warning Incomplete
}

-(NSDate *)getLateStart
{
#warning Incomplete
}

-(Boolean)getLinkedFields
{
#warning Incomplete
}

-(Boolean)getMarked
{
#warning Incomplete
}

-(Boolean)getMilestone
{
#warning Incomplete
}

-(NSString *)getName
{
#warning Incomplete
}

-(NSString *)getNotes
{
#warning Incomplete
}

-(NSNumber *)getNumber1
{
#warning Incomplete
}

-(NSNumber *)getNumber2
{
#warning Incomplete
}

-(NSNumber *)getNumber3
{
#warning Incomplete
}

-(NSNumber *)getNumber4
{
#warning Incomplete
}

-(NSNumber *)getNumber5
{
#warning Incomplete
}

-(NSInteger)getObjects
{
#warning Incomplete
}

-(NSInteger)getOutlineLevel
{
#warning Incomplete
}

-(NSString *)getOutlineNumber
{
#warning Incomplete
}

-(NSMutableArray *)getPredecessors
{
#warning Incomplete
}

-(NSMutableArray *)getSuccessors
{
#warning Incomplete
}

-(Priority *)getPriority
{
#warning Incomplete
}

-(NSString *)getProject
{
#warning Incomplete
}

-(NSNumber *)getRemainingCost
{
#warning Incomplete
}

-(MPPDuration *)getRemainingDuration
{
#warning Incomplete
}

-(MPPDuration *)getRemainingWork
{
#warning Incomplete
}

-(NSString *)getResourceGroup
{
#warning Incomplete
}

-(NSString *)getResourceInitials
{
#warning Incomplete
}

-(NSString *)getResourceNames
{
#warning Incomplete
}

-(NSDate *)getResume
{
#warning Incomplete
}

-(Boolean)getRoolUp
{
#warning Incomplete
}

-(NSDate *)getStart
{
#warning Incomplete
}

-(NSString *)getStartText
{
#warning Incomplete
}

-(NSDate *)getStart1
{
#warning Incomplete
}

-(NSDate *)getStart2
{
#warning Incomplete
}

-(NSDate *)getStart3
{
#warning Incomplete
}

-(NSDate *)getStart4
{
#warning Incomplete
}

-(NSDate *)getStart5
{
#warning Incomplete
}

-(MPPDuration *)getStartVariance
{
#warning Incomplete
}

-(NSDate *)getStop
{
#warning Incomplete
}

-(NSString *)getSubprojectName
{
#warning Incomplete
}

-(Boolean)getSummary
{
#warning Incomplete
}

-(NSNumber *)getSV
{
#warning Incomplete
}

-(NSString *)getText1
{
#warning Incomplete
}

-(NSString *)getText2
{
#warning Incomplete
}

-(NSString *)getText3
{
#warning Incomplete
}

-(NSString *)getText4
{
#warning Incomplete
}

-(NSString *)getText5
{
#warning Incomplete
}

-(NSString *)getText6
{
#warning Incomplete
}

-(NSString *)getText7
{
#warning Incomplete
}

-(NSString *)getText8
{
#warning Incomplete
}

-(NSString *)getText9
{
#warning Incomplete
}

-(NSString *)getText10
{
#warning Incomplete
}

-(MPPDuration *)getTotalSlack
{
#warning Incomplete
}

-(NSInteger)getUniqueID
{
#warning Incomplete
}

-(Boolean)getUpdatedNeeded
{
#warning Incomplete
}

-(NSString *)getWBS
{
#warning Incomplete
}

-(MPPDuration *)getWork
{
#warning Incomplete
}

-(MPPDuration *)getWorkVariance
{
#warning Incomplete
}

-(int)getChildTaskCount
{
#warning Incomplete
}

-(Task *)getParentTask
{
#warning Incomplete
}

-(NSMutableArray *)getChildTasks
{
#warning Incomplete
}

-(int)compareTo:(Task *)o
{
#warning Incomplete
}

-(Boolean)getEstimated
{
#warning Incomplete
}

-(void)setEstimated:(Boolean)estimated
{
#warning Incomplete
}

-(NSDate *)getDeadline
{
#warning Incomplete
}

-(void)setDeadLine:(NSDate *)deadline
{
#warning Incomplete
}

-(TaskType *)getType
{
#warning Incomplete
}

-(void)setType:(TaskType *)type
{
#warning Incomplete
}

-(Boolean)getNull
{
#warning Incomplete
}

-(void)setNull:(Boolean)isNull
{
#warning Incomplete
}

-(NSString *)getWBSLevel
{
#warning Incomplete
}

-(void)setWBSLevel:(NSString *)wbsLevel
{
#warning Incomplete
}

-(Boolean)getResumeValid
{
#warning Incomplete
}

-(void)setResumeValid:(Boolean)resumeValid
{
#warning Incomplete
}

-(Boolean)getRecurring
{
#warning Incomplete
}

-(void)setRecurring:(Boolean)recurring
{
#warning Incomplete
}

-(Boolean)getOverAllocated
{
#warning Incomplete
}

-(void)setOverAllocated:(Boolean)overAllocated
{
#warning Incomplete
}

-(NSInteger)getSubprojectTaskUniqueID
{
#warning Incomplete
}

-(void)setSubprojectTaskUniqueID:(NSInteger)subprojectUniqueTaskID
{
#warning Incomplete
}

-(NSInteger)getSubprojectTaskID
{
#warning Incomplete
}

-(void)setSubprojectTaskID:(NSInteger)subprojectTaskID
{
#warning Incomplete
}

-(void)setSubprojectTaskUniqueIDOffset:(NSInteger)offset
{
#warning Incomplete
}

-(NSInteger)getSubprojectTaskUniqueIDOffset
{
#warning Incomplete
}

-(Boolean)getSubprojectReadOnly
{
#warning Incomplete
}

-(void)setSubprojectReadOnly
{
#warning Incomplete
}

-(Boolean)getExternalTask
{
#warning Incomplete
}

-(void)setExternalTask:(Boolean)externalTask
{
#warning Incomplete
}

-(NSString *)getExternalTaskProject
{
#warning Incomplete
}

-(void)setExternalTaskProject:(NSString *)externalTaskProject
{
#warning Incomplete
}

-(NSNumber *)getACWP
{
#warning Incomplete
}

-(void)setACWP:(NSNumber *)acwp
{
#warning Incomplete
}

-(TimeUnit *)getLevelingDelayFormat
{
#warning Incomplete
}

-(void)setLevelingDelayFormat:(TimeUnit *)levelingDelayFormat
{
#warning Incomplete
}

-(Boolean)getIgnoreResourceCalendar
{
#warning Incomplete
}

-(void)setIgnoreResourceCalendar:(Boolean)ignoreResourceCalendar
{
#warning Incomplete
}

-(NSInteger)getPhysicalPercentComplete
{
#warning Incomplete
}

-(void)setPhysicalPercentComplete:(NSInteger)physicalPercentComplete
{
#warning Incomplete
}

-(EarnedValueMethod *)getEarnedValueMethod
{
#warning Incomplete
}

-(void)setEarnedValueMethod:(EarnedValueMethod *)earnedValueMethod
{
#warning Incomplete
}

-(MPPDuration *)getActualWorkProtected
{
#warning Incomplete
}

-(void)setActualWorkProtected:(MPPDuration *)actualWorkProtected
{
#warning Incomplete
}

-(MPPDuration *)getActualOvertimeWorkProtected
{
#warning Incomplete
}

-(void)setActualOvertimeWorkProtected:(MPPDuration *)actualOvertimeWorkProtected
{
#warning Incomplete
}

-(MPPDuration *)getRegularWork
{
#warning Incomplete
}

-(void)setRegularWork:(MPPDuration *)regularWork
{
#warning Incomplete
}

-(Boolean)getFlag11
{
#warning Incomplete
}

-(Boolean)getFlag12
{
#warning Incomplete
}

-(Boolean)getFlag13
{
#warning Incomplete
}

-(Boolean)getFlag14
{
#warning Incomplete
}

-(Boolean)getFlag15
{
#warning Incomplete
}

-(Boolean)getFlag16
{
#warning Incomplete
}

-(Boolean)getFlag17
{
#warning Incomplete
}

-(Boolean)getFlag18
{
#warning Incomplete
}

-(Boolean)getFlag19
{
#warning Incomplete
}

-(Boolean)getFlag20
{
#warning Incomplete
}

-(void)setFlag11:(Boolean)b
{
#warning Incomplete
}

-(void)setFlag12:(Boolean)b
{
#warning Incomplete
}

-(void)setFlag13:(Boolean)b
{
#warning Incomplete
}

-(void)setFlag14:(Boolean)b
{
#warning Incomplete
}

-(void)setFlag15:(Boolean)b
{
#warning Incomplete
}

-(void)setFlag16:(Boolean)b
{
#warning Incomplete
}

-(void)setFlag17:(Boolean)b
{
#warning Incomplete
}

-(void)setFlag18:(Boolean)b
{
#warning Incomplete
}

-(void)setFlag19:(Boolean)b
{
#warning Incomplete
}

-(void)setFlag20:(Boolean)b
{
#warning Incomplete
}

-(void)setEffortDriven:(Boolean)flag
{
#warning Incomplete
}

-(Boolean)getEffortDriven
{
#warning Incomplete
}

-(NSString *)getText11
{
#warning Incomplete
}

-(NSString *)getText12
{
#warning Incomplete
}

-(NSString *)getText13
{
#warning Incomplete
}

-(NSString *)getText14
{
#warning Incomplete
}

-(NSString *)getText15
{
#warning Incomplete
}

-(NSString *)getText16
{
#warning Incomplete
}

-(NSString *)getText17
{
#warning Incomplete
}

-(NSString *)getText18
{
#warning Incomplete
}

-(NSString *)getText19
{
#warning Incomplete
}

-(NSString *)getText20
{
#warning Incomplete
}

-(NSString *)getText21
{
#warning Incomplete
}

-(NSString *)getText22
{
#warning Incomplete
}

-(NSString *)getText23
{
#warning Incomplete
}

-(NSString *)getText24
{
#warning Incomplete
}

-(NSString *)getText25
{
#warning Incomplete
}

-(NSString *)getText26
{
#warning Incomplete
}

-(NSString *)getText27
{
#warning Incomplete
}

-(NSString *)getText28
{
#warning Incomplete
}

-(NSString *)getText29
{
#warning Incomplete
}

-(NSString *)getText30
{
#warning Incomplete
}

-(void)setText11:(NSString *)string
{
#warning Incomplete
}

-(void)setText12:(NSString *)string
{
#warning Incomplete
}

-(void)setText13:(NSString *)string
{
#warning Incomplete
}

-(void)setText14:(NSString *)string
{
#warning Incomplete
}

-(void)setText15:(NSString *)string
{
#warning Incomplete
}

-(void)setText16:(NSString *)string
{
#warning Incomplete
}

-(void)setText17:(NSString *)string
{
#warning Incomplete
}

-(void)setText18:(NSString *)string
{
#warning Incomplete
}

-(void)setText19:(NSString *)string
{
#warning Incomplete
}

-(void)setText20:(NSString *)string
{
#warning Incomplete
}

-(void)setText21:(NSString *)string
{
#warning Incomplete
}

-(void)setText22:(NSString *)string
{
#warning Incomplete
}

-(void)setText23:(NSString *)string
{
#warning Incomplete
}

-(void)setText24:(NSString *)string
{
#warning Incomplete
}

-(void)setText25:(NSString *)string
{
#warning Incomplete
}

-(void)setText26:(NSString *)string
{
#warning Incomplete
}

-(void)setText27:(NSString *)string
{
#warning Incomplete
}

-(void)setText28:(NSString *)string
{
#warning Incomplete
}

-(void)setText29:(NSString *)string
{
#warning Incomplete
}

-(void)setText30:(NSString *)string
{
#warning Incomplete
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
#warning Incomplete
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
