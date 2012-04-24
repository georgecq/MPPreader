//
// TimescaleUnits.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimescaleUnits.h"
#import "NumberUtility.h"
#import "EnumUtility.h"

@implementation TimescaleUnits

static TimescaleUnits *_NONE = nil;
static TimescaleUnits *_MINUTES = nil;
static TimescaleUnits *_HOURS = nil;
static TimescaleUnits *_DAYS = nil;
static TimescaleUnits *_WEEKS = nil;
static TimescaleUnits *_THIRDS_OF_MONTHS = nil;
static TimescaleUnits *_MONTHS = nil;
static TimescaleUnits *_QUARTERS = nil;
static TimescaleUnits *_HALF_YEARS = nil;
static TimescaleUnits *_YEARS = nil;
static NSMutableArray *_TYPE_VALUES = nil;

/**
 * Private constructor.
 * 
 * @param type int version of the enum
 * @param name enum name
 */

-(id)init:(int)type withName:(NSString *)name 
{
    self = [super init];
    if(self)
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

+(TimescaleUnits *)getInstance:(int)type
{
    TimescaleUnits *result;
    if(type < 0 || type >= [[TimescaleUnits TYPE_VALUES]count])
    {
        result = [TimescaleUnits NONE];
    }
    else
    {
        result = [[TimescaleUnits TYPE_VALUES]objectAtIndex:type];
    }
    return result;
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(TimescaleUnits *)getInstanceWithNumber:(NSNumber *)type
{
    int value;
    if(type == nil)
    {
        value = -1;
    }
    else
    {
        value = [NumberUtility getInt:type];
    }
    return [self getInstance:value];
}

/**
 * Accessor method used to retrieve the numeric representation of the enum.
 *
 * @return int representation of the enum
 */

-(int)getValue
{
    return _value;
}

/**
 * Retrieve the name of this alignment. Note that this is not
 * localised.
 *
 * @return name of this alignment type
 */

-(NSString *)getName
{   
    return _name;
}

/**
 * Generate a string representation of this instance.
 *
 * @return string representation of this instance
 */

-(NSString *)toString
{
    return [self getName];
}

+(TimescaleUnits *)NONE
{
  if(_NONE == nil)
  {
      _NONE = [[TimescaleUnits alloc] init:-1  withName:@"None"];
  }
  return _NONE;
}

+(TimescaleUnits *)MINUTES
{
  if(_MINUTES == nil)
  {
      _MINUTES = [[TimescaleUnits alloc] init:0  withName:@"Minutes"];
  }
  return _MINUTES;
}

+(TimescaleUnits *)HOURS
{
  if(_HOURS == nil)
  {
      _HOURS = [[TimescaleUnits alloc] init:1  withName:@"Hours"];
  }
  return _HOURS;
}

+(TimescaleUnits *)DAYS
{
  if(_DAYS == nil)
  {
      _DAYS = [[TimescaleUnits alloc] init:2  withName:@"Days"];
  }
  return _DAYS;
}

+(TimescaleUnits *)WEEKS
{
  if(_WEEKS == nil)
  {
      _WEEKS = [[TimescaleUnits alloc] init:3  withName:@"Weeks"];
  }
  return _WEEKS;
}

+(TimescaleUnits *)THIRDS_OF_MONTHS
{
  if(_THIRDS_OF_MONTHS == nil)
  {
      _THIRDS_OF_MONTHS = [[TimescaleUnits alloc] init:4  withName:@"Thirds of Months"];
  }
  return _THIRDS_OF_MONTHS;
}

+(TimescaleUnits *)MONTHS
{
  if(_MONTHS == nil)
  {
      _MONTHS = [[TimescaleUnits alloc] init:5  withName:@"Months"];
  }
  return _MONTHS;
}

+(TimescaleUnits *)QUARTERS
{
  if(_QUARTERS == nil)
  {
      _QUARTERS = [[TimescaleUnits alloc] init:6  withName:@"Quarters"];
  }
  return _QUARTERS;
}

+(TimescaleUnits *)HALF_YEARS
{
  if(_HALF_YEARS == nil)
  {
      _HALF_YEARS = [[TimescaleUnits alloc] init:7  withName:@"Half Years"];
  }
  return _HALF_YEARS;
}

+(TimescaleUnits *)YEARS
{
  if(_YEARS == nil)
  {
      _YEARS = [[TimescaleUnits alloc] init:8  withName:@"Years"];
  }
  return _YEARS;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      NSMutableArray *temp = [[NSMutableArray alloc] initWithObjects:[TimescaleUnits NONE], [TimescaleUnits MINUTES], [TimescaleUnits HOURS], [TimescaleUnits DAYS], [TimescaleUnits WEEKS], [TimescaleUnits THIRDS_OF_MONTHS], [TimescaleUnits MONTHS], [TimescaleUnits QUARTERS], [TimescaleUnits HALF_YEARS], [TimescaleUnits YEARS],  nil];
      
      _TYPE_VALUES = [EnumUtility createTypeArray:temp withOffSet:-1];
  }
  return _TYPE_VALUES;
}

@end
