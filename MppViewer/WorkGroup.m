//
// WorkGroup.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WorkGroup.h"
#import "NumberUtility.h"

@implementation WorkGroup

static WorkGroup *_DEFAULT = nil;
static WorkGroup *_NONE = nil;
static WorkGroup *_EMAIL = nil;
static WorkGroup *_WEB = nil;
static NSMutableArray *_TYPE_VALUES = nil;

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

+(WorkGroup *)getInstance:(int)type
{
    if(type < 0 || type >= [[WorkGroup TYPE_VALUES]count])
    {
        type = [[WorkGroup NONE]getValue];
    }
    return [[WorkGroup TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(WorkGroup *)getInstanceWithNumber:(NSNumber *)type
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

+(WorkGroup *)DEFAULT
{
  if(_DEFAULT == nil)
  {
      _DEFAULT = [[WorkGroup alloc] init:0];
  }
  return _DEFAULT;
}

+(WorkGroup *)NONE
{
  if(_NONE == nil)
  {
      _NONE = [[WorkGroup alloc] init:1];
  }
  return _NONE;
}

+(WorkGroup *)EMAIL
{
  if(_EMAIL == nil)
  {
      _EMAIL = [[WorkGroup alloc] init:2];
  }
  return _EMAIL;
}

+(WorkGroup *)WEB
{
  if(_WEB == nil)
  {
      _WEB = [[WorkGroup alloc] init:3];
  }
  return _WEB;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[WorkGroup DEFAULT], [WorkGroup NONE], [WorkGroup EMAIL], [WorkGroup WEB],  nil];
  }
  return _TYPE_VALUES;
}

@end
