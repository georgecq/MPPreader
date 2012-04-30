//
// BackgroundPattern.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BackgroundPattern.h"

@implementation BackgroundPattern

static BackgroundPattern *_TRANSPARENT = nil;
static BackgroundPattern *_SOLID = nil;
static BackgroundPattern *_LIGHTDOTTED = nil;
static BackgroundPattern *_DOTTED = nil;
static BackgroundPattern *_HEAVYDOTTED = nil;
static BackgroundPattern *_BACKSLASH = nil;
static BackgroundPattern *_FORWARDSLASH = nil;
static BackgroundPattern *_INVERSEBACKSLASH = nil;
static BackgroundPattern *_INVERSEFORWARDSLASH = nil;
static BackgroundPattern *_LIGHTVERTICALSTRIPE = nil;
static BackgroundPattern *_HEAVYVERTICALSTRIPE = nil;
static BackgroundPattern *_CHECKERED = nil;
static BackgroundPattern *_DENSEFORWARDSLASH = nil;
static BackgroundPattern *_INVERSECHECKERED = nil;
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

+(BackgroundPattern *)getInstance:(int)type
{
    if(type < 0 || type >= [[BackgroundPattern TYPE_VALUES]count])
    {
        type = [[BackgroundPattern TRANSPARENT]getValue];
    }
    return [[BackgroundPattern TYPE_VALUES]objectAtIndex:type];
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

+(BackgroundPattern *)TRANSPARENT
{
  if(_TRANSPARENT == nil)
  {
      _TRANSPARENT = [[BackgroundPattern alloc] init:0  withName:@"Transparent"];
  }
  return _TRANSPARENT;
}

+(BackgroundPattern *)SOLID
{
  if(_SOLID == nil)
  {
      _SOLID = [[BackgroundPattern alloc] init:1  withName:@"Solid"];
  }
  return _SOLID;
}

+(BackgroundPattern *)LIGHTDOTTED
{
  if(_LIGHTDOTTED == nil)
  {
      _LIGHTDOTTED = [[BackgroundPattern alloc] init:2  withName:@"Light Dotted"];
  }
  return _LIGHTDOTTED;
}

+(BackgroundPattern *)DOTTED
{
  if(_DOTTED == nil)
  {
      _DOTTED = [[BackgroundPattern alloc] init:3  withName:@"Dotted"];
  }
  return _DOTTED;
}

+(BackgroundPattern *)HEAVYDOTTED
{
  if(_HEAVYDOTTED == nil)
  {
      _HEAVYDOTTED = [[BackgroundPattern alloc] init:4  withName:@"Heavy Dotted"];
  }
  return _HEAVYDOTTED;
}

+(BackgroundPattern *)BACKSLASH
{
  if(_BACKSLASH == nil)
  {
      _BACKSLASH = [[BackgroundPattern alloc] init:5  withName:@"Back Slash"];
  }
  return _BACKSLASH;
}

+(BackgroundPattern *)FORWARDSLASH
{
  if(_FORWARDSLASH == nil)
  {
      _FORWARDSLASH = [[BackgroundPattern alloc] init:6  withName:@"Forward Slash"];
  }
  return _FORWARDSLASH;
}

+(BackgroundPattern *)INVERSEBACKSLASH
{
  if(_INVERSEBACKSLASH == nil)
  {
      _INVERSEBACKSLASH = [[BackgroundPattern alloc] init:7  withName:@"Inverse Back Slash"];
  }
  return _INVERSEBACKSLASH;
}

+(BackgroundPattern *)INVERSEFORWARDSLASH
{
  if(_INVERSEFORWARDSLASH == nil)
  {
      _INVERSEFORWARDSLASH = [[BackgroundPattern alloc] init:8  withName:@"Inverse Forward Slash"];
  }
  return _INVERSEFORWARDSLASH;
}

+(BackgroundPattern *)LIGHTVERTICALSTRIPE
{
  if(_LIGHTVERTICALSTRIPE == nil)
  {
      _LIGHTVERTICALSTRIPE = [[BackgroundPattern alloc] init:9  withName:@"Light Vertical Stripe"];
  }
  return _LIGHTVERTICALSTRIPE;
}

+(BackgroundPattern *)HEAVYVERTICALSTRIPE
{
  if(_HEAVYVERTICALSTRIPE == nil)
  {
      _HEAVYVERTICALSTRIPE = [[BackgroundPattern alloc] init:10  withName:@"Heavy Vertical Stripe"];
  }
  return _HEAVYVERTICALSTRIPE;
}

+(BackgroundPattern *)CHECKERED
{
  if(_CHECKERED == nil)
  {
      _CHECKERED = [[BackgroundPattern alloc] init:11  withName:@"Checkered"];
  }
  return _CHECKERED;
}

+(BackgroundPattern *)DENSEFORWARDSLASH
{
  if(_DENSEFORWARDSLASH == nil)
  {
      _DENSEFORWARDSLASH = [[BackgroundPattern alloc] init:12  withName:@"Dense Forward Slash"];
  }
  return _DENSEFORWARDSLASH;
}

+(BackgroundPattern *)INVERSECHECKERED
{
  if(_INVERSECHECKERED == nil)
  {
      _INVERSECHECKERED = [[BackgroundPattern alloc] init:13  withName:@"Inverse Checkered"];
  }
  return _INVERSECHECKERED;
}

/**
 * Array mapping int types to enums.
 */

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[BackgroundPattern TRANSPARENT], [BackgroundPattern SOLID], [BackgroundPattern LIGHTDOTTED], [BackgroundPattern DOTTED], [BackgroundPattern HEAVYDOTTED], [BackgroundPattern BACKSLASH], [BackgroundPattern FORWARDSLASH], [BackgroundPattern INVERSEBACKSLASH], [BackgroundPattern INVERSEFORWARDSLASH], [BackgroundPattern LIGHTVERTICALSTRIPE], [BackgroundPattern HEAVYVERTICALSTRIPE], [BackgroundPattern CHECKERED], [BackgroundPattern DENSEFORWARDSLASH], [BackgroundPattern INVERSECHECKERED],  nil];
  }
  return _TYPE_VALUES;
}

@end
