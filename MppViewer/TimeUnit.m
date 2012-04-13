//
//  TimeUnit.m
//  MppViewer
//
//  Created by Fernando Araya on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimeUnit.h"

@implementation TimeUnit

static TimeUnit *_MINUTES = nil;
static TimeUnit *_HOURS = nil;
static TimeUnit *_DAYS = nil;
static TimeUnit *_WEEKS = nil;
static TimeUnit *_MONTHS = nil;
static TimeUnit *_PERCENT = nil;
static TimeUnit *_YEARS = nil;
static TimeUnit *_ELAPSED_MINUTES = nil;
static TimeUnit *_ELAPSED_HOURS = nil;
static TimeUnit *_ELAPSED_DAYS = nil;
static TimeUnit *_ELAPSED_WEEKS = nil;
static TimeUnit *_ELAPSED_MONTHS = nil;
static TimeUnit *_ELAPSED_YEARS = nil;
static TimeUnit *_ELAPSED_PERCENT = nil;
static NSMutableArray *_TYPE_VALUES = nil;

/**
 * Private constructor.
 * 
 * @param type int version of the enum
 * @param name enum name
 */

-(id)init:(int)type withName:(NSString *)name
{
    self= [super init];
    if (self)
    {
        _value = type;
        _name = name;
    }
    
    return self;
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(TimeUnit *)getInstance:(int) type
{
    if (type < 0 || type >= [[TimeUnit TYPE_VALUES]count])
    {
        type = [[TimeUnit DAYS] getValue];
    }
    return [[TimeUnit TYPE_VALUES] objectAtIndex: type];
}

/**
 * Accessor method used to retrieve the numeric representation of the enum. 
 *
 * @return int representation of the enum
 */

-(int)getValue;
{
    return _value;
}

/**
 * Retrieve the name associated with this enum.
 * 
 * @return name
 */

-(NSString *)getName
{
    return _name;
}

/**
 * {@inheritDoc}
 */

-(NSString *)toString
{
    return [self getName];
}

/**
 * Constant representing Minutes.
 */

+(TimeUnit *)MINUTES
{
    if (_MINUTES == nil)
    {
        _MINUTES = [[TimeUnit alloc]init:0 withName:@"m"];
    }
    return _MINUTES;
}

/**
 * Constant representing Hours.
 */

+(TimeUnit *)HOURS
{
    if (_HOURS == nil)
    {
        _HOURS = [[TimeUnit alloc]init:1 withName:@"h"];
    }
    return _HOURS;
}

/**
 * Constant representing Days.
 */

+(TimeUnit *)DAYS
{
    if (_DAYS == nil)
    {
        _DAYS = [[TimeUnit alloc]init:2 withName:@"d"];
    }
    return _DAYS;
}

/**
 * Constant representing Weeks.
 */

+(TimeUnit *)WEEKS
{
    if (_WEEKS == nil)
    {
        _WEEKS = [[TimeUnit alloc]init:3 withName:@"w"];
    }
    return _WEEKS;
}

/**
 * Constant representing Months.
 */

+(TimeUnit *)MONTHS
{
    if (_MONTHS == nil)
    {
        _MONTHS = [[TimeUnit alloc]init:4 withName:@"mo"];
    }
    return _MONTHS;
}

/**
 * Constant representing Percent.
 */

+(TimeUnit *)PERCENT
{
    if (_PERCENT == nil)
    {
        _PERCENT = [[TimeUnit alloc]init:5 withName:@"%"];
    }
    return _PERCENT;
}

/**
 * Constant representing Years.
 */

+(TimeUnit *)YEARS
{
    if (_YEARS == nil)
    {
        _YEARS = [[TimeUnit alloc]init:6 withName:@"y"];
    }
    return _YEARS;
}

/**
 * Constant representing Elapsed Minutes.
 */

+(TimeUnit *)ELAPSED_MINUTES
{
    if (_ELAPSED_MINUTES == nil)
    {
        _ELAPSED_MINUTES = [[TimeUnit alloc]init:7 withName:@"em"];
    }
    return _ELAPSED_MINUTES;
}

/**
 * Constant representing Elapsed Hours.
 */

+(TimeUnit *)ELAPSED_HOURS
{
    if (_ELAPSED_HOURS == nil)
    {
        _ELAPSED_HOURS = [[TimeUnit alloc]init:8 withName:@"eh"];
    }
    return _ELAPSED_HOURS;
}

/**
 * Constant representing Elapsed Days.
 */

+(TimeUnit *)ELAPSED_DAYS
{
    if (_ELAPSED_DAYS == nil)
    {
        _ELAPSED_DAYS = [[TimeUnit alloc]init:9 withName:@"ed"];
    }
    return _ELAPSED_DAYS;
}

/**
 * Constant representing Elapsed Weeks.
 */

+(TimeUnit *)ELAPSED_WEEKS
{
    if (_ELAPSED_WEEKS == nil)
    {
        _ELAPSED_WEEKS = [[TimeUnit alloc]init:10 withName:@"ew"];
    }
    return _ELAPSED_WEEKS;
}

/**
 * Constant representing Elapsed Months.
 */

+(TimeUnit *)ELAPSED_MONTHS
{
    if (_ELAPSED_MONTHS == nil)
    {
        _ELAPSED_MONTHS = [[TimeUnit alloc]init:11 withName:@"emo"];
    }
    return _ELAPSED_MONTHS;
}

/**
 * Constant representing Elapsed Years.
 */

+(TimeUnit *)ELAPSED_YEARS
{
    if (_ELAPSED_YEARS == nil)
    {
        _ELAPSED_YEARS = [[TimeUnit alloc]init:12 withName:@"ey"];
    }
    return _ELAPSED_YEARS;
}

/**
 * Constant representing Elapsed Percent.
 */

+(TimeUnit *)ELAPSED_PERCENT
{
    if (_ELAPSED_PERCENT == nil)
    {
        _ELAPSED_PERCENT = [[TimeUnit alloc]init:2 withName:@"e%"];
    }
    return _ELAPSED_PERCENT;
}

/**
 * Array mapping int types to enums.
 */

+(NSMutableArray *)TYPE_VALUES
{
    if (_TYPE_VALUES == nil) 
    {
        _TYPE_VALUES = [[NSMutableArray alloc]initWithObjects:[TimeUnit MINUTES], [TimeUnit HOURS], [TimeUnit DAYS], [TimeUnit WEEKS], [TimeUnit MONTHS], [TimeUnit PERCENT], [TimeUnit YEARS], [TimeUnit ELAPSED_MINUTES], [TimeUnit ELAPSED_HOURS], [TimeUnit ELAPSED_DAYS], [TimeUnit ELAPSED_WEEKS], [TimeUnit ELAPSED_MONTHS], [TimeUnit ELAPSED_YEARS], [TimeUnit ELAPSED_PERCENT], nil];
    }
    return _TYPE_VALUES;
}

@end
