//
// GanttBarStartEndType.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GanttBarStartEndType.h"
#import "NumberUtility.h"

@implementation GanttBarStartEndType

static GanttBarStartEndType *_SOLID = nil;
static GanttBarStartEndType *_FRAMED = nil;
static GanttBarStartEndType *_DASHED = nil;
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

+(GanttBarStartEndType *)getInstance:(int)type
{
    if(type < 0 || type >= [[GanttBarStartEndType TYPE_VALUES]count])
    {
        type = [[GanttBarStartEndType SOLID]getValue];
    }
    return [[GanttBarStartEndType TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(GanttBarStartEndType *)getInstanceWithNumber:(NSNumber *)type
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

+(GanttBarStartEndType *)SOLID
{
  if(_SOLID == nil)
  {
      _SOLID = [[GanttBarStartEndType alloc] init:0  withName:@"Solid"];
  }
  return _SOLID;
}

+(GanttBarStartEndType *)FRAMED
{
  if(_FRAMED == nil)
  {
      _FRAMED = [[GanttBarStartEndType alloc] init:1  withName:@"Framed"];
  }
  return _FRAMED;
}

+(GanttBarStartEndType *)DASHED
{
  if(_DASHED == nil)
  {
      _DASHED = [[GanttBarStartEndType alloc] init:2  withName:@"Dashed"];
  }
  return _DASHED;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[GanttBarStartEndType SOLID], [GanttBarStartEndType FRAMED], [GanttBarStartEndType DASHED],  nil];
  }
  return _TYPE_VALUES;
}

@end
