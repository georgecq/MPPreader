//
// Interval.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Interval.h"
#import "NumberUtility.h"

@implementation Interval

static Interval *_DAILY = nil;
static Interval *_WEEKLY = nil;
static Interval *_MONTHLY = nil;
static NSMutableArray *_TYPE_VALUES = nil;

/**
 * Private constructor.
 * 
 * @param type int version of the enum
 * @param name name of the enum
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

+(Interval *)getInstance:(int)type
{
    if(type < 0 || type >= [[Interval TYPE_VALUES]count])
    {
        type = [[Interval DAILY]getValue];
    }
    return [[Interval TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(Interval *)getInstanceWithNumber:(NSNumber *)type
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
 * Retrieve the line style name. Currently this is not localised.
 *
 * @return style name
 */

-(NSString *)getName
{
    return _name;
}

/**
 * Retrieve the String representation of this line style.
 *
 * @return String representation of this line style
 */

-(NSString *)toString
{
    return [self getName];
}

+(Interval *)DAILY
{
  if(_DAILY == nil)
  {
      _DAILY = [[Interval alloc] init:0  withName:@"Daily"];
  }
  return _DAILY;
}

+(Interval *)WEEKLY
{
  if(_WEEKLY == nil)
  {
      _WEEKLY = [[Interval alloc] init:1  withName:@"Weekly"];
  }
  return _WEEKLY;
}

+(Interval *)MONTHLY
{
  if(_MONTHLY == nil)
  {
      _MONTHLY = [[Interval alloc] init:2  withName:@"Monthly"];
  }
  return _MONTHLY;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[Interval DAILY], [Interval WEEKLY], [Interval MONTHLY],  nil];
  }
  return _TYPE_VALUES;
}

@end
