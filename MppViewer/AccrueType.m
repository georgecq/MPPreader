//
// AccrueType.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AccrueType.h"
#import "EnumUtility.h"

@implementation AccrueType

static AccrueType *_START = nil;
static AccrueType *_END = nil;
static AccrueType *_PRORATED = nil;
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

+(AccrueType *)getInstance:(int)type
{
    if(type < 0 || type >= [[AccrueType TYPE_VALUES] count])
    {
        type = [[AccrueType PRORATED] getValue];
    }
    return [[AccrueType TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(AccrueType *)getInstanceWithNumber:(NSNumber *)type
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

+(AccrueType *)START
{
  if(_START == nil)
  {
      _START = [[AccrueType alloc] init:1];
  }
  return _START;
}

+(AccrueType *)END
{
  if(_END == nil)
  {
      _END = [[AccrueType alloc] init:2];
  }
  return _END;
}

+(AccrueType *)PRORATED
{
  if(_PRORATED == nil)
  {
      _PRORATED = [[AccrueType alloc] init:3];
  }
  return _PRORATED;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      NSMutableArray *temp = [[NSMutableArray alloc] initWithObjects:[AccrueType START], [AccrueType END], [AccrueType PRORATED],  nil];
      
      _TYPE_VALUES = [EnumUtility createTypeArray:temp withOffSet:1];
  }
  return _TYPE_VALUES;
}

@end
