//
//  Props.m
//  MppViewer
//
//  Created by Julián! on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Props.h"
#import "MPPUtility.h"

@implementation Props

static NSNumber *_PROJECT_START_DATE = nil;
static NSNumber *_PROJECT_FINISH_DATE = nil;
static NSNumber *_SCHEDULE_FROM = nil;
static NSNumber *_DEFAULT_CALENDAR_NAME = nil;
static NSNumber *_CURRENCY_SYMBOL = nil;
static NSNumber *_CURRENCY_PLACEMENT = nil;
static NSNumber *_CURRENCY_DIGITS = nil;
static NSNumber *_DURATION_UNITS = nil;
static NSNumber *_WORK_UNITS = nil;
static NSNumber *_TASK_UPDATES_RESOURCE = nil;
static NSNumber *_SPLIT_TASKS = nil;
static NSNumber *_START_TIME = nil;
static NSNumber *_MINUTES_PER_DAY = nil;
static NSNumber *_MINUTES_PER_WEEK = nil;
static NSNumber *_STANDARD_RATE = nil;
static NSNumber *_OVERTIME_RATE = nil;
static NSNumber *_END_TIME = nil;
static NSNumber *_WEEK_START_DAY = nil;
static NSNumber *_FISCAL_YEAR_START_MONTH = nil;
static NSNumber *_HONOR_CONSTRAINTS = nil;
static NSNumber *_FISCAL_YEAR_START = nil;
static NSNumber *_EDITABLE_ACTUAL_COSTS  = nil;
static NSNumber *_DAYS_PER_MONTH = nil;
static NSNumber *_CURRENCY_CODE = nil;
static NSNumber *_CALCULATE_MULTIPLE_CRITICAL_PATHS = nil;
static NSNumber *_TASK_FIELD_NAME_ALIASES = nil;
static NSNumber *_RESOURCE_FIELD_NAME_ALIASES = nil;
static NSNumber *_PASSWORD_FLAG = nil;
static NSNumber *_PROTECTION_PASSWORD_HASH = nil;
static NSNumber *_WRITE_RESERVATION_PASSWORD_HASH = nil;
static NSNumber *_ENCRYPTION_CODE = nil;
static NSNumber *_STATUS_DATE = nil;
static NSNumber *_SUBPROJECT_COUNT = nil;
static NSNumber *_SUBPROJECT_DATA = nil;
static NSNumber *_SUBPROJECT_TASK_COUNT = nil;
static NSNumber *_DEFAULT_CALENDAR_HOURS = nil;
static NSNumber *_TASK_FIELD_ATTRIBUTES = nil;
static NSNumber *_FONT_BASES = nil;
static NSNumber *_AUTO_FILTER = nil;
static NSNumber *_PROJECT_FILE_PATH = nil;
static NSNumber *_HYPERLINK_BASE = nil;
static NSNumber *_RESOURCE_CREATION_DATE = nil;
static NSNumber *_SHOW_PROJECT_SUMMARY_TASK = nil;
static NSNumber *_TASK_FIELD_MAP = nil;
static NSNumber *_TASK_FIELD_MAP2 = nil;
static NSNumber *_RESOURCE_FIELD_MAP = nil;
static NSNumber *_RESOURCE_FIELD_MAP2 = nil;
static NSNumber *_ASSIGNMENT_FIELD_MAP = nil;
static NSNumber *_ASSIGNMENT_FIELD_MAP2 = nil;
static NSNumber *_BASELINE_DATE = nil;
static NSNumber *_BASELINE1_DATE = nil;
static NSNumber *_BASELINE2_DATE = nil;
static NSNumber *_BASELINE3_DATE = nil;
static NSNumber *_BASELINE4_DATE = nil;
static NSNumber *_BASELINE5_DATE = nil;
static NSNumber *_BASELINE6_DATE = nil;
static NSNumber *_BASELINE7_DATE = nil;
static NSNumber *_BASELINE8_DATE = nil;
static NSNumber *_BASELINE9_DATE = nil;
static NSNumber *_BASELINE10_DATE = nil;

-(id)init
{
    self = [super init];
    if(self)
    {
        _map = [[NSMutableDictionary alloc]init];
    }
    
    return self;
}

#warning Incomplete

-(unsigned char *)getByteArray:(NSNumber *)type
{
    //NSString *key = [NSString stringWithFormat:@"%d", [type intValue]];
    unsigned char *buffer = NULL;
    NSData *data = [_map objectForKey:type];
    if(data != nil)
    {
        buffer = new unsigned char[[data length]];
        [data getBytes:buffer length:[data length]];
    }
    return buffer;
}

-(Byte)getByte:(NSNumber *)type
{
    Byte result = 0;
    NSData *data = [_map objectForKey:type];
    if(data != nil)
    {
        unsigned char *buffer = new unsigned char[1];
        [data getBytes:buffer length:1];
        result = buffer[0];
    }
    return result;
}

-(NSString *)getUnicodeString:(NSNumber *)type
{
    NSString *result = nil;
    NSData *item = [_map objectForKey:type];
    if(item != nil)
    {
        unsigned char *buffer = new unsigned char[[item length]];
        [item getBytes:buffer length:[item length]];
        result = [MPPUtility getUnicodeString:buffer withSize:[item length]];
    }
    
    return result;
}

+(NSNumber *)PROJECT_START_DATE
{
    if(_PROJECT_START_DATE == nil)
    {
        _PROJECT_START_DATE = [NSNumber numberWithInt:37748738];
    }
    return _PROJECT_START_DATE;
}

+(NSNumber *)PROJECT_FINISH_DATE
{
    if(_PROJECT_FINISH_DATE == nil)
    {
        _PROJECT_FINISH_DATE = [NSNumber numberWithInt:37748739];
    }
    return _PROJECT_FINISH_DATE;
}

+(NSNumber *)SCHEDULE_FROM
{
    if(_SCHEDULE_FROM == nil)
    {
        _SCHEDULE_FROM = [NSNumber numberWithInt:37748740];
    }
    return _SCHEDULE_FROM;
}

+(NSNumber *)DEFAULT_CALENDAR_NAME
{
    if(_DEFAULT_CALENDAR_NAME == nil)
    {
        _DEFAULT_CALENDAR_NAME = [NSNumber numberWithInt:37748750];
    }
    return _DEFAULT_CALENDAR_NAME;
}

+(NSNumber *)CURRENCY_SYMBOL
{
    if(_CURRENCY_SYMBOL == nil)
    {
        _CURRENCY_SYMBOL = [NSNumber numberWithInt:37748752];
    }
    return _CURRENCY_SYMBOL;
}

+(NSNumber *)CURRENCY_PLACEMENT
{
    if(_CURRENCY_PLACEMENT == nil)
    {
        _CURRENCY_PLACEMENT = [NSNumber numberWithInt:37748753];
    }
    return _CURRENCY_PLACEMENT;
}

+(NSNumber *)CURRENCY_DIGITS
{
    if(_CURRENCY_DIGITS == nil)
    {
        _CURRENCY_DIGITS = [NSNumber numberWithInt:37748754];
    }
    return _CURRENCY_DIGITS;
}

+(NSNumber *)DURATION_UNITS
{
    if(_DURATION_UNITS == nil)
    {
        _DURATION_UNITS = [NSNumber numberWithInt:37748757];
    }
    return _DURATION_UNITS;
}

+(NSNumber *)WORK_UNITS
{
    if(_WORK_UNITS == nil)
    {
        _WORK_UNITS = [NSNumber numberWithInt:37748758];
    }
    return _WORK_UNITS;
}

+(NSNumber *)TASK_UPDATES_RESOURCE
{
    if(_TASK_UPDATES_RESOURCE == nil)
    {
        _TASK_UPDATES_RESOURCE = [NSNumber numberWithInt:37748761];
    }
    return _TASK_UPDATES_RESOURCE;
}

+(NSNumber *)SPLIT_TASKS
{
    if(_SPLIT_TASKS == nil)
    {
        _SPLIT_TASKS = [NSNumber numberWithInt:37748762];
    }
    return _SPLIT_TASKS;
}

+(NSNumber *)START_TIME
{
    if(_START_TIME == nil)
    {
        _START_TIME = [NSNumber numberWithInt:37748764];
    }
    return _START_TIME;
}

+(NSNumber *)MINUTES_PER_DAY
{
    if(_MINUTES_PER_DAY == nil)
    {
        _MINUTES_PER_DAY = [NSNumber numberWithInt:37748765];
    }
    return _MINUTES_PER_DAY;
}

+(NSNumber *)MINUTES_PER_WEEK
{
    if(_MINUTES_PER_WEEK == nil)
    {
        _MINUTES_PER_WEEK = [NSNumber numberWithInt:37748766];
    }
    return _MINUTES_PER_WEEK;
}

+(NSNumber *)STANDARD_RATE
{
    if(_STANDARD_RATE == nil)
    {
        _STANDARD_RATE = [NSNumber numberWithInt:37748767];
    }
    return _STANDARD_RATE;
}

+(NSNumber *)OVERTIME_RATE
{
    if(_OVERTIME_RATE == nil)
    {
        _OVERTIME_RATE = [NSNumber numberWithInt:37748768];
    }
    return _OVERTIME_RATE;
}

+(NSNumber *)END_TIME
{
    if(_END_TIME == nil)
    {
        _END_TIME = [NSNumber numberWithInt:37748769];
    }
    return _END_TIME;
}

+(NSNumber *)WEEK_START_DAY
{
    if(_WEEK_START_DAY == nil)
    {
        _WEEK_START_DAY = [NSNumber numberWithInt:37748773];
    }
    return _WEEK_START_DAY;
}

+(NSNumber *)FISCAL_YEAR_START_MONTH
{
    if(_FISCAL_YEAR_START_MONTH == nil)
    {
        _FISCAL_YEAR_START_MONTH = [NSNumber numberWithInt:37748780];
    }
    return _FISCAL_YEAR_START_MONTH;
}

+(NSNumber *)HONOR_CONSTRAINTS
{
    if(_HONOR_CONSTRAINTS == nil)
    {
        _HONOR_CONSTRAINTS = [NSNumber numberWithInt:37748794];
    }
    return _HONOR_CONSTRAINTS;
}

+(NSNumber *)FISCAL_YEAR_START
{
    if(_FISCAL_YEAR_START == nil)
    {
        _FISCAL_YEAR_START = [NSNumber numberWithInt:37748801];
    }
    return _FISCAL_YEAR_START;
}

+(NSNumber *)EDITABLE_ACTUAL_COSTS 
{
    if(_EDITABLE_ACTUAL_COSTS == nil)
    {
        _EDITABLE_ACTUAL_COSTS = [NSNumber numberWithInt:37748802];
    }
    return _EDITABLE_ACTUAL_COSTS;
}

+(NSNumber *)DAYS_PER_MONTH
{
    if(_DAYS_PER_MONTH == nil)
    {
        _DAYS_PER_MONTH = [NSNumber numberWithInt:37753743];
    }
    return _DAYS_PER_MONTH;
}

+(NSNumber *)CURRENCY_CODE
{
    if(_CURRENCY_CODE == nil)
    {
        _CURRENCY_CODE = [NSNumber numberWithInt:37753787];
    }
    return _CURRENCY_CODE;
}

+(NSNumber *)CALCULATE_MULTIPLE_CRITICAL_PATHS
{
    if(_CALCULATE_MULTIPLE_CRITICAL_PATHS == nil)
    {
        _CALCULATE_MULTIPLE_CRITICAL_PATHS = [NSNumber numberWithInt:37748793];
    }
    return _CALCULATE_MULTIPLE_CRITICAL_PATHS;
}

+(NSNumber *)TASK_FIELD_NAME_ALIASES
{
    if(_TASK_FIELD_NAME_ALIASES == nil)
    {
        _TASK_FIELD_NAME_ALIASES = [NSNumber numberWithInt:1048577];
    }
    return _TASK_FIELD_NAME_ALIASES;
}

+(NSNumber *)RESOURCE_FIELD_NAME_ALIASES
{
    if(_RESOURCE_FIELD_NAME_ALIASES == nil)
    {
        _RESOURCE_FIELD_NAME_ALIASES = [NSNumber numberWithInt:1048578];
    }
    return _RESOURCE_FIELD_NAME_ALIASES;
}

+(NSNumber *)PASSWORD_FLAG
{
    if(_PASSWORD_FLAG == nil)
    {
        _PASSWORD_FLAG = [NSNumber numberWithInt:893386752];
    }
    return _PASSWORD_FLAG;
}

+(NSNumber *)PROTECTION_PASSWORD_HASH
{
    if(_PROTECTION_PASSWORD_HASH == nil)
    {
        _PROTECTION_PASSWORD_HASH = [NSNumber numberWithInt:893386756];
    }
    return _PROTECTION_PASSWORD_HASH;
}

+(NSNumber *)WRITE_RESERVATION_PASSWORD_HASH
{
    if(_WRITE_RESERVATION_PASSWORD_HASH == nil)
    {
        _WRITE_RESERVATION_PASSWORD_HASH = [NSNumber numberWithInt:893386757];
    }
    return _WRITE_RESERVATION_PASSWORD_HASH;
}

+(NSNumber *)ENCRYPTION_CODE
{
    if(_ENCRYPTION_CODE == nil)
    {
        _ENCRYPTION_CODE = [NSNumber numberWithInt:893386759];
    }
    return _ENCRYPTION_CODE;
}

+(NSNumber *)STATUS_DATE
{
    if(_STATUS_DATE == nil)
    {
        _STATUS_DATE = [NSNumber numberWithInt:37748805];
    }
    return _STATUS_DATE;
}

+(NSNumber *)SUBPROJECT_COUNT
{
    if(_SUBPROJECT_COUNT == nil)
    {
        _SUBPROJECT_COUNT = [NSNumber numberWithInt:37748868];
    }
    return _SUBPROJECT_COUNT;
}

+(NSNumber *)SUBPROJECT_DATA
{
    if(_SUBPROJECT_DATA == nil)
    {
        _SUBPROJECT_DATA = [NSNumber numberWithInt:37748898];
    }
    return _SUBPROJECT_DATA;
}

+(NSNumber *)SUBPROJECT_TASK_COUNT
{
    if(_SUBPROJECT_TASK_COUNT == nil)
    {
        _SUBPROJECT_TASK_COUNT = [NSNumber numberWithInt:37748900];
    }
    return _SUBPROJECT_TASK_COUNT;
}

+(NSNumber *)DEFAULT_CALENDAR_HOURS
{
    if(_DEFAULT_CALENDAR_HOURS == nil)
    {
        _DEFAULT_CALENDAR_HOURS = [NSNumber numberWithInt:37753736];
    }
    return _DEFAULT_CALENDAR_HOURS;
}

+(NSNumber *)TASK_FIELD_ATTRIBUTES
{
    if(_TASK_FIELD_ATTRIBUTES == nil)
    {
        _TASK_FIELD_ATTRIBUTES = [NSNumber numberWithInt:37753744];
    }
    return _TASK_FIELD_ATTRIBUTES;
}

+(NSNumber *)FONT_BASES
{
    if(_FONT_BASES == nil)
    {
        _FONT_BASES = [NSNumber numberWithInt:54525952];
    }
    return _FONT_BASES;
}

+(NSNumber *)AUTO_FILTER
{
    if(_AUTO_FILTER == nil)
    {
        _AUTO_FILTER = [NSNumber numberWithInt:893386767];
    }
    return _AUTO_FILTER;
}

+(NSNumber *)PROJECT_FILE_PATH
{
    if(_PROJECT_FILE_PATH == nil)
    {
        _PROJECT_FILE_PATH = [NSNumber numberWithInt:893386760];
    }
    return _PROJECT_FILE_PATH;
}

+(NSNumber *)HYPERLINK_BASE
{
    if(_HYPERLINK_BASE == nil)
    {
        _HYPERLINK_BASE = [NSNumber numberWithInt:37748810];
    }
    return _HYPERLINK_BASE;
}

+(NSNumber *)RESOURCE_CREATION_DATE
{
    if(_RESOURCE_CREATION_DATE == nil)
    {
        _RESOURCE_CREATION_DATE = [NSNumber numberWithInt:205521219];
    }
    return _RESOURCE_CREATION_DATE;
}

+(NSNumber *)SHOW_PROJECT_SUMMARY_TASK
{
    if(_SHOW_PROJECT_SUMMARY_TASK == nil)
    {
        _SHOW_PROJECT_SUMMARY_TASK = [NSNumber numberWithInt:54525961];
    }
    return _SHOW_PROJECT_SUMMARY_TASK;
}

+(NSNumber *)TASK_FIELD_MAP
{
    if(_TASK_FIELD_MAP == nil)
    {
        _TASK_FIELD_MAP = [NSNumber numberWithInt:131092];
    }
    return _TASK_FIELD_MAP;
}

+(NSNumber *)TASK_FIELD_MAP2
{
    if(_TASK_FIELD_MAP2 == nil)
    {
        _TASK_FIELD_MAP2 = [NSNumber numberWithInt:50331668];
    }
    return _TASK_FIELD_MAP2;
}

+(NSNumber *)RESOURCE_FIELD_MAP
{
    if(_RESOURCE_FIELD_MAP == nil)
    {
        _RESOURCE_FIELD_MAP = [NSNumber numberWithInt:131093];
    }
    return _RESOURCE_FIELD_MAP;
}

+(NSNumber *)RESOURCE_FIELD_MAP2
{
    if(_RESOURCE_FIELD_MAP2 == nil)
    {
        _RESOURCE_FIELD_MAP2 = [NSNumber numberWithInt:50331669];
    }
    return _RESOURCE_FIELD_MAP2;
}

+(NSNumber *)ASSIGNMENT_FIELD_MAP
{
    if(_ASSIGNMENT_FIELD_MAP == nil)
    {
        _ASSIGNMENT_FIELD_MAP = [NSNumber numberWithInt:131095];
    }
    return _ASSIGNMENT_FIELD_MAP;
}

+(NSNumber *)ASSIGNMENT_FIELD_MAP2
{
    if(_ASSIGNMENT_FIELD_MAP2 == nil)
    {
        _ASSIGNMENT_FIELD_MAP2 = [NSNumber numberWithInt:50331671];
    }
    return _ASSIGNMENT_FIELD_MAP2;
}

+(NSNumber *)BASELINE_DATE
{
    if(_BASELINE_DATE == nil)
    {
        _BASELINE_DATE = [NSNumber numberWithInt:37753749];
    }
    return _BASELINE_DATE;
}

+(NSNumber *)BASELINE1_DATE
{
    if(_BASELINE1_DATE == nil)
    {
        _BASELINE1_DATE = [NSNumber numberWithInt:37753750];
    }
    return _BASELINE1_DATE;
}

+(NSNumber *)BASELINE2_DATE
{
    if(_BASELINE2_DATE == nil)
    {
        _BASELINE2_DATE = [NSNumber numberWithInt:37753751];
    }
    return _BASELINE2_DATE;
}

+(NSNumber *)BASELINE3_DATE
{
    if(_BASELINE3_DATE == nil)
    {
        _BASELINE3_DATE = [NSNumber numberWithInt:37753752];
    }
    return _BASELINE3_DATE;
}

+(NSNumber *)BASELINE4_DATE
{
    if(_BASELINE4_DATE == nil)
    {
        _BASELINE4_DATE = [NSNumber numberWithInt:37753753];
    }
    return _BASELINE4_DATE;
}

+(NSNumber *)BASELINE5_DATE
{
    if(_BASELINE5_DATE == nil)
    {
        _BASELINE5_DATE = [NSNumber numberWithInt:37753754];
    }
    return _BASELINE5_DATE;
}

+(NSNumber *)BASELINE6_DATE
{
    if(_BASELINE6_DATE == nil)
    {
        _BASELINE6_DATE = [NSNumber numberWithInt:37753755];
    }
    return _BASELINE6_DATE;
}

+(NSNumber *)BASELINE7_DATE
{
    if(_BASELINE7_DATE == nil)
    {
        _BASELINE7_DATE = [NSNumber numberWithInt:37753756];
    }
    return _BASELINE7_DATE;
}

+(NSNumber *)BASELINE8_DATE
{
    if(_BASELINE8_DATE == nil)
    {
        _BASELINE8_DATE = [NSNumber numberWithInt:37753757];
    }
    return _BASELINE8_DATE;
}

+(NSNumber *)BASELINE9_DATE
{
    if(_BASELINE9_DATE == nil)
    {
        _BASELINE9_DATE = [NSNumber numberWithInt:37753758];
    }
    return _BASELINE9_DATE;
}

+(NSNumber *)BASELINE10_DATE
{
    if(_BASELINE10_DATE == nil)
    {
        _BASELINE10_DATE = [NSNumber numberWithInt:37753759];
    }
    return _BASELINE10_DATE;
}

@end
