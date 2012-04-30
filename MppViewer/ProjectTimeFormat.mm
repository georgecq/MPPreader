//
// ProjectTimeFormat.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProjectTimeFormat.h"
#import "NumberUtility.h"

@implementation ProjectTimeFormat

static ProjectTimeFormat *_TWELVE_HOUR = nil;
static ProjectTimeFormat *_TWENTY_FOUR_HOUR = nil;
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

+(ProjectTimeFormat *)getInstance:(int)type
{
    if(type < 0 || type >= [[ProjectTimeFormat TYPE_VALUES]count])
    {
        type = [[ProjectTimeFormat TWELVE_HOUR]getValue];
    }
    return [[ProjectTimeFormat TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(ProjectTimeFormat *)getInstanceWithNumber:(NSNumber *)type
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
 * Returns a string representation of the date format type
 * to be used as part of an MPX file.
 *
 * @return string representation
 */

-(NSString *)toString
{
    return [NSString stringWithFormat:@"%d", _value];
}

+(ProjectTimeFormat *)TWELVE_HOUR
{
  if(_TWELVE_HOUR == nil)
  {
      _TWELVE_HOUR = [[ProjectTimeFormat alloc] init:0];
  }
  return _TWELVE_HOUR;
}

+(ProjectTimeFormat *)TWENTY_FOUR_HOUR
{
  if(_TWENTY_FOUR_HOUR == nil)
  {
      _TWENTY_FOUR_HOUR = [[ProjectTimeFormat alloc] init:1];
  }
  return _TWENTY_FOUR_HOUR;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[ProjectTimeFormat TWELVE_HOUR], [ProjectTimeFormat TWENTY_FOUR_HOUR],  nil];
  }
  return _TYPE_VALUES;
}

@end
