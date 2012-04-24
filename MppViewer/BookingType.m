//
// BookingType.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BookingType.h"

@implementation BookingType

static BookingType *_COMMITTED = nil;
static BookingType *_PROPOSED = nil;
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

+(BookingType *)getInstance:(int)type
{
    if(type < 0 || type >= [[BookingType TYPE_VALUES] count])
    {
        type = [[BookingType PROPOSED]getValue];
    }
    return [[BookingType TYPE_VALUES]objectAtIndex:type];
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

+(BookingType *)COMMITTED
{
  if(_COMMITTED == nil)
  {
      _COMMITTED = [[BookingType alloc] init:0];
  }
  return _COMMITTED;
}

+(BookingType *)PROPOSED
{
  if(_PROPOSED == nil)
  {
      _PROPOSED = [[BookingType alloc] init:1];
  }
  return _PROPOSED;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[BookingType COMMITTED], [BookingType PROPOSED],  nil];
  }
  return _TYPE_VALUES;
}

@end
