//
// NonWorkingTimeStyle.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NonWorkingTimeStyle.h"
#import "NumberUtility.h"

@implementation NonWorkingTimeStyle

static NonWorkingTimeStyle *_BEHIND = nil;
static NonWorkingTimeStyle *_IN_FRONT = nil;
static NonWorkingTimeStyle *_DO_NOT_DRAW = nil;
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

+(NonWorkingTimeStyle *)getInstance:(int)type
{
    if(type < 0 || type >= [[NonWorkingTimeStyle TYPE_VALUES]count])
    {
        type = [[NonWorkingTimeStyle IN_FRONT]getValue];
    }
    return [[NonWorkingTimeStyle TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(NonWorkingTimeStyle *)getInstanceWithNumber:(NSNumber *)type
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

+(NonWorkingTimeStyle *)BEHIND
{
  if(_BEHIND == nil)
  {
      _BEHIND = [[NonWorkingTimeStyle alloc] init:0  withName:@"Behind"];
  }
  return _BEHIND;
}

+(NonWorkingTimeStyle *)IN_FRONT
{
  if(_IN_FRONT == nil)
  {
      _IN_FRONT = [[NonWorkingTimeStyle alloc] init:1  withName:@"In Front"];
  }
  return _IN_FRONT;
}

+(NonWorkingTimeStyle *)DO_NOT_DRAW
{
  if(_DO_NOT_DRAW == nil)
  {
      _DO_NOT_DRAW = [[NonWorkingTimeStyle alloc] init:2  withName:@"Do Not Draw"];
  }
  return _DO_NOT_DRAW;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[NonWorkingTimeStyle BEHIND], [NonWorkingTimeStyle IN_FRONT], [NonWorkingTimeStyle DO_NOT_DRAW],  nil];
  }
  return _TYPE_VALUES;
}

@end
