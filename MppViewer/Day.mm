//
//  Day.m
//  mppParser
//
//  Created by George on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Day.h"


// Instances of this class represent enumerated day values.

@implementation Day

static Day *_SUNDAY = nil;
static Day *_MONDAY = nil;
static Day *_TUESDAY = nil;
static Day *_WEDNESDAY = nil;
static Day *_THURSDAY = nil;
static Day *_FRIDAY = nil;
static Day *_SATURDAY = nil;

static NSMutableArray *_DAY_ARRAY = nil;

// Constructor.
//
// @param value day value

-(id)init:(int)value
{
    self= [super init];
    if (self)
    {
        _value = value;
    }
    
    return self;
}


// Retrieves the int representation of the day.
//
// @return task type value

-(int)getValue
{
    return _value;
}


// This method provides a simple mechanism to retrieve 
// the next day in correct sequence, including the transition
// from Sunday to Monday. 
// 
// @return Day instance

-(Day *)getNextDay
{
    int value = _value + 1;
    if (value > 7)
    {
        value = 1;
    }
    return [[Day alloc]init:value];
}


// Retrieve a Day instance representing the supplied value.
//
// @param value task type value
// @return Day instance

+(Day *)getInstance:(int) value
{
    Day *result = nil;
    
    if (value >= 0 && value < [[Day DAY_ARRAY] count])
    {
        result = [[Day DAY_ARRAY]objectAtIndex:value];
    }
    
    return (result);
}


// Retrieves the string representation of this instance.
//
// @return string representation

-(NSString *)toString
{
    return [NSString stringWithFormat:@"%d", _value];
}

+(Day *)SUNDAY
{
    if (_SUNDAY == nil)
    {
        _SUNDAY = [[Day alloc]init:1];
    }
    return _SUNDAY;
}

+(Day *)MONDAY
{
    if (_MONDAY == nil)
    {
        _MONDAY = [[Day alloc]init:2];
    }
    return _MONDAY;
}

+(Day *)TUESDAY
{
    if (_TUESDAY == nil)
    {
        _TUESDAY = [[Day alloc]init:3];
    }
    return _TUESDAY;
}

+(Day *)WEDNESDAY
{
    if (_WEDNESDAY == nil)
    {
        _WEDNESDAY = [[Day alloc]init:4];
    }
    return _WEDNESDAY;
}

+(Day *)THURSDAY
{
    if (_THURSDAY == nil)
    {
        _THURSDAY = [[Day alloc]init:5];
    }
    return _THURSDAY;
}

+(Day *)FRIDAY
{
    if (_FRIDAY == nil)
    {
        _FRIDAY = [[Day alloc]init:6];
    }
    return _FRIDAY;
}

+(Day *)SATURDAY
{
    if (_SATURDAY == nil)
    {
        _SATURDAY = [[Day alloc]init:7];
    }
    return _SATURDAY;
}

+(NSMutableArray *) DAY_ARRAY
{
    if (_DAY_ARRAY == nil) 
    {
        _DAY_ARRAY = [[NSMutableArray alloc]initWithObjects:[Day SUNDAY], [Day MONDAY], [Day TUESDAY], [Day WEDNESDAY],[Day THURSDAY],[Day FRIDAY], [Day SATURDAY], nil];
    }
    return _DAY_ARRAY;
}

@end
