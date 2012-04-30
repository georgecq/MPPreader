//
// WorkContour.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WorkContour.h"
#import "NumberUtility.h"

@implementation WorkContour

static WorkContour *_FLAT = nil;
static WorkContour *_BACK_LOADED = nil;
static WorkContour *_FRONT_LOADED = nil;
static WorkContour *_DOUBLE_PEAK = nil;
static WorkContour *_EARLY_PEAK = nil;
static WorkContour *_LATE_PEAK = nil;
static WorkContour *_BELL = nil;
static WorkContour *_TURTLE = nil;
static WorkContour *_CONTOURED = nil;
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

+(WorkContour *)getInstance:(int)type
{
    if(type < 0 || type >= [[WorkContour TYPE_VALUES]count])
    {
        type = [[WorkContour FLAT]getValue];
    }
    return [[WorkContour TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(WorkContour *)getInstanceWithNumber:(NSNumber *)type
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

+(WorkContour *)FLAT
{
  if(_FLAT == nil)
  {
      _FLAT = [[WorkContour alloc] init:0];
  }
  return _FLAT;
}

+(WorkContour *)BACK_LOADED
{
  if(_BACK_LOADED == nil)
  {
      _BACK_LOADED = [[WorkContour alloc] init:1];
  }
  return _BACK_LOADED;
}

+(WorkContour *)FRONT_LOADED
{
  if(_FRONT_LOADED == nil)
  {
      _FRONT_LOADED = [[WorkContour alloc] init:2];
  }
  return _FRONT_LOADED;
}

+(WorkContour *)DOUBLE_PEAK
{
  if(_DOUBLE_PEAK == nil)
  {
      _DOUBLE_PEAK = [[WorkContour alloc] init:3];
  }
  return _DOUBLE_PEAK;
}

+(WorkContour *)EARLY_PEAK
{
  if(_EARLY_PEAK == nil)
  {
      _EARLY_PEAK = [[WorkContour alloc] init:4];
  }
  return _EARLY_PEAK;
}

+(WorkContour *)LATE_PEAK
{
  if(_LATE_PEAK == nil)
  {
      _LATE_PEAK = [[WorkContour alloc] init:5];
  }
  return _LATE_PEAK;
}

+(WorkContour *)BELL
{
  if(_BELL == nil)
  {
      _BELL = [[WorkContour alloc] init:6];
  }
  return _BELL;
}

+(WorkContour *)TURTLE
{
  if(_TURTLE == nil)
  {
      _TURTLE = [[WorkContour alloc] init:7];
  }
  return _TURTLE;
}

+(WorkContour *)CONTOURED
{
  if(_CONTOURED == nil)
  {
      _CONTOURED = [[WorkContour alloc] init:8];
  }
  return _CONTOURED;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[WorkContour FLAT], [WorkContour BACK_LOADED], [WorkContour FRONT_LOADED], [WorkContour DOUBLE_PEAK], [WorkContour EARLY_PEAK], [WorkContour LATE_PEAK], [WorkContour BELL], [WorkContour TURTLE], [WorkContour CONTOURED],  nil];
  }
  return _TYPE_VALUES;
}

@end
