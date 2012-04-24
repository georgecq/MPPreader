//
// GanttBarMiddleShape.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GanttBarMiddleShape.h"
#import "NumberUtility.h"

@implementation GanttBarMiddleShape

static GanttBarMiddleShape *_NONE = nil;
static GanttBarMiddleShape *_ROUNDED = nil;
static GanttBarMiddleShape *_TOPTHINROUNDED = nil;
static GanttBarMiddleShape *_MIDDLETHINROUNDED = nil;
static GanttBarMiddleShape *_BOTTOMTHINROUNDED = nil;
static GanttBarMiddleShape *_TOPLINE = nil;
static GanttBarMiddleShape *_MIDDLELINE = nil;
static GanttBarMiddleShape *_BOTTOMLINE = nil;
static NSMutableArray *_TYPE_VALUES = nil;

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

+(GanttBarMiddleShape *)getInstance:(int)type
{
    if(type < 0 || type >= [[GanttBarMiddleShape TYPE_VALUES]count])
    {
        type = [[GanttBarMiddleShape NONE]getValue];
    }
    return [[GanttBarMiddleShape TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(GanttBarMiddleShape *)getInstanceWithNumber:(NSNumber *)type
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

+(GanttBarMiddleShape *)NONE
{
  if(_NONE == nil)
  {
      _NONE = [[GanttBarMiddleShape alloc] init:0  withName:@"None"];
  }
  return _NONE;
}

+(GanttBarMiddleShape *)ROUNDED
{
  if(_ROUNDED == nil)
  {
      _ROUNDED = [[GanttBarMiddleShape alloc] init:1  withName:@"Rounded"];
  }
  return _ROUNDED;
}

+(GanttBarMiddleShape *)TOPTHINROUNDED
{
  if(_TOPTHINROUNDED == nil)
  {
      _TOPTHINROUNDED = [[GanttBarMiddleShape alloc] init:2  withName:@"Top Thin Rounded"];
  }
  return _TOPTHINROUNDED;
}

+(GanttBarMiddleShape *)MIDDLETHINROUNDED
{
  if(_MIDDLETHINROUNDED == nil)
  {
      _MIDDLETHINROUNDED = [[GanttBarMiddleShape alloc] init:3  withName:@"Middle Thin Rounded"];
  }
  return _MIDDLETHINROUNDED;
}

+(GanttBarMiddleShape *)BOTTOMTHINROUNDED
{
  if(_BOTTOMTHINROUNDED == nil)
  {
      _BOTTOMTHINROUNDED = [[GanttBarMiddleShape alloc] init:4  withName:@"Bottom Thin Rounded"];
  }
  return _BOTTOMTHINROUNDED;
}

+(GanttBarMiddleShape *)TOPLINE
{
  if(_TOPLINE == nil)
  {
      _TOPLINE = [[GanttBarMiddleShape alloc] init:5  withName:@"Top Line"];
  }
  return _TOPLINE;
}

+(GanttBarMiddleShape *)MIDDLELINE
{
  if(_MIDDLELINE == nil)
  {
      _MIDDLELINE = [[GanttBarMiddleShape alloc] init:6  withName:@"Middle Line"];
  }
  return _MIDDLELINE;
}

+(GanttBarMiddleShape *)BOTTOMLINE
{
  if(_BOTTOMLINE == nil)
  {
      _BOTTOMLINE = [[GanttBarMiddleShape alloc] init:7  withName:@"Bottom Line"];
  }
  return _BOTTOMLINE;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[GanttBarMiddleShape NONE], [GanttBarMiddleShape ROUNDED], [GanttBarMiddleShape TOPTHINROUNDED], [GanttBarMiddleShape MIDDLETHINROUNDED], [GanttBarMiddleShape BOTTOMTHINROUNDED], [GanttBarMiddleShape TOPLINE], [GanttBarMiddleShape MIDDLELINE], [GanttBarMiddleShape BOTTOMLINE],  nil];
  }
  return _TYPE_VALUES;
}

@end
