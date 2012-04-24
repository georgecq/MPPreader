//
// GanttBarStartEndShape.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GanttBarStartEndShape.h"
#import "NumberUtility.h"

@implementation GanttBarStartEndShape

static GanttBarStartEndShape *_NONE = nil;
static GanttBarStartEndShape *_NORTHHOMEPLATE = nil;
static GanttBarStartEndShape *_SOUTHHOMEPLATE = nil;
static GanttBarStartEndShape *_DIAMOND = nil;
static GanttBarStartEndShape *_UPARROW = nil;
static GanttBarStartEndShape *_DOWNARROW = nil;
static GanttBarStartEndShape *_RIGHTARROW = nil;
static GanttBarStartEndShape *_LEFTARROW = nil;
static GanttBarStartEndShape *_UPPOINTER = nil;
static GanttBarStartEndShape *_SOUTHMINIHOMEPLATE = nil;
static GanttBarStartEndShape *_NORTHMINIHOMEPLATE = nil;
static GanttBarStartEndShape *_VERTICALBAR = nil;
static GanttBarStartEndShape *_SQUARE = nil;
static GanttBarStartEndShape *_DIAMONDCIRCLED = nil;
static GanttBarStartEndShape *_DOWNPOINTER = nil;
static GanttBarStartEndShape *_UPARROWCIRCLED = nil;
static GanttBarStartEndShape *_DOWNARROWCIRCLED = nil;
static GanttBarStartEndShape *_UPPOINTERCIRCLED = nil;
static GanttBarStartEndShape *_DOWNPOINTERCIRCLED = nil;
static GanttBarStartEndShape *_CIRCLE = nil;
static GanttBarStartEndShape *_STAR = nil;
static GanttBarStartEndShape *_LEFTBRACKET = nil;
static GanttBarStartEndShape *_RIGHTBRACKET = nil;
static GanttBarStartEndShape *_LEFTGRADIENT = nil;
static GanttBarStartEndShape *_RIGHTGRADIENT = nil;
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

+(GanttBarStartEndShape *)getInstance:(int)type
{
    if(type < 0 || type >= [[GanttBarStartEndShape TYPE_VALUES]count])
    {
        type = [[GanttBarStartEndShape NONE]getValue];
    }
    return [[GanttBarStartEndShape TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(GanttBarStartEndShape *)getInstanceWithNumber:(NSNumber *)type
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

+(GanttBarStartEndShape *)NONE
{
  if(_NONE == nil)
  {
      _NONE = [[GanttBarStartEndShape alloc] init:0  withName:@"None"];
  }
  return _NONE;
}

+(GanttBarStartEndShape *)NORTHHOMEPLATE
{
  if(_NORTHHOMEPLATE == nil)
  {
      _NORTHHOMEPLATE = [[GanttBarStartEndShape alloc] init:1  withName:@"North Home Plate"];
  }
  return _NORTHHOMEPLATE;
}

+(GanttBarStartEndShape *)SOUTHHOMEPLATE
{
  if(_SOUTHHOMEPLATE == nil)
  {
      _SOUTHHOMEPLATE = [[GanttBarStartEndShape alloc] init:2  withName:@"South Home Plate"];
  }
  return _SOUTHHOMEPLATE;
}

+(GanttBarStartEndShape *)DIAMOND
{
  if(_DIAMOND == nil)
  {
      _DIAMOND = [[GanttBarStartEndShape alloc] init:3  withName:@"Diamond"];
  }
  return _DIAMOND;
}

+(GanttBarStartEndShape *)UPARROW
{
  if(_UPARROW == nil)
  {
      _UPARROW = [[GanttBarStartEndShape alloc] init:4  withName:@"Up Arrow"];
  }
  return _UPARROW;
}

+(GanttBarStartEndShape *)DOWNARROW
{
  if(_DOWNARROW == nil)
  {
      _DOWNARROW = [[GanttBarStartEndShape alloc] init:5  withName:@"Down Arrow"];
  }
  return _DOWNARROW;
}

+(GanttBarStartEndShape *)RIGHTARROW
{
  if(_RIGHTARROW == nil)
  {
      _RIGHTARROW = [[GanttBarStartEndShape alloc] init:6  withName:@"Right Arrow"];
  }
  return _RIGHTARROW;
}

+(GanttBarStartEndShape *)LEFTARROW
{
  if(_LEFTARROW == nil)
  {
      _LEFTARROW = [[GanttBarStartEndShape alloc] init:7  withName:@"Left Arrow"];
  }
  return _LEFTARROW;
}

+(GanttBarStartEndShape *)UPPOINTER
{
  if(_UPPOINTER == nil)
  {
      _UPPOINTER = [[GanttBarStartEndShape alloc] init:8  withName:@"Up Pointer"];
  }
  return _UPPOINTER;
}

+(GanttBarStartEndShape *)SOUTHMINIHOMEPLATE
{
  if(_SOUTHMINIHOMEPLATE == nil)
  {
      _SOUTHMINIHOMEPLATE = [[GanttBarStartEndShape alloc] init:9  withName:@"South Mini Home Plate"];
  }
  return _SOUTHMINIHOMEPLATE;
}

+(GanttBarStartEndShape *)NORTHMINIHOMEPLATE
{
  if(_NORTHMINIHOMEPLATE == nil)
  {
      _NORTHMINIHOMEPLATE = [[GanttBarStartEndShape alloc] init:10  withName:@"North Mini Home Plate"];
  }
  return _NORTHMINIHOMEPLATE;
}

+(GanttBarStartEndShape *)VERTICALBAR
{
  if(_VERTICALBAR == nil)
  {
      _VERTICALBAR = [[GanttBarStartEndShape alloc] init:11  withName:@"Vertical Bar"];
  }
  return _VERTICALBAR;
}

+(GanttBarStartEndShape *)SQUARE
{
  if(_SQUARE == nil)
  {
      _SQUARE = [[GanttBarStartEndShape alloc] init:12  withName:@"Square"];
  }
  return _SQUARE;
}

+(GanttBarStartEndShape *)DIAMONDCIRCLED
{
  if(_DIAMONDCIRCLED == nil)
  {
      _DIAMONDCIRCLED = [[GanttBarStartEndShape alloc] init:13  withName:@"Diamond Circled"];
  }
  return _DIAMONDCIRCLED;
}

+(GanttBarStartEndShape *)DOWNPOINTER
{
  if(_DOWNPOINTER == nil)
  {
      _DOWNPOINTER = [[GanttBarStartEndShape alloc] init:14  withName:@"Down Pointer"];
  }
  return _DOWNPOINTER;
}

+(GanttBarStartEndShape *)UPARROWCIRCLED
{
  if(_UPARROWCIRCLED == nil)
  {
      _UPARROWCIRCLED = [[GanttBarStartEndShape alloc] init:15  withName:@"Up Arrow Circled"];
  }
  return _UPARROWCIRCLED;
}

+(GanttBarStartEndShape *)DOWNARROWCIRCLED
{
  if(_DOWNARROWCIRCLED == nil)
  {
      _DOWNARROWCIRCLED = [[GanttBarStartEndShape alloc] init:16  withName:@"Down Arrow Circled"];
  }
  return _DOWNARROWCIRCLED;
}

+(GanttBarStartEndShape *)UPPOINTERCIRCLED
{
  if(_UPPOINTERCIRCLED == nil)
  {
      _UPPOINTERCIRCLED = [[GanttBarStartEndShape alloc] init:17  withName:@"Up Pointer Circled"];
  }
  return _UPPOINTERCIRCLED;
}

+(GanttBarStartEndShape *)DOWNPOINTERCIRCLED
{
  if(_DOWNPOINTERCIRCLED == nil)
  {
      _DOWNPOINTERCIRCLED = [[GanttBarStartEndShape alloc] init:18  withName:@"Down Pointer Circled"];
  }
  return _DOWNPOINTERCIRCLED;
}

+(GanttBarStartEndShape *)CIRCLE
{
  if(_CIRCLE == nil)
  {
      _CIRCLE = [[GanttBarStartEndShape alloc] init:19  withName:@"Circle"];
  }
  return _CIRCLE;
}

+(GanttBarStartEndShape *)STAR
{
  if(_STAR == nil)
  {
      _STAR = [[GanttBarStartEndShape alloc] init:20  withName:@"Star"];
  }
  return _STAR;
}

+(GanttBarStartEndShape *)LEFTBRACKET
{
  if(_LEFTBRACKET == nil)
  {
      _LEFTBRACKET = [[GanttBarStartEndShape alloc] init:21  withName:@"Left Bracket"];
  }
  return _LEFTBRACKET;
}

+(GanttBarStartEndShape *)RIGHTBRACKET
{
  if(_RIGHTBRACKET == nil)
  {
      _RIGHTBRACKET = [[GanttBarStartEndShape alloc] init:22  withName:@"Right Bracket"];
  }
  return _RIGHTBRACKET;
}

+(GanttBarStartEndShape *)LEFTGRADIENT
{
  if(_LEFTGRADIENT == nil)
  {
      _LEFTGRADIENT = [[GanttBarStartEndShape alloc] init:23  withName:@"Left Gradient"];
  }
  return _LEFTGRADIENT;
}

+(GanttBarStartEndShape *)RIGHTGRADIENT
{
  if(_RIGHTGRADIENT == nil)
  {
      _RIGHTGRADIENT = [[GanttBarStartEndShape alloc] init:24  withName:@"Right Gradient"];
  }
  return _RIGHTGRADIENT;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[GanttBarStartEndShape NONE], [GanttBarStartEndShape NORTHHOMEPLATE], [GanttBarStartEndShape SOUTHHOMEPLATE], [GanttBarStartEndShape DIAMOND], [GanttBarStartEndShape UPARROW], [GanttBarStartEndShape DOWNARROW], [GanttBarStartEndShape RIGHTARROW], [GanttBarStartEndShape LEFTARROW], [GanttBarStartEndShape UPPOINTER], [GanttBarStartEndShape SOUTHMINIHOMEPLATE], [GanttBarStartEndShape NORTHMINIHOMEPLATE], [GanttBarStartEndShape VERTICALBAR], [GanttBarStartEndShape SQUARE], [GanttBarStartEndShape DIAMONDCIRCLED], [GanttBarStartEndShape DOWNPOINTER], [GanttBarStartEndShape UPARROWCIRCLED], [GanttBarStartEndShape DOWNARROWCIRCLED], [GanttBarStartEndShape UPPOINTERCIRCLED], [GanttBarStartEndShape DOWNPOINTERCIRCLED], [GanttBarStartEndShape CIRCLE], [GanttBarStartEndShape STAR], [GanttBarStartEndShape LEFTBRACKET], [GanttBarStartEndShape RIGHTBRACKET], [GanttBarStartEndShape LEFTGRADIENT], [GanttBarStartEndShape RIGHTGRADIENT],  nil];
  }
  return _TYPE_VALUES;
}

@end
