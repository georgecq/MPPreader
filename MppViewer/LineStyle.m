//
// LineStyle.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LineStyle.h"
#import "EnumUtility.h"
#import "NumberUtility.h"

@implementation LineStyle

static LineStyle *_NONE = nil;
static LineStyle *_SOLID = nil;
static LineStyle *_DOTTED1 = nil;
static LineStyle *_DOTTED2 = nil;
static LineStyle *_DASHED = nil;
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

+(LineStyle *)getInstance:(int)type
{
    if(type < 0 || type >= [[LineStyle TYPE_VALUES]count])
    {
        type = [[LineStyle NONE]getValue];
    }
    return [[LineStyle TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(LineStyle *)getInstanceWithNumber:(NSNumber *)type
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

+(LineStyle *)NONE
{
  if(_NONE == nil)
  {
      _NONE = [[LineStyle alloc] init:0  withName:@"None"];
  }
  return _NONE;
}

+(LineStyle *)SOLID
{
  if(_SOLID == nil)
  {
      _SOLID = [[LineStyle alloc] init:1  withName:@"Solid"];
  }
  return _SOLID;
}

+(LineStyle *)DOTTED1
{
  if(_DOTTED1 == nil)
  {
      _DOTTED1 = [[LineStyle alloc] init:2  withName:@"Dotted1"];
  }
  return _DOTTED1;
}

+(LineStyle *)DOTTED2
{
  if(_DOTTED2 == nil)
  {
      _DOTTED2 = [[LineStyle alloc] init:3  withName:@"Dotted2"];
  }
  return _DOTTED2;
}

+(LineStyle *)DASHED
{
  if(_DASHED == nil)
  {
      _DASHED = [[LineStyle alloc] init:4  withName:@"Dashed"];
  }
  return _DASHED;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      NSMutableArray *temp = [[NSMutableArray alloc] initWithObjects:[LineStyle NONE], [LineStyle SOLID], [LineStyle DOTTED1], [LineStyle DOTTED2], [LineStyle DASHED],  nil];
      
      _TYPE_VALUES = [EnumUtility createTypeArray:temp withOffSet:1];
  }
  return _TYPE_VALUES;
}

@end
