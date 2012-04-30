//
//  RecurringTask.m
//  MppViewer
//
//  Created by Fernando Arayao 10 a on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RecurringTask.h"

@implementation RecurringTask

static NSMutableArray *_ORDINAL = nil;
static NSMutableArray *_DAY_ORDINAL = nil;

@synthesize StartDate;
@synthesize FinishDate;
@synthesize Duration;
@synthesize Ocurrences;
@synthesize RecurrenceType;
@synthesize UseEndDate;
@synthesize DailyWorkDay;
@synthesize WeeklyDays;
@synthesize MonthlyRelative;
@synthesize YearlyAbsolute;
@synthesize DailyFrecuency;
@synthesize WeeklyFrecuency;
@synthesize MontlyRelativeOrdinal;
@synthesize MontlyRelativeDay;
@synthesize MontlyRelativeFrecuency;
@synthesize MontlyAbsoluteDay;
@synthesize MontlyAbsoluteFrecuency;
@synthesize YearlyRelativeOrdinal;
@synthesize YearlyRelativeDay;
@synthesize YearlyRelativeMonth;
@synthesize YearlyAbsoluteDate;

-(NSString *)toString
{
    #warning Incomplete DateFormatSymbols, SimpleDateFormat, ByteArrayOutputStream
    return nil;
}

+(NSMutableArray *)ORDINAL
{
    if (_ORDINAL == nil) 
    {
        _ORDINAL = [[NSMutableArray alloc]initWithObjects:nil, @"every", @"every other", @"every 3rd", @"every 4th", @"every 5th", @"every 6th", @"every 7th", @"every 8th", @"every 9th", @"every 10th", @"every 11th", @"every 12th", nil];
    }
    return _ORDINAL;
}

+(NSMutableArray *)DAY_ORDINAL
{
    if (_DAY_ORDINAL == nil) 
    {
        _DAY_ORDINAL = [[NSMutableArray alloc]initWithObjects:nil, @"First", @"Second", @"Third", @"Fourth", @"Last", nil];
    }
    return _DAY_ORDINAL;
}

@end
