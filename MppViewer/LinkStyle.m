//
// LinkStyle.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LinkStyle.h"
#import "NumberUtility.h"

@implementation LinkStyle

static LinkStyle *_NONE = nil;
static LinkStyle *_END_TOP = nil;
static LinkStyle *_END_START = nil;
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

+(LinkStyle *)getInstance:(int)type
{
    if(type < 0 || type >= [[LinkStyle TYPE_VALUES]count])
    {
        type = [[LinkStyle END_TOP]getValue];
    }
    return [[LinkStyle TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(LinkStyle *)getInstanceWithNumber:(NSNumber *)type
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

+(LinkStyle *)NONE
{
  if(_NONE == nil)
  {
      _NONE = [[LinkStyle alloc] init:0  withName:@"None"];
  }
  return _NONE;
}

+(LinkStyle *)END_TOP
{
  if(_END_TOP == nil)
  {
      _END_TOP = [[LinkStyle alloc] init:1  withName:@"End Top"];
  }
  return _END_TOP;
}

+(LinkStyle *)END_START
{
  if(_END_START == nil)
  {
      _END_START = [[LinkStyle alloc] init:2  withName:@"End Start"];
  }
  return _END_START;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[LinkStyle NONE], [LinkStyle END_TOP], [LinkStyle END_START],  nil];
  }
  return _TYPE_VALUES;
}

@end
