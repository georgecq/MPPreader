//
// ResourceType.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ResourceType.h"
#import "NumberUtility.h"

@implementation ResourceType

static ResourceType *_MATERIAL = nil;
static ResourceType *_WORK = nil;
static ResourceType *_COST = nil;
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

+(ResourceType *)getInstance:(int)type
{
    if(type < 0 || type >= [[ResourceType TYPE_VALUES]count])
    {
        type = [[ResourceType WORK]getValue];
    }
    return [[ResourceType TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(ResourceType *)getInstanceWithNumber:(NSNumber *)type
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
 * {@inheritDoc}
 */

-(NSString *)toString
{
    return _name;
}

+(ResourceType *)MATERIAL
{
  if(_MATERIAL == nil)
  {
      _MATERIAL = [[ResourceType alloc] init:0  withName:@"Material"];
  }
  return _MATERIAL;
}

+(ResourceType *)WORK
{
  if(_WORK == nil)
  {
      _WORK = [[ResourceType alloc] init:1  withName:@"Work"];
  }
  return _WORK;
}

+(ResourceType *)COST
{
  if(_COST == nil)
  {
      _COST = [[ResourceType alloc] init:2  withName:@"Cost"];
  }
  return _COST;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[ResourceType MATERIAL], [ResourceType WORK], [ResourceType COST],  nil];
  }
  return _TYPE_VALUES;
}

@end
