//
// ColorType.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ColorType.h"
#import "NumberUtility.h"

@implementation ColorType

static ColorType *_BLACK = nil;
static ColorType *_RED = nil;
static ColorType *_YELLOW = nil;
static ColorType *_LIME = nil;
static ColorType *_AQUA = nil;
static ColorType *_BLUE = nil;
static ColorType *_FUSCHIA = nil;
static ColorType *_WHITE = nil;
static ColorType *_MAROON = nil;
static ColorType *_GREEN = nil;
static ColorType *_OLIVE = nil;
static ColorType *_NAVY = nil;
static ColorType *_PURPLE = nil;
static ColorType *_TEAL = nil;
static ColorType *_GRAY = nil;
static ColorType *_SILVER = nil;
static ColorType *_AUTOMATIC = nil;
static NSMutableArray *_TYPE_VALUES = nil;

/**
 * Private constructor.
 * 
 * @param type int version of the enum
 * @param name color name
 * @param color Java color instance
 */

-(id)init:(int)type withName:(NSString *)name withColor:(UIColor *)color 
{
    self = [super init];
    if(self)
    {
        _value = type;
        _name = name;
        _color = color;
    }
    return self;
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(ColorType *)getInstance:(int)type
{
    if(type < 0 || type >= [[ColorType TYPE_VALUES]count])
    {
        type = [[ColorType AUTOMATIC]getValue];
    }
    return [[ColorType TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(ColorType *)getinstanceWithNumber:(NSNumber *)type
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
 * Retrieve the color name. Currently this is not localised.
 *
 * @return color name
 */

-(NSString *)getName
{
    return _name;
}

/**
* Retrieve a Java Color instance matching the color used in MS Project.
* Note that this will return null if the color type is automatic.
*
* @return Color instance
*/

-(UIColor *)getColor
{
    return _color;
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

+(ColorType *)BLACK
{
  if(_BLACK == nil)
  {
      _BLACK = [[ColorType alloc] init:0  withName:@"Black" withColor:[UIColor blackColor]];
  }
  return _BLACK;
}

+(ColorType *)RED
{
  if(_RED == nil)
  {
      _RED = [[ColorType alloc] init:1  withName:@"Red" withColor:[UIColor redColor]];
  }
  return _RED;
}

+(ColorType *)YELLOW
{
  if(_YELLOW == nil)
  {
      _YELLOW = [[ColorType alloc] init:2  withName:@"Yellow" withColor:[UIColor yellowColor]];
  }
  return _YELLOW;
}

+(ColorType *)LIME
{
  if(_LIME == nil)
  {
      _LIME = [[ColorType alloc] init:3  withName:@"Lime" withColor:[[UIColor alloc] initWithRed:148.0 green:255.0 blue:148.0 alpha:1.0]];
  }
  return _LIME;
}

+(ColorType *)AQUA
{
  if(_AQUA == nil)
  {
      _AQUA = [[ColorType alloc] init:4  withName:@"Aqua" withColor:[[UIColor alloc] initWithRed:194.0 green:220.0 blue:255.0 alpha:1.0]];
  }
  return _AQUA;
}

+(ColorType *)BLUE
{
  if(_BLUE == nil)
  {
      _BLUE = [[ColorType alloc] init:5  withName:@"Blue" withColor:[UIColor blueColor]];
  }
  return _BLUE;
}

+(ColorType *)FUSCHIA
{
  if(_FUSCHIA == nil)
  {
      _FUSCHIA = [[ColorType alloc] init:6  withName:@"Fuschia" withColor:[UIColor magentaColor]];
  }
  return _FUSCHIA;
}

+(ColorType *)WHITE
{
  if(_WHITE == nil)
  {
      _WHITE = [[ColorType alloc] init:7  withName:@"White" withColor:[UIColor whiteColor]];
  }
  return _WHITE;
}

+(ColorType *)MAROON
{
  if(_MAROON == nil)
  {
      _MAROON = [[ColorType alloc] init:8  withName:@"Maroon" withColor:[[UIColor alloc] initWithRed:128.0 green:0.0 blue:0.0 alpha:1.0]];
  }
  return _MAROON;
}

+(ColorType *)GREEN
{
  if(_GREEN == nil)
  {
      _GREEN = [[ColorType alloc] init:9  withName:@"Green" withColor:[[UIColor alloc] initWithRed:0.0 green:128.0 blue:0.0 alpha:1.0]];
  }
  return _GREEN;
}

+(ColorType *)OLIVE
{
  if(_OLIVE == nil)
  {
      _OLIVE = [[ColorType alloc] init:10  withName:@"Olive" withColor:[[UIColor alloc] initWithRed:128.0 green:128.0 blue:0.0 alpha:1.0]];
  }
  return _OLIVE;
}

+(ColorType *)NAVY
{
  if(_NAVY == nil)
  {
      _NAVY = [[ColorType alloc] init:11  withName:@"Navy" withColor:[[UIColor alloc] initWithRed:0.0 green:0.0 blue:128.0 alpha:1.0]];
  }
  return _NAVY;
}

+(ColorType *)PURPLE
{
  if(_PURPLE == nil)
  {
      _PURPLE = [[ColorType alloc] init:12  withName:@"Purple" withColor:[[UIColor alloc] initWithRed:128.0 green:0.0 blue:128.0 alpha:1.0]];
  }
  return _PURPLE;
}

+(ColorType *)TEAL
{
  if(_TEAL == nil)
  {
      _TEAL = [[ColorType alloc] init:13  withName:@"Teal" withColor:[[UIColor alloc] initWithRed:0.0 green:128.0 blue:128.0 alpha:1.0]];
  }
  return _TEAL;
}

+(ColorType *)GRAY
{
  if(_GRAY == nil)
  {
      _GRAY = [[ColorType alloc] init:14  withName:@"Gray" withColor:[[UIColor alloc] initWithRed:128.0 green:128.0 blue:128.0 alpha:1.0]];
  }
  return _GRAY;
}

+(ColorType *)SILVER
{
  if(_SILVER == nil)
  {
      _SILVER = [[ColorType alloc] init:15  withName:@"Silver" withColor:[[UIColor alloc] initWithRed:192.0 green:192.0 blue:192.0 alpha:1.0]];
  }
  return _SILVER;
}

+(ColorType *)AUTOMATIC
{
  if(_AUTOMATIC == nil)
  {
      _AUTOMATIC = [[ColorType alloc] init:16  withName:@"Automatic" withColor:nil];
  }
  return _AUTOMATIC;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[ColorType BLACK], [ColorType RED], [ColorType YELLOW], [ColorType LIME], [ColorType AQUA], [ColorType BLUE], [ColorType FUSCHIA], [ColorType WHITE], [ColorType MAROON], [ColorType GREEN], [ColorType OLIVE], [ColorType NAVY], [ColorType PURPLE], [ColorType TEAL], [ColorType GRAY], [ColorType SILVER], [ColorType AUTOMATIC],  nil];
  }
  return _TYPE_VALUES;
}

@end
