//
// EarnedValueMethod.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EarnedValueMethod.h"
#import "NumberUtility.h"

@implementation EarnedValueMethod

static EarnedValueMethod *_PERCENT_COMPLETE = nil;
static EarnedValueMethod *_PHYSICAL_PERCENT_COMPLETE = nil;
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

+(EarnedValueMethod *)getInstance:(int)type
{
    if(type < 0 || type >= [[EarnedValueMethod TYPE_VALUES]count])
    {
        type = [[EarnedValueMethod PHYSICAL_PERCENT_COMPLETE]getValue];
    }
    return [[EarnedValueMethod TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(EarnedValueMethod *)getInstanceWithNumber:(NSNumber *)type
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

+(EarnedValueMethod *)PERCENT_COMPLETE
{
  if(_PERCENT_COMPLETE == nil)
  {
      _PERCENT_COMPLETE = [[EarnedValueMethod alloc] init:0];
  }
  return _PERCENT_COMPLETE;
}

+(EarnedValueMethod *)PHYSICAL_PERCENT_COMPLETE
{
  if(_PHYSICAL_PERCENT_COMPLETE == nil)
  {
      _PHYSICAL_PERCENT_COMPLETE = [[EarnedValueMethod alloc] init:1];
  }
  return _PHYSICAL_PERCENT_COMPLETE;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[EarnedValueMethod PERCENT_COMPLETE], [EarnedValueMethod PHYSICAL_PERCENT_COMPLETE],  nil];
  }
  return _TYPE_VALUES;
}

@end
