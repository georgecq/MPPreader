//
// CurrencySymbolPosition.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CurrencySymbolPosition.h"

@implementation CurrencySymbolPosition

static CurrencySymbolPosition *_AFTER = nil;
static CurrencySymbolPosition *_BEFORE = nil;
static CurrencySymbolPosition *_AFTER_WITH_SPACE = nil;
static CurrencySymbolPosition *_BEFORE_WITH_SPACE = nil;
static NSMutableArray *_TYPE_VALUES = nil;

/**
 * Private constructor.
 *
 * @param value currency symbol position value
 */

-(id)init:(int)value
{
    self = [super init];
    if(self)
    {
        _value = value;
    }
    return self;
}

/**
 * Retrieves the int representation of the currency symbol position value.
 *
 * @return currency symbol position value
 */

-(int)getValue
{
    return _value;
}

/**
 * Retrieve a CurrencySymbolPosition instance representing the supplied value.
 *
 * @param value currency symbol position value
 * @return CurrencySymbolPosition instance
 */

+(CurrencySymbolPosition *)getInstance:(int)value
{
    if(value < 0 || value >= [[CurrencySymbolPosition TYPE_VALUES]count])
    {
        value = [[CurrencySymbolPosition BEFORE]getValue];
    }
    return [[CurrencySymbolPosition TYPE_VALUES]objectAtIndex:value];
}

/**
 * Returns a string representation of the currency symbol position type
 * to be used as part of an MPX file.
 *
 * @return string representation
 */

-(NSString *)toString
{
    return [NSString stringWithFormat:@"%d", _value];
}

+(CurrencySymbolPosition *)AFTER
{
  if(_AFTER == nil)
  {
      _AFTER = [[CurrencySymbolPosition alloc] init:0];
  }
  return _AFTER;
}

+(CurrencySymbolPosition *)BEFORE
{
  if(_BEFORE == nil)
  {
      _BEFORE = [[CurrencySymbolPosition alloc] init:1];
  }
  return _BEFORE;
}

+(CurrencySymbolPosition *)AFTER_WITH_SPACE
{
  if(_AFTER_WITH_SPACE == nil)
  {
      _AFTER_WITH_SPACE = [[CurrencySymbolPosition alloc] init:2];
  }
  return _AFTER_WITH_SPACE;
}

+(CurrencySymbolPosition *)BEFORE_WITH_SPACE
{
  if(_BEFORE_WITH_SPACE == nil)
  {
      _BEFORE_WITH_SPACE = [[CurrencySymbolPosition alloc] init:3];
  }
  return _BEFORE_WITH_SPACE;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[CurrencySymbolPosition AFTER], [CurrencySymbolPosition BEFORE], [CurrencySymbolPosition AFTER_WITH_SPACE], [CurrencySymbolPosition BEFORE_WITH_SPACE],  nil];
  }
  return _TYPE_VALUES;
}

@end
