//
//  Props.h
//  MppViewer
//
//  Created by Julián! on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MPPComponent.h"

@interface Props : MPPComponent
{
    NSMutableDictionary *_map;
}

-(unsigned char *)getByteArray:(NSNumber *)type;

-(Byte)getByte:(NSNumber *)type;

-(NSString *)getUnicodeString:(NSNumber *)type;

-(Boolean)getBoolean:(NSNumber *)type;

+(NSNumber *)PROJECT_START_DATE;
+(NSNumber *)PROJECT_FINISH_DATE;
+(NSNumber *)SCHEDULE_FROM;
+(NSNumber *)DEFAULT_CALENDAR_NAME;
+(NSNumber *)CURRENCY_SYMBOL;
+(NSNumber *)CURRENCY_PLACEMENT;
+(NSNumber *)CURRENCY_DIGITS;
+(NSNumber *)DURATION_UNITS;
+(NSNumber *)WORK_UNITS;
+(NSNumber *)TASK_UPDATES_RESOURCE;
+(NSNumber *)SPLIT_TASKS;
+(NSNumber *)START_TIME;
+(NSNumber *)MINUTES_PER_DAY;
+(NSNumber *)MINUTES_PER_WEEK;
+(NSNumber *)STANDARD_RATE;
+(NSNumber *)OVERTIME_RATE;
+(NSNumber *)END_TIME;
+(NSNumber *)WEEK_START_DAY;
+(NSNumber *)FISCAL_YEAR_START_MONTH;
+(NSNumber *)HONOR_CONSTRAINTS;
+(NSNumber *)FISCAL_YEAR_START;
+(NSNumber *)EDITABLE_ACTUAL_COSTS ;
+(NSNumber *)DAYS_PER_MONTH;
+(NSNumber *)CURRENCY_CODE;
+(NSNumber *)CALCULATE_MULTIPLE_CRITICAL_PATHS;
+(NSNumber *)TASK_FIELD_NAME_ALIASES;
+(NSNumber *)RESOURCE_FIELD_NAME_ALIASES;
+(NSNumber *)PASSWORD_FLAG;
+(NSNumber *)PROTECTION_PASSWORD_HASH;
+(NSNumber *)WRITE_RESERVATION_PASSWORD_HASH;
+(NSNumber *)ENCRYPTION_CODE;
+(NSNumber *)STATUS_DATE;
+(NSNumber *)SUBPROJECT_COUNT;
+(NSNumber *)SUBPROJECT_DATA;
+(NSNumber *)SUBPROJECT_TASK_COUNT;
+(NSNumber *)DEFAULT_CALENDAR_HOURS;
+(NSNumber *)TASK_FIELD_ATTRIBUTES;
+(NSNumber *)FONT_BASES;
+(NSNumber *)AUTO_FILTER;
+(NSNumber *)PROJECT_FILE_PATH;
+(NSNumber *)HYPERLINK_BASE;
+(NSNumber *)RESOURCE_CREATION_DATE;
+(NSNumber *)SHOW_PROJECT_SUMMARY_TASK;
+(NSNumber *)TASK_FIELD_MAP;
+(NSNumber *)TASK_FIELD_MAP2;
+(NSNumber *)RESOURCE_FIELD_MAP;
+(NSNumber *)RESOURCE_FIELD_MAP2;
+(NSNumber *)ASSIGNMENT_FIELD_MAP;
+(NSNumber *)ASSIGNMENT_FIELD_MAP2;
+(NSNumber *)BASELINE_DATE;
+(NSNumber *)BASELINE1_DATE;
+(NSNumber *)BASELINE2_DATE;
+(NSNumber *)BASELINE3_DATE;
+(NSNumber *)BASELINE4_DATE;
+(NSNumber *)BASELINE5_DATE;
+(NSNumber *)BASELINE6_DATE;
+(NSNumber *)BASELINE7_DATE;
+(NSNumber *)BASELINE8_DATE;
+(NSNumber *)BASELINE9_DATE;
+(NSNumber *)BASELINE10_DATE;

@end
