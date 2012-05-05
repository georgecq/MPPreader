//
//  ProjectHeader.h
//  mppParser
//
//  Created by George on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectEntity.h"

@class ProjectFile;
@class TimeUnit;
@class MPPDuration;
@class Rate;
@class DateOrder;
@class ProjectTimeFormat;
@class ProjectDateFormat;
@class ScheduleFrom;
@class CurrencySymbolPosition;
@class EarnedValueMethod;
@class TaskType;
@class AccrueType;
@class Day;

@interface ProjectHeader : ProjectEntity
{
    NSMutableArray *_baselineDate;
}

@property (strong, nonatomic) TimeUnit *defaultDurationUnits;

@property (nonatomic) Boolean defaultDurationIsFixed;

@property (strong, nonatomic) TimeUnit *defaultWorkUnits;

@property (strong, nonatomic) Rate *defaultStandardRate;

@property (strong, nonatomic) Rate *defaultOvertimeRate;

@property (nonatomic) Boolean updatingTaskStatusUpdatesResourceStatus;

@property (nonatomic) Boolean splitInProgressTasks;

@property (strong, nonatomic) DateOrder *dateOrder;

@property (strong, nonatomic) ProjectTimeFormat *timeFormat;

@property (strong, nonatomic) NSDate *defaultStartTime;

@property (strong, nonatomic) NSString *dateSeparator;

@property (strong, nonatomic) NSString *timeSeparator;

@property (strong, nonatomic) NSString *AMText;

@property (strong, nonatomic) NSString *PMText;

@property (strong, nonatomic) ProjectDateFormat *dateFormat;

@property (strong, nonatomic) ProjectDateFormat *barTextDateFormat;

@property (strong, nonatomic) NSDate *defaultEndTime;

@property (strong, nonatomic) NSString *projectTitle;

@property (strong, nonatomic) NSString *company;

@property (strong, nonatomic) NSString *manager;

@property (strong, nonatomic) NSString *calendarName;

@property (strong, nonatomic) NSDate *startDate;

@property (strong, nonatomic) NSDate *finishDate;

@property (strong, nonatomic) ScheduleFrom *scheduleFrom;

@property (strong, nonatomic) NSDate *currentDate;

@property (strong, nonatomic) NSString *comments;

@property (strong, nonatomic) NSNumber *cost;

@property (strong, nonatomic) NSNumber *baselineCost;

@property (strong, nonatomic) NSNumber *actualCost;

@property (strong, nonatomic) MPPDuration *work;

@property (strong, nonatomic) MPPDuration *baselineWork;

@property (strong, nonatomic) MPPDuration *actualWork;

@property (strong, nonatomic) NSNumber *work2;

@property (strong, nonatomic) MPPDuration *duration;

@property (strong, nonatomic) MPPDuration *baselineDuration;

@property (strong, nonatomic) MPPDuration *actualDuration;

@property (strong, nonatomic) NSNumber *percentageComplete;

@property (strong, nonatomic) NSDate *baselineStart;

@property (strong, nonatomic) NSDate *baselineFinish;

@property (strong, nonatomic) NSDate *actualStart;

@property (strong, nonatomic) NSDate *actualFinish;

@property (strong, nonatomic) MPPDuration *startVariance;

@property (strong, nonatomic) MPPDuration *finishVariance;

@property (strong, nonatomic) NSString *subject;

@property (strong, nonatomic) NSString *author;

@property (strong, nonatomic) NSString *keywords;

@property (strong, nonatomic) NSString *currencySymbol;

@property (strong, nonatomic) CurrencySymbolPosition *symbolPosition;

@property (strong, nonatomic) NSNumber *currencyDigits;

@property (nonatomic) char thousandsSeparator;

@property (nonatomic) char decimalSepator;

@property (nonatomic) Boolean projectExternallyEdited;

@property (strong, nonatomic) NSString *category;

@property (strong, nonatomic) NSNumber *daysPerMonth;

@property (strong, nonatomic) NSNumber *minutesPerDay; 

@property (strong, nonatomic) NSNumber *minutesPerWeek; 

@property (nonatomic) Boolean fiscalYearStart;

@property (strong, nonatomic) EarnedValueMethod *defaultTaskEarnedValueMethod;

@property (nonatomic) Boolean removeFileProperties;

@property (nonatomic) Boolean moveCompletedEndsBack;

@property (nonatomic) Boolean newTasksEstimated;

@property (nonatomic) Boolean spreadActualCost;

@property (nonatomic) Boolean multipleCriticalPaths;

@property (nonatomic) Boolean autoAddNewResourcesAndTasks;

@property (strong, nonatomic) NSDate *lastSaved;

@property (strong, nonatomic) NSDate *statusDate;

@property (nonatomic) Boolean moveRemainingStartsBack;

@property (nonatomic) Boolean autoLink;

@property (nonatomic) Boolean microsoftProjectServerURL;

@property (nonatomic) Boolean honorConstraints;

@property (nonatomic) Boolean adminProject;

@property (nonatomic) Boolean insertedProjectsLikeSummary;

@property (strong, nonatomic) NSString *name;

@property (nonatomic) Boolean spreadPercentComplete;

@property (nonatomic) Boolean moveCompletedEndsForward;

@property (nonatomic) Boolean editableActualCosts;

@property (strong, nonatomic) NSString *uniqueID;

@property (strong, nonatomic) NSNumber *revision;

@property (nonatomic) Boolean newTasksEffortDriven;

@property (nonatomic) Boolean moveRemainingStartsForward;

@property (nonatomic) Boolean actualIsInSync;

@property (strong, nonatomic) TaskType *defaultTaskType;

@property (strong, nonatomic) EarnedValueMethod *earnedValueMethod;

@property (strong, nonatomic) NSDate *creationDate;

@property (strong, nonatomic) NSDate *extendedCreationDate;

@property (strong, nonatomic) AccrueType *defaultFixedCostAccrual;

@property (strong, nonatomic) NSNumber *criticalSlackLimit;

@property (strong, nonatomic) NSNumber *baselineForEarnedValue;

@property (strong, nonatomic) NSNumber *fiscalYearStartMonth;

@property (nonatomic) Boolean newTaskStartIsProjectStart;

@property (strong, nonatomic) Day *weekStartDay;

@property (nonatomic) Boolean calculateMultipleCriticalPaths;

@property (strong, nonatomic) NSString *currencyCode;

@property (strong, nonatomic) NSMutableDictionary *documentSummaryInformation;

@property (strong, nonatomic) NSString *hyperlinkBase;

@property (nonatomic) Boolean showProjectSumamryTask;

-(id)init:(ProjectFile *)file;

-(void)setIntegerDefaultStartTime:(NSNumber *)time;

-(NSDate *)getBaselineDate:(int)index;

-(void)setBaselineDate:(int)index withDate:(NSDate *)date;

@end
