//
//  ProjectHeader.m
//  mppParser
//
//  Created by George on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProjectHeader.h"
#import "ProjectFile.h"
#import "CurrencySymbolPosition.h"
#import "TimeUnit.h"
#import "DateOrder.h"
#import "ProjectTimeFormat.h"
#import "ProjectDateFormat.h"
#import "ScheduleFrom.h"
#import "Day.h"
#import "MPPDuration.h"
#import "Rate.h"
#import "TaskType.h"
#import "AccrueType.h"
#import "EarnedValueMethod.h"

@implementation ProjectHeader

@synthesize defaultTaskType;
@synthesize defaultEndTime;
@synthesize category;
@synthesize spreadActualCost;
@synthesize calculateMultipleCriticalPaths;
@synthesize splitInProgressTasks;
@synthesize showProjectSumamryTask;
@synthesize baselineStart;
@synthesize thousandsSeparator;
@synthesize calendarName;
@synthesize symbolPosition;
@synthesize moveRemainingStartsForward;
@synthesize decimalSepator;
@synthesize autoAddNewResourcesAndTasks;
@synthesize startDate;
@synthesize updatingTaskStatusUpdatesResourceStatus;
@synthesize percentageComplete;
@synthesize finishDate;
@synthesize actualWork;
@synthesize defaultWorkUnits;
@synthesize baselineFinish;
@synthesize currentDate;
@synthesize currencyCode;
@synthesize currencyDigits;
@synthesize currencySymbol;
@synthesize baselineCost;
@synthesize baselineWork;
@synthesize baselineDuration;
@synthesize barTextDateFormat;
@synthesize baselineForEarnedValue;
@synthesize projectExternallyEdited;
@synthesize spreadPercentComplete; 
@synthesize keywords;
@synthesize actualIsInSync;
@synthesize newTasksEstimated;
@synthesize adminProject;
@synthesize extendedCreationDate;
@synthesize editableActualCosts;
@synthesize actualStart;
@synthesize actualFinish;
@synthesize finishVariance;
@synthesize uniqueID;
@synthesize moveCompletedEndsBack;
@synthesize insertedProjectsLikeSummary;
@synthesize autoLink;
@synthesize defaultDurationIsFixed;
@synthesize duration;
@synthesize defaultTaskEarnedValueMethod;
@synthesize minutesPerWeek;
@synthesize weekStartDay;
@synthesize microsoftProjectServerURL;
@synthesize timeFormat;
@synthesize documentSummaryInformation;
@synthesize AMText;
@synthesize scheduleFrom;
@synthesize projectTitle;
@synthesize actualDuration;
@synthesize earnedValueMethod;
@synthesize revision;
@synthesize removeFileProperties;
@synthesize dateOrder;
@synthesize defaultFixedCostAccrual;
@synthesize moveCompletedEndsForward;
@synthesize defaultOvertimeRate;
@synthesize work2;
@synthesize defaultStartTime;
@synthesize PMText;
@synthesize statusDate;
@synthesize manager;
@synthesize actualCost;
@synthesize dateSeparator;
@synthesize honorConstraints;
@synthesize moveRemainingStartsBack;
@synthesize author;
@synthesize fiscalYearStartMonth;
@synthesize newTaskStartIsProjectStart;
@synthesize hyperlinkBase;
@synthesize subject;
@synthesize minutesPerDay;
@synthesize daysPerMonth;
@synthesize work;
@synthesize multipleCriticalPaths;
@synthesize defaultStandardRate;
@synthesize company;
@synthesize comments;
@synthesize name;
@synthesize creationDate;
@synthesize fiscalYearStart;
@synthesize cost;
@synthesize timeSeparator;
@synthesize criticalSlackLimit;
@synthesize newTasksEffortDriven;
@synthesize startVariance;
@synthesize lastSaved;
@synthesize defaultDurationUnits;
@synthesize dateFormat;

static NSString *DEFAULT_TIME_SEPARATOR = @":";
static NSNumber *DEFAULT_COST = [NSNumber numberWithDouble:0];
static NSNumber *DEFAULT_CRITICAL_SLACK_LIMIT = [NSNumber numberWithInt:0];
static NSNumber *DEFAULT_BASELINE_FOR_EARNED_VALUE = [NSNumber numberWithInt:0];
static NSNumber *DEFAULT_FISCAL_YEAR_START_MONTH = [NSNumber numberWithInt:1];
static Day *DEFAULT_WEEK_START_DAY = [Day MONDAY];
static MPPDuration *DEFAULT_WORK = [MPPDuration getInstance:0 withIntType:[TimeUnit HOURS]];
static NSNumber *DEFAULT_WORK2 = [NSNumber numberWithDouble:0];
static MPPDuration *DEFAULT_DURATION = [MPPDuration getInstance:0 withIntType:[TimeUnit DAYS]];
static ScheduleFrom* DEFAULT_SCHEDULE_FROM = [ScheduleFrom START];
static NSNumber *DEFAULT_PERCENT_COMPLETE = [NSNumber numberWithDouble:0];
static NSString *DEFAULT_CALENDAR_NAME = @"Standard";
static NSNumber *DEFAULT_MINUTES_PER_DAY = [NSNumber numberWithInt:480];
static NSNumber *DEFAULT_DAYS_PER_MONTH = [NSNumber numberWithInt:20];
static NSNumber *DEFAULT_MINUTES_PER_WEEK = [NSNumber numberWithInt:2400];

-(id)init:(ProjectFile *)file
{
    self= [super init:file];
    if (self)
    {
        _baselineDate = [[NSMutableArray alloc]initWithCapacity:11];
        [self setSymbolPosition:[CurrencySymbolPosition BEFORE]];
        [self setDefaultDurationUnits:[TimeUnit DAYS]];
        [self setDateOrder:[DateOrder MDY]];
        [self setTimeFormat:[ProjectTimeFormat TWELVE_HOUR]];
        [self setDateFormat:[ProjectDateFormat DD_MM_YY]];
        [self setScheduleFrom:[ScheduleFrom START]];
        
        
        //
        // Configure Date Time Settings and Currency Settings Records
        //
        [self setCurrencySymbol:@"$"];
        [self setSymbolPosition:[CurrencySymbolPosition BEFORE]];
        [self setCurrencyDigits:[NSNumber numberWithInt:2]];
        [self setThousandsSeparator:','];
        [self setDecimalSepator:'.'];
        
        [self setDateOrder:[DateOrder DMY]];
        [self setTimeFormat:[ProjectTimeFormat TWELVE_HOUR]];
        [self setIntegerDefaultStartTime:[NSNumber numberWithInt:480]];
        [self setDateSeparator:@"/"];
        [self setTimeSeparator:@":"];
        [self setAMText:@"am"];
        [self setPMText:@"pm"];
        [self setDateFormat:[ProjectDateFormat DD_MM_YYYY]];
        [self setBarTextDateFormat:[ProjectDateFormat DD_MM_YYYY]];
        
        //
        // Configure Default Settings Record
        //
        [self setDefaultDurationUnits:[TimeUnit DAYS]];
        [self setDefaultDurationIsFixed:false];
        [self setDefaultWorkUnits:[TimeUnit HOURS]];
        [self setMinutesPerDay:[NSNumber numberWithInt:480]];
        [self setMinutesPerWeek:[NSNumber numberWithInt:2400]];
        [self setDefaultStandardRate:[[Rate alloc]init:10 withDoubleTime:[TimeUnit HOURS]]];
        [self setDefaultOvertimeRate:[[Rate alloc]init:15 withDoubleTime:[TimeUnit HOURS]]];
        [self setUpdatingTaskStatusUpdatesResourceStatus:true];
        [self setSplitInProgressTasks:false];
        
        //
        // Configure Project Header Record
        //
        [self setProjectTitle:@"Project1"];
        [self setCompany:nil];
        [self setManager:nil];
        [self setCalendarName:DEFAULT_CALENDAR_NAME];
        [self setStartDate:nil];
        [self setFinishDate:nil];
        [self setScheduleFrom:DEFAULT_SCHEDULE_FROM];
        [self setCurrentDate:[[NSDate alloc]init]];
        [self setComments:nil];
        [self setCost:DEFAULT_COST];
        [self setBaselineCost:DEFAULT_COST];
        [self setActualCost:DEFAULT_COST];
        [self setWork:DEFAULT_WORK];
        [self setBaselineWork:DEFAULT_WORK];
        [self setActualWork:DEFAULT_WORK];
        [self setWork2:DEFAULT_WORK2];
        [self setDuration:DEFAULT_DURATION];
        [self setBaselineDuration:DEFAULT_DURATION];
        [self setActualDuration:DEFAULT_DURATION];
        [self setPercentageComplete:DEFAULT_PERCENT_COMPLETE];
        [self setBaselineStart:nil];
        [self setBaselineFinish:nil];
        [self setActualStart:nil];
        [self setActualFinish:nil];
        [self setStartVariance:DEFAULT_DURATION];
        [self setFinishVariance:DEFAULT_DURATION];
        [self setSubject:nil];
        [self setAuthor:nil];
        [self setKeywords:nil];
        
        //
        // Configure non-MPX attributes
        //
        [self setProjectExternallyEdited:false];
        [self setMinutesPerDay:DEFAULT_MINUTES_PER_DAY];
        [self setDaysPerMonth:DEFAULT_DAYS_PER_MONTH];
        [self setMinutesPerWeek:DEFAULT_MINUTES_PER_WEEK];
        [self setFiscalYearStart:false];
        [self setDefaultTaskEarnedValueMethod:[EarnedValueMethod PERCENT_COMPLETE]];
        [self setNewTasksEstimated:true];
        [self setAutoAddNewResourcesAndTasks:true];
        [self setAutoLink:true];
        [self setMicrosoftProjectServerURL:true];
        [self setDefaultTaskType:[TaskType FIXED_UNITS]];
        [self setDefaultFixedCostAccrual:[AccrueType END]];
        [self setCriticalSlackLimit:DEFAULT_CRITICAL_SLACK_LIMIT];
        [self setBaselineForEarnedValue:DEFAULT_BASELINE_FOR_EARNED_VALUE];
        [self setFiscalYearStartMonth:DEFAULT_FISCAL_YEAR_START_MONTH];
        [self setNewTaskStartIsProjectStart:true];
        [self setWeekStartDay:DEFAULT_WEEK_START_DAY];
    }
    
    return self;
}

-(void)setIntegerDefaultStartTime:(NSNumber *)time
{
    #warning incomplete
}

-(void)setTimeSeparator:(NSString *)timeSep   
{
    self.timeSeparator = timeSep == nil ? DEFAULT_TIME_SEPARATOR : timeSep;
}

-(void)setCalendarName:(NSString *)calName
{
    if(calName == nil || [calName length] == 0)
    {
        calName = DEFAULT_CALENDAR_NAME;
    }
    
    self.calendarName = calName;
}

-(NSDate *)startDate
{
    NSDate *result = self.startDate;
    if(result == nil)
    {
        result = [[self getParentFile]getStartDate];
    }
    return result;
}

-(NSDate *)finishDate
{
    NSDate *result = self.finishDate;
    if(result == nil)
    {
        result = [[self getParentFile]getFinishDate];
    }
    return result;
}

-(void)setCurrencySymbol:(NSString *)currencySymb
{
    if (currencySymb == nil) 
    {
        currencySymb = @"$";
    }
    self.currencySymbol = currencySymb;
}

-(void)setDaysPerMonth:(NSNumber *)daysMonth
{
    if (daysMonth != nil) 
    {
        self.daysPerMonth = daysMonth;
    }
}

-(void)setMinutesPerDay:(NSNumber *)minutesDay
{
    if (minutesDay != nil) 
    {
        self.minutesPerDay = minutesDay;
    }
}

-(void)setMinutesPerWeek:(NSNumber *)minutesWeek
{
    if (minutesWeek != nil) 
    {
        self.minutesPerWeek = minutesWeek;
    }
}

-(NSDate *)getBaselineDate:(int)index
{
    return [_baselineDate objectAtIndex:index];
}

-(void)setBaselineDate:(int)index withDate:(NSDate *)date
{
    [_baselineDate replaceObjectAtIndex:index withObject:date];
}

@end
