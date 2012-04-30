//
// TimescaleAlignment.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimescaleAlignment.h"
#import "NumberUtility.h"

@implementation TimescaleAlignment

static TimescaleAlignment *_LEFT = nil;
static TimescaleAlignment *_CENTER = nil;
static TimescaleAlignment *_RIGHT = nil;
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

+(TimescaleAlignment *)getInstance:(int)type
{
    if(type < 0 || type >= [[TimescaleAlignment TYPE_VALUES]count])
    {
        type = [[TimescaleAlignment CENTER]getValue];
    }
    return [[TimescaleAlignment TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(TimescaleAlignment *)getInstanceWithNumber:(NSNumber *)type
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
 * Retrieve the name of this alignment. Note that this is not
 * localised.
 *
 * @return name of this alignment type
 */

-(NSString *)getName
{   
    return _name;
}

/**
 * Generate a string representation of this instance.
 *
 * @return string representation of this instance
 */

-(NSString *)toString
{
    return [self getName];
}

+(TimescaleAlignment *)LEFT
{
  if(_LEFT == nil)
  {
      _LEFT = [[TimescaleAlignment alloc] init:0  withName:@"Left"];
  }
  return _LEFT;
}

+(TimescaleAlignment *)CENTER
{
  if(_CENTER == nil)
  {
      _CENTER = [[TimescaleAlignment alloc] init:1  withName:@"Center"];
  }
  return _CENTER;
}

+(TimescaleAlignment *)RIGHT
{
  if(_RIGHT == nil)
  {
      _RIGHT = [[TimescaleAlignment alloc] init:2  withName:@"Right"];
  }
  return _RIGHT;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[TimescaleAlignment LEFT], [TimescaleAlignment CENTER], [TimescaleAlignment RIGHT],  nil];
  }
  return _TYPE_VALUES;
}

@end
