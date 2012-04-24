//
// ChartPattern.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ChartPattern.h"
#import "NumberUtility.h"

@implementation ChartPattern

static ChartPattern *_TRANSPARENT = nil;
static ChartPattern *_SOLID = nil;
static ChartPattern *_LIGHTDOTTED = nil;
static ChartPattern *_DOTTED = nil;
static ChartPattern *_HEAVYDOTTED = nil;
static ChartPattern *_BACKSLASH = nil;
static ChartPattern *_FORWARDSLASH = nil;
static ChartPattern *_CHECKERED = nil;
static ChartPattern *_VERTICALSTRIPE = nil;
static ChartPattern *_HORIZONTALSTRIPE = nil;
static ChartPattern *_GRID = nil;
static ChartPattern *_SOLIDHAIRY = nil;
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

+(ChartPattern *)getInstance:(int)type
{
    if(type < 0 || type >= [[ChartPattern TYPE_VALUES]count])
    {
        type = [[ChartPattern TRANSPARENT]getValue];
    }
    return [[ChartPattern TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(ChartPattern *)getInstanceWithNumber:(NSNumber *)type
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

+(ChartPattern *)TRANSPARENT
{
  if(_TRANSPARENT == nil)
  {
      _TRANSPARENT = [[ChartPattern alloc] init:0  withName:@"Transparent"];
  }
  return _TRANSPARENT;
}

+(ChartPattern *)SOLID
{
  if(_SOLID == nil)
  {
      _SOLID = [[ChartPattern alloc] init:1  withName:@"Solid"];
  }
  return _SOLID;
}

+(ChartPattern *)LIGHTDOTTED
{
  if(_LIGHTDOTTED == nil)
  {
      _LIGHTDOTTED = [[ChartPattern alloc] init:2  withName:@"Light Dotted"];
  }
  return _LIGHTDOTTED;
}

+(ChartPattern *)DOTTED
{
  if(_DOTTED == nil)
  {
      _DOTTED = [[ChartPattern alloc] init:3  withName:@"Dotted"];
  }
  return _DOTTED;
}

+(ChartPattern *)HEAVYDOTTED
{
  if(_HEAVYDOTTED == nil)
  {
      _HEAVYDOTTED = [[ChartPattern alloc] init:4  withName:@"Heavy Dotted"];
  }
  return _HEAVYDOTTED;
}

+(ChartPattern *)BACKSLASH
{
  if(_BACKSLASH == nil)
  {
      _BACKSLASH = [[ChartPattern alloc] init:5  withName:@"Back Slash"];
  }
  return _BACKSLASH;
}

+(ChartPattern *)FORWARDSLASH
{
  if(_FORWARDSLASH == nil)
  {
      _FORWARDSLASH = [[ChartPattern alloc] init:6  withName:@"Forward Slash"];
  }
  return _FORWARDSLASH;
}

+(ChartPattern *)CHECKERED
{
  if(_CHECKERED == nil)
  {
      _CHECKERED = [[ChartPattern alloc] init:7  withName:@"Checkered"];
  }
  return _CHECKERED;
}

+(ChartPattern *)VERTICALSTRIPE
{
  if(_VERTICALSTRIPE == nil)
  {
      _VERTICALSTRIPE = [[ChartPattern alloc] init:8  withName:@"Vertical Stripe"];
  }
  return _VERTICALSTRIPE;
}

+(ChartPattern *)HORIZONTALSTRIPE
{
  if(_HORIZONTALSTRIPE == nil)
  {
      _HORIZONTALSTRIPE = [[ChartPattern alloc] init:9  withName:@"Horizontal Stripe"];
  }
  return _HORIZONTALSTRIPE;
}

+(ChartPattern *)GRID
{
  if(_GRID == nil)
  {
      _GRID = [[ChartPattern alloc] init:10  withName:@"Grid"];
  }
  return _GRID;
}

+(ChartPattern *)SOLIDHAIRY
{
  if(_SOLIDHAIRY == nil)
  {
      _SOLIDHAIRY = [[ChartPattern alloc] init:11  withName:@"Solid Hairy"];
  }
  return _SOLIDHAIRY;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[ChartPattern TRANSPARENT], [ChartPattern SOLID], [ChartPattern LIGHTDOTTED], [ChartPattern DOTTED], [ChartPattern HEAVYDOTTED], [ChartPattern BACKSLASH], [ChartPattern FORWARDSLASH], [ChartPattern CHECKERED], [ChartPattern VERTICALSTRIPE], [ChartPattern HORIZONTALSTRIPE], [ChartPattern GRID], [ChartPattern SOLIDHAIRY],  nil];
  }
  return _TYPE_VALUES;
}

@end
