//
// ScheduleFrom.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScheduleFrom.h"
#import "NumberUtility.h"

@implementation ScheduleFrom

static ScheduleFrom *_START = nil;
static ScheduleFrom *_FINISH = nil;
static NSMutableArray *_TYPE_VALUES = nil;

/**
 * Private constructor.
 * 
 * @param type int version of the enum
 */

-(id)init:(int)type
{
    self = [super init];
    if(self)
    {
        _value = type;
    }
    return self;
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(ScheduleFrom *)getInstance:(int)type
{
    if(type < 0 || type >= [[ScheduleFrom TYPE_VALUES]count])
    {
        type = [[ScheduleFrom START]getValue];
    }
    return [[ScheduleFrom TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(ScheduleFrom *)getInstanceWithNumber:(NSNumber *)type
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
 * Returns a string representation of the schedule from type
 * to be used as part of an MPX file.
 *
 * @return string representation
 */

-(NSString *)toString
{
    return [NSString stringWithFormat:@"%d", _value];
}

+(ScheduleFrom *)START
{
  if(_START == nil)
  {
      _START = [[ScheduleFrom alloc] init:0];
  }
  return _START;
}

+(ScheduleFrom *)FINISH
{
  if(_FINISH == nil)
  {
      _FINISH = [[ScheduleFrom alloc] init:1];
  }
  return _FINISH;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[ScheduleFrom START], [ScheduleFrom FINISH],  nil];
  }
  return _TYPE_VALUES;
}

@end
