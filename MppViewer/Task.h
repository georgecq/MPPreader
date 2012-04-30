//
//  Task.h
//  mppParser
//
//  Created by George on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreFoundation/CoreFoundation.h"
#import "ProjectEntity.h"
#import "FieldContainer.h"
#import "FieldType.h"
#import "FieldListener.h"

@class ResourceAssignment;
@class RecurringTask;
@class Resource;
@class Relation;
@class RelationType;
@class MPPDuration;
@class ConstraintType;
@class Priority;
@class TaskType;
@class TaskMode;
@class TimeUnit;
@class EarnedValueMethod;
@class AccrueType;
@class SubProject;
@class ProjectCalendar;

@interface Task : ProjectEntity <FieldContainer>
{
    NSMutableArray *_array;
    Task *_parent;
    NSMutableArray *_children;
    NSMutableArray *_assignments;
    RecurringTask *_recurringTask;
    
    Boolean _eventsEnabled;
    Boolean _null;
    NSString *_wbsLevel;
    Boolean _resumeValid;
    NSString *_externalTaskProject;
    TimeUnit *_levelingDelayFormat;
    EarnedValueMethod *_earnedValueMethod;
    MPPDuration *_actualWorkProtected;
    MPPDuration *_actualOvertimeWorkProtected;
    Boolean _expanded;
    
    NSMutableArray *_splits;
    NSDate *_splitsComplete;
    SubProject *_subProject;
    NSMutableArray *_listeners;
}

-(id)init:(ProjectFile *)file withParent:(Task *)parent;

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

-(Relation *)addPredecessor:(Task *)targetTask withType:(RelationType *)type withDuration:(MPPDuration *)lag;

-(void)setPercentageComplete:(NSNumber *)val;

-(void)setPercentageWorkComplete:(NSNumber *)val;

-(void)setActualCost:(NSNumber *)val;

-(void)setActualDuration:(MPPDuration *)val;

-(void)setActualFinish:(NSDate *)val;

-(void)setActualStart:(NSDate *)val;

-(void)setActualWork:(MPPDuration *)val;

-(void)setBaselineCost:(NSNumber *)val;

-(void)setBaselineDuration:(MPPDuration *)val;

-(void)setBaselineFinish:(NSDate *)val;

-(void)setBaselineStart:(NSDate *)val;

-(void)setBaselineWork:(MPPDuration *)val;

-(void)setBCWP:(NSNumber *)val;

-(void)setBCWS:(NSNumber *)val;

-(void)setConfirmed:(Boolean) val;

-(void)setConstraintDate:(NSDate *)val;

-(void)setConstraintType:(ConstraintType *)val;

-(void)setContact:(NSString *)val;

-(void)setCost:(NSNumber *)val;

-(void)setCost1:(NSNumber *)val;

-(void)setCost2:(NSNumber *)val;

-(void)setCost3:(NSNumber *)val;

-(void)setCostVariance:(NSNumber *)val;

-(void)setCreateDate:(NSDate *)val;

-(void)setCritical:(Boolean)val;

-(void)setCV:(NSNumber *)val;

-(void)setLevelingDelay:(MPPDuration *)val;

-(void)setDuration:(MPPDuration *)val;

-(void)setDurationText:(NSString *)val;

-(void)setManualDuration:(MPPDuration *)dur;

-(MPPDuration *)getManualDuration;

-(void)setDuration1:(MPPDuration *)duration;

-(void)setDuration2:(MPPDuration *)duration;

-(void)setDuration3:(MPPDuration *)duration;

-(void)setDurationVariance:(MPPDuration *)duration;

-(void)setEarlyFinish:(NSDate *)date;

-(void)setEarlyStart:(NSDate *)date;

-(void)setFinish:(NSDate *)date;

-(void)setFinishText:(NSString *)val;

-(void)setFinish1:(NSDate *)date;

-(void)setFinish2:(NSDate *)date;

-(void)setFinish3:(NSDate *)date;

-(void)setFinish4:(NSDate *)date;

-(void)setFinish5:(NSDate *)date;

-(void)setFinishVariance:(MPPDuration *)duration;

-(void)setFixedCost:(NSNumber *)val;

-(void)setFlag1:(Boolean)val;

-(void)setFlag2:(Boolean)val;

-(void)setFlag3:(Boolean)val;

-(void)setFlag4:(Boolean)val;

-(void)setFlag5:(Boolean)val;

-(void)setFlag6:(Boolean)val;

-(void)setFlag7:(Boolean)val;

-(void)setFlag8:(Boolean)val;

-(void)setFlag9:(Boolean)val;

-(void)setFlag10:(Boolean)val;

-(void)setFreeSlack:(MPPDuration *)duration;

-(void)setHideBar:(Boolean)flag;

-(void)setID:(NSNumber *)val;

-(void)setLateFinish:(NSDate *)date;

-(void)setLateStart:(NSDate *)date;

-(void)setLinkedFields:(Boolean)flag;

-(void)setMarked:(Boolean)flag;

-(void)setMilestone:(Boolean)flag;

-(void)setName:(NSString *)name;

-(void)setNumber1:(NSNumber *)val;

-(void)setNumber2:(NSNumber *)val;

-(void)setNumber3:(NSNumber *)val;

-(void)setNumber4:(NSNumber *)val;

-(void)setNumber5:(NSNumber *)val;

-(void)setObjects:(NSNumber *)val;

-(void)setOutlineLevel:(NSNumber *)val;

-(void)setOutlineNumber:(NSString *)val;

-(void)setPriority:(Priority *)priority;

-(void)setProject:(NSString *)val;

-(void)setRemainingCost:(NSNumber *)val;

-(void)setRemainingDuration:(MPPDuration *)val;

-(void)setRemainingWork:(MPPDuration *)val;

-(void)setResourceGroup:(NSString *)val;

-(void)setResourceInitials:(NSString *)val;

-(void)setResourceNames:(NSString *)val;

-(void)setResume:(NSDate *)val;

-(void)setRollup:(Boolean)val;

-(void)setStart:(NSDate *)val;

-(void)setStartText:(NSString *)val;

-(void)setStart1:(NSDate *)val;

-(void)setStart2:(NSDate *)val;

-(void)setStart3:(NSDate *)val;

-(void)setStart4:(NSDate *)val;

-(void)setStart5:(NSDate *)val;

-(void)setStartVariance:(MPPDuration *)val;

-(void)setStop:(NSDate *)val;

-(void)setSubprojectName:(NSString *)val;

-(void)setSummary:(Boolean)val;

-(void)setSV:(NSNumber *)val;

-(void)setText1:(NSString *)val;

-(void)setText2:(NSString *)val;

-(void)setText3:(NSString *)val;

-(void)setText4:(NSString *)val;

-(void)setText5:(NSString *)val;

-(void)setText6:(NSString *)val;

-(void)setText7:(NSString *)val;

-(void)setText8:(NSString *)val;

-(void)setText9:(NSString *)val;

-(void)setText10:(NSString *)val;

-(void)setTotalSlack:(MPPDuration *)val;

-(void)setUniqueID:(NSNumber *)val;

-(void)setUpdateNeeded:(Boolean)val;

-(void)setWBS:(NSString *)val;

-(void)setWork:(MPPDuration *)val;

-(void)setWorkVariance:(MPPDuration *)val;

-(NSNumber *)getPercentageComplete;

-(NSNumber *)getPercentageWorkComplete;

-(NSNumber *)getActualCost;

-(MPPDuration *)getActualDuration;

-(NSDate *)getActualFinish;

-(NSDate *)getActualStart;

-(MPPDuration *)getActualWork;

-(NSNumber *)getBaselineCost;

-(MPPDuration *)getBaselineDuration;

-(NSString *)getBaselineDurationText;

-(void)setBaselineDurationText:(NSString *)val;

-(NSDate *)getBaselineFinish;

-(NSString *)getBaselineFinishText;

-(void)setBaselineFinishText:(NSString *)val;

-(NSDate *)getBaselineStart;

-(NSString *)getBaselineStartText;

-(void)setBaselineStartText:(NSString *)val;

-(MPPDuration *)getBaselineWork;

-(NSNumber *)getBCWP;

-(NSNumber *)getBCWS;

-(Boolean)getConfirmed;

-(NSDate *)getConstraintDate;

-(ConstraintType *)getConstraintType;

-(NSString *)getContact;

-(NSNumber *)getCost;

-(NSNumber *)getCost1;

-(NSNumber *)getCost2;

-(NSNumber *)getCost3;

-(NSNumber *)getCostVariance;

-(NSDate *)getCreateDate;

-(Boolean)getCritical;

-(NSNumber *)getCV;

-(MPPDuration *)getLevelingDelay;

-(MPPDuration *)getDuration;

-(NSString *)getDurationText;

-(MPPDuration *)getDuration1;

-(MPPDuration *)getDuration2;

-(MPPDuration *)getDuration3;

-(MPPDuration *)getDurationVariance;

-(NSDate *)getEarlyFinish;

-(NSDate *)getEarlyStart;

-(NSDate *)getFinish;

-(NSString *)getFinishText;

-(NSDate *)getFinish1;

-(NSDate *)getFinish2;

-(NSDate *)getFinish3;

-(NSDate *)getFinish4;

-(NSDate *)getFinish5;

-(NSDate *)getFinishVariance;

-(NSNumber *)getFixedCost;

-(Boolean)getFlag1;

-(Boolean)getFlag2;

-(Boolean)getFlag3;

-(Boolean)getFlag4;

-(Boolean)getFlag5;

-(Boolean)getFlag6;

-(Boolean)getFlag7;

-(Boolean)getFlag8;

-(Boolean)getFlag9;

-(Boolean)getFlag10;

-(MPPDuration *)getFreeSlack;

-(Boolean)getHideBar;

-(NSNumber *)getID;

-(NSDate *)getLateFinish;

-(NSDate *)getLateStart;

-(Boolean)getLinkedFields;

-(Boolean)getMarked;

-(Boolean)getMilestone;

-(NSString *)getName;

-(NSString *)getNotes;

-(NSNumber *)getNumber1;

-(NSNumber *)getNumber2;

-(NSNumber *)getNumber3;

-(NSNumber *)getNumber4;

-(NSNumber *)getNumber5;

-(NSNumber *)getObjects;

-(NSNumber *)getOutlineLevel;

-(NSString *)getOutlineNumber;

-(NSMutableArray *)getPredecessors;

-(NSMutableArray *)getSuccessors;

-(Priority *)getPriority;

-(NSString *)getProject;

-(NSNumber *)getRemainingCost;

-(MPPDuration *)getRemainingDuration;

-(MPPDuration *)getRemainingWork;

-(NSString *)getResourceGroup;

-(NSString *)getResourceInitials;

-(NSString *)getResourceNames;

-(NSDate *)getResume;

-(Boolean)getRoolUp;

-(NSDate *)getStart;

-(NSString *)getStartText;

-(NSDate *)getStart1;

-(NSDate *)getStart2;

-(NSDate *)getStart3;

-(NSDate *)getStart4;

-(NSDate *)getStart5;

-(MPPDuration *)getStartVariance;

-(NSDate *)getStop;

-(NSString *)getSubprojectName;

-(Boolean)getSummary;

-(NSNumber *)getSV;

-(NSString *)getText1;

-(NSString *)getText2;

-(NSString *)getText3;

-(NSString *)getText4;

-(NSString *)getText5;

-(NSString *)getText6;

-(NSString *)getText7;

-(NSString *)getText8;

-(NSString *)getText9;

-(NSString *)getText10;

-(MPPDuration *)getTotalSlack;

-(NSNumber *)getUniqueID;

-(Boolean)getUpdatedNeeded;

-(NSString *)getWBS;

-(MPPDuration *)getWork;

-(MPPDuration *)getWorkVariance;

-(int)getChildTaskCount;

-(Task *)getParentTask;

-(NSMutableArray *)getChildTasks;

-(int)compareTo:(Task *)o;

-(Boolean)getEstimated;

-(void)setEstimated:(Boolean)estimated;

-(NSDate *)getDeadline;

-(void)setDeadLine:(NSDate *)deadline;

-(TaskType *)getType;

-(void)setType:(TaskType *)type;

-(Boolean)getNull;

-(void)setNull:(Boolean)isNull;

-(NSString *)getWBSLevel;

-(void)setWBSLevel:(NSString *)wbsLevel;

-(Boolean)getResumeValid;

-(void)setResumeValid:(Boolean)resumeValid;

-(Boolean)getRecurring;

-(void)setRecurring:(Boolean)recurring;

-(Boolean)getOverAllocated;

-(void)setOverAllocated:(Boolean)overAllocated;

-(NSNumber *)getSubprojectTaskUniqueID;

-(void)setSubprojectTaskUniqueID:(NSNumber *)subprojectUniqueTaskID;

-(NSNumber *)getSubprojectTaskID;

-(void)setSubprojectTaskID:(NSNumber *)subprojectTaskID;

-(void)setSubprojectTaskUniqueIDOffset:(NSNumber *)offset;

-(NSNumber *)getSubprojectTaskUniqueIDOffset;

-(Boolean)getSubprojectReadOnly;

-(void)setSubprojectReadOnly:(Boolean)subprojectReadOnly;

-(Boolean)getExternalTask;

-(void)setExternalTask:(Boolean)externalTask;

-(NSString *)getExternalTaskProject;

-(void)setExternalTaskProject:(NSString *)externalTaskProject;

-(NSNumber *)getACWP;

-(void)setACWP:(NSNumber *)acwp;

-(TimeUnit *)getLevelingDelayFormat;

-(void)setLevelingDelayFormat:(TimeUnit *)levelingDelayFormat;

-(Boolean)getIgnoreResourceCalendar;

-(void)setIgnoreResourceCalendar:(Boolean)ignoreResourceCalendar;

-(NSNumber *)getPhysicalPercentComplete;

-(void)setPhysicalPercentComplete:(NSNumber *)physicalPercentComplete;

-(EarnedValueMethod *)getEarnedValueMethod;

-(void)setEarnedValueMethod:(EarnedValueMethod *)earnedValueMethod;

-(MPPDuration *)getActualWorkProtected;

-(void)setActualWorkProtected:(MPPDuration *)actualWorkProtected;

-(MPPDuration *)getActualOvertimeWorkProtected;

-(void)setActualOvertimeWorkProtected:(MPPDuration *)actualOvertimeWorkProtected;

-(MPPDuration *)getRegularWork;

-(void)setRegularWork:(MPPDuration *)regularWork;

-(Boolean)getFlag11;

-(Boolean)getFlag12;

-(Boolean)getFlag13;

-(Boolean)getFlag14;

-(Boolean)getFlag15;

-(Boolean)getFlag16;

-(Boolean)getFlag17;

-(Boolean)getFlag18;

-(Boolean)getFlag19;

-(Boolean)getFlag20;

-(void)setFlag11:(Boolean)b;

-(void)setFlag12:(Boolean)b;

-(void)setFlag13:(Boolean)b;

-(void)setFlag14:(Boolean)b;

-(void)setFlag15:(Boolean)b;

-(void)setFlag16:(Boolean)b;

-(void)setFlag17:(Boolean)b;

-(void)setFlag18:(Boolean)b;

-(void)setFlag19:(Boolean)b;

-(void)setFlag20:(Boolean)b;

-(void)setEffortDriven:(Boolean)flag;

-(Boolean)getEffortDriven;

-(NSString *)getText11;

-(NSString *)getText12;

-(NSString *)getText13;

-(NSString *)getText14;

-(NSString *)getText15;

-(NSString *)getText16;

-(NSString *)getText17;

-(NSString *)getText18;

-(NSString *)getText19;

-(NSString *)getText20;

-(NSString *)getText21;

-(NSString *)getText22;

-(NSString *)getText23;

-(NSString *)getText24;

-(NSString *)getText25;

-(NSString *)getText26;

-(NSString *)getText27;

-(NSString *)getText28;

-(NSString *)getText29;

-(NSString *)getText30;

-(void)setText11:(NSString *)string;

-(void)setText12:(NSString *)string;

-(void)setText13:(NSString *)string;

-(void)setText14:(NSString *)string;

-(void)setText15:(NSString *)string;

-(void)setText16:(NSString *)string;

-(void)setText17:(NSString *)string;

-(void)setText18:(NSString *)string;

-(void)setText19:(NSString *)string;

-(void)setText20:(NSString *)string;

-(void)setText21:(NSString *)string;

-(void)setText22:(NSString *)string;

-(void)setText23:(NSString *)string;

-(void)setText24:(NSString *)string;

-(void)setText25:(NSString *)string;

-(void)setText26:(NSString *)string;

-(void)setText27:(NSString *)string;

-(void)setText28:(NSString *)string;

-(void)setText29:(NSString *)string;

-(void)setText30:(NSString *)string;

-(void)setNumber6:(NSNumber *)val;

-(NSNumber *)getNumber6;

-(void)setNumber7:(NSNumber *)val;

-(NSNumber *)getNumber7;

-(void)setNumber8:(NSNumber *)val;

-(NSNumber *)getNumber8;

-(void)setNumber9:(NSNumber *)val;

-(NSNumber *)getNumber9;

-(void)setNumber10:(NSNumber *)val;

-(NSNumber *)getNumber10;

-(void)setNumber11:(NSNumber *)val;

-(NSNumber *)getNumber11;

-(void)setNumber12:(NSNumber *)val;

-(NSNumber *)getNumber12;

-(void)setNumber13:(NSNumber *)val;

-(NSNumber *)getNumber13;

-(void)setNumber14:(NSNumber *)val;

-(NSNumber *)getNumber14;

-(void)setNumber15:(NSNumber *)val;

-(NSNumber *)getNumber15;

-(void)setNumber16:(NSNumber *)val;

-(NSNumber *)getNumber16;

-(void)setNumber17:(NSNumber *)val;

-(NSNumber *)getNumber17;

-(void)setNumber18:(NSNumber *)val;

-(NSNumber *)getNumber18;

-(void)setNumber19:(NSNumber *)val;

-(NSNumber *)getNumber19;

-(void)setNumber20:(NSNumber *)val;

-(NSNumber *)getNumber20;

-(MPPDuration *)getDuration10;

-(MPPDuration *)getDuration4;

-(MPPDuration *)getDuration5;

-(MPPDuration *)getDuration6;

-(MPPDuration *)getDuration7;

-(MPPDuration *)getDuration8;

-(MPPDuration *)getDuration9;

-(void)setDuration10:(MPPDuration *)duration;

-(void)setDuration4:(MPPDuration *)duration;

-(void)setDuration5:(MPPDuration *)duration;

-(void)setDuration6:(MPPDuration *)duration;

-(void)setDuration7:(MPPDuration *)duration;

-(void)setDuration8:(MPPDuration *)duration;

-(void)setDuration9:(MPPDuration *)duration;

-(NSDate *)getDate1;

-(NSDate *)getDate10;

-(NSDate *)getDate2;

-(NSDate *)getDate3;

-(NSDate *)getDate4;

-(NSDate *)getDate5;

-(NSDate *)getDate6;

-(NSDate *)getDate7;

-(NSDate *)getDate8;

-(NSDate *)getDate9;

-(void)setDate1:(NSDate *)date;

-(void)setDate10:(NSDate *)date;

-(void)setDate2:(NSDate *)date;

-(void)setDate3:(NSDate *)date;

-(void)setDate4:(NSDate *)date;

-(void)setDate5:(NSDate *)date;

-(void)setDate6:(NSDate *)date;

-(void)setDate7:(NSDate *)date;

-(void)setDate8:(NSDate *)date;

-(void)setDate9:(NSDate *)date;

-(NSNumber *)getCost10;

-(NSNumber *)getCost4;

-(NSNumber *)getCost5;

-(NSNumber *)getCost6;

-(NSNumber *)getCost7;

-(NSNumber *)getCost8;

-(NSNumber *)getCost9;

-(void)setCost10:(NSNumber *)number;

-(void)setCost4:(NSNumber *)number;

-(void)setCost5:(NSNumber *)number;

-(void)setCost6:(NSNumber *)number;

-(void)setCost7:(NSNumber *)number;

-(void)setCost8:(NSNumber *)number;

-(void)setCost9:(NSNumber *)number;

-(NSDate *)getStart10;

-(NSDate *)getStart6;

-(NSDate *)getStart7;

-(NSDate *)getStart8;

-(NSDate *)getStart9;

-(void)setStart10:(NSDate *)date;

-(void)setStart6:(NSDate *)date;

-(void)setStart7:(NSDate *)date;

-(void)setStart8:(NSDate *)date;

-(void)setStart9:(NSDate *)date;

-(NSDate *)getFinish10;

-(NSDate *)getFinish6;

-(NSDate *)getFinish7;

-(NSDate *)getFinish8;

-(NSDate *)getFinish9;

-(void)setFinish10:(NSDate *)date;

-(void)setFinish6:(NSDate *)date;

-(void)setFinish7:(NSDate *)date;

-(void)setFinish8:(NSDate *)date;

-(void)setFinish9:(NSDate *)date;

-(NSNumber *)getOverTimeCost;

-(void)setOverTimeCost:(NSNumber *)number;

-(void)setOutlineCode1:(NSString *)value;

-(NSString *)getOutlineCode1;

-(void)setOutlineCode2:(NSString *)value;

-(NSString *)getOutlineCode2;

-(void)setOutlineCode3:(NSString *)value;

-(NSString *)getOutlineCode3;

-(void)setOutlineCode4:(NSString *)value;

-(NSString *)getOutlineCode4;

-(void)setOutlineCode5:(NSString *)value;

-(NSString *)getOutlineCode5;

-(void)setOutlineCode6:(NSString *)value;

-(NSString *)getOutlineCode6;

-(void)setOutlineCode7:(NSString *)value;

-(NSString *)getOutlineCode7;

-(void)setOutlineCode8:(NSString *)value;

-(NSString *)getOutlineCode8;

-(void)setOutlineCode9:(NSString *)value;

-(NSString *)getOutlineCode9;

-(void)setOutlineCode10:(NSString *)value;

-(NSString *)getOutlineCode10;

-(NSNumber *)getActualOvertimeCost;

-(void)setActualOvertimeCost:(NSNumber *)cost;

-(MPPDuration *)getActualOvertimeWork;

-(void)setActualOvertimeWork:(MPPDuration *)work;

-(AccrueType *)getFixedCostAccrual;

-(void)setFixedCostAccural:(AccrueType *)type;

-(NSString *)getHyperlink;

-(NSString *)getHyperlinkAddress;

-(NSString *)getHyperlinkSubAddress;

-(void)setHyperlink:(NSString *)text;

-(void)setHyperlinkAddress:(NSString *)text;

-(void)setHyperlinkSubAddress:(NSString *)text;

-(Boolean)getLevelAssignments;

-(void)setLevelAssignments:(Boolean)flag;

-(Boolean)getLevelingCanSplit;

-(void)setLevelingCanSplit:(Boolean)flag;

-(MPPDuration *)getOvertimeWork;

-(void)setOvertimeWork:(MPPDuration *)work;

-(NSDate *)getPreleveledStart;

-(NSDate *)getPreleveledFinish;

-(void)setPreleveledStart:(NSDate *)date;

-(void)setPreleveledFinish:(NSDate *)date;

-(MPPDuration *)getRemainingOvertimeWork;

-(void)setRemainingOvertimeWork:(MPPDuration *)work;

-(NSNumber *)getRemainingOvertimeCost;

-(void)setRemainingOvertimeCost:(NSNumber *)cost;

-(ProjectCalendar *)getCalendar;

-(void)setCalendar:(ProjectCalendar *)calendar;

-(Boolean)getExpanded;

-(void)setExpanded:(Boolean)expanded;

-(void)setStartSlack:(MPPDuration *)duration;

-(void)setFinishSlack:(MPPDuration *)duration;

-(MPPDuration *)getStartSlack;

-(MPPDuration *)getFinishSlack;

-(NSObject *)getFieldByAlias:(NSString *)alias;

-(void)setFieldByAlias:(NSString *)alias withValue:(NSObject *)value;

-(NSMutableArray *)getSplits;

-(void)setSplits:(NSMutableArray *)splits;

-(NSDate *)getSplitCompleteDuration;

-(void)setSplitCompleteDuration:(NSDate *)splitsComplete;

-(void)remove;

-(SubProject *)getSubProject;

-(void)setSubProject:(SubProject *)subProject;

-(NSNumber *)getEnterpriseCost:(int)index;

-(void)setEnterpriseCost:(int)index withValue:(NSNumber *)value;

-(NSDate *)getEnterpriseDate:(int)index;

-(void)setEnterpriseDate:(int)index withValue:(NSDate *)value;

-(MPPDuration *)getEnterpriseDuration:(int)index;

-(void)setEnterpriseDuration:(int)index withValue:(MPPDuration *)value;

-(Boolean)getEnterpriseFlag:(int)index;

-(void)setEnterpriseFlag:(int)index withValue:(Boolean)value;

-(NSNumber *)getEnterpriseNumber:(int)index;

-(void)setEnterpriseNumber:(int)index withValue:(NSNumber *)value;

-(NSString *)getEnterpriseText:(int)index;

-(void)setEnterpriseText:(int)index withValue:(NSString *)value;

-(void)setBaselineCost:(int)baselineNumber withValue:(NSNumber *)value;

-(void)setBaselineDuration:(int)baselineNumber withValue:(MPPDuration *)value;

-(void)setBaselineFinish:(int)baselineNumber withValue:(NSDate *)value;

-(void)setBaselineStart:(int)baselineNumber withValue:(NSDate *)value;

-(void)setBaselineWork:(int)baselineNumber withValue:(MPPDuration *)value;

-(NSNumber *)getBaslineCost:(int)baseline;

-(MPPDuration *)getBaslineDuration:(int)baseline;

-(NSString *)getBaslineDurationText:(int)baseline;

-(void)setBaselineDurationText:(int)baselineNumber withValue:(NSString *)value;

-(NSDate *)getBaselineFinish:(int)baselineNumber;

-(NSString *)getBaselineFinishText:(int)baselineNumber;

-(void)setBaselineFinishText:(int)baselineNumber withValue:(NSString *)value;

-(NSDate *)getBaselineStart:(int)baselineNumber;

-(NSString *)getBaselineStartText:(int)baselineNumber;

-(void)setBaselineStartText:(int)baselineNumber withValue:(NSString *)value;

-(MPPDuration *)getBaselineWork:(int)baselineNumber;

-(NSDate *)getCompleteThrough;

-(NSDate *)getSummaryProgress;

-(void)setSummaryProgress:(NSDate *)value;

-(NSString *)getGUID;

-(void)setGUID:(NSString *)value;

-(TaskMode *)getTaskMode;

-(void)setTaskMode:(TaskMode *)mode;

-(Boolean)getActive;

-(void)setActive:(Boolean)active;

-(Boolean)removePredecessor:(Task *)targetTask withType:(RelationType *)type withLag:(MPPDuration *)lag;

-(NSObject *)getCachedValue:(id<FieldType>)field;

-(void)set:(id<FieldType>)field withBoolean:(Boolean)value;

-(NSString *)toString;

-(Boolean)isPredecessor:(Task *)task;

-(Boolean)isSuccessor:(Task *)task;

-(void)disableEvents;

-(void)enableEvents;

@end
