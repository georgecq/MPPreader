//
// ProjectDateFormat.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProjectDateFormat.h"
#import "NumberUtility.h"

@implementation ProjectDateFormat

static ProjectDateFormat *_DD_MM_YY_HH_MM = nil;
static ProjectDateFormat *_DD_MM_YY = nil;
static ProjectDateFormat *_DD_MMMMM_YYYY_HH_MM = nil;
static ProjectDateFormat *_DD_MMMMM_YYYY = nil;
static ProjectDateFormat *_DD_MMM_HH_MM = nil;
static ProjectDateFormat *_DD_MMM_YY = nil;
static ProjectDateFormat *_DD_MMMMM = nil;
static ProjectDateFormat *_DD_MMM = nil;
static ProjectDateFormat *_EEE_DD_MM_YY_HH_MM = nil;
static ProjectDateFormat *_EEE_DD_MM_YY = nil;
static ProjectDateFormat *_EEE_DD_MMM_YY = nil;
static ProjectDateFormat *_EEE_HH_MM = nil;
static ProjectDateFormat *_DD_MM = nil;
static ProjectDateFormat *_DD = nil;
static ProjectDateFormat *_HH_MM = nil;
static ProjectDateFormat *_EEE_DD_MMM = nil;
static ProjectDateFormat *_EEE_DD_MM = nil;
static ProjectDateFormat *_EEE_DD = nil;
static ProjectDateFormat *_DD_WWW = nil;
static ProjectDateFormat *_DD_WWW_YY_HH_MM = nil;
static ProjectDateFormat *_DD_MM_YYYY = nil;
static NSMutableArray *_TYPE_VALUES = nil;

/**
 * Private constructor.
 * 
 * @param type int version of the enum
 */

-(id)init:(int)type 
{
    self = [super init];
    if(self)
    {
        _value = type;
    }
    return self;
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(ProjectDateFormat *)getInstance:(int)type
{
    if(type < 0 || type >= [[ProjectDateFormat TYPE_VALUES]count])
    {
        type = [[ProjectDateFormat DD_MM_YYYY]getValue];
    }
    return [[ProjectDateFormat TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(ProjectDateFormat *)getInstanceWithNumber:(NSNumber *)type
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
 * Returns a string representation of the date format type
 * to be used as part of an MPX file.
 *
 * @return string representation
 */

-(NSString *)toString
{
    return [NSString stringWithFormat:@"%d", _value];
}

+(ProjectDateFormat *)DD_MM_YY_HH_MM
{
  if(_DD_MM_YY_HH_MM == nil)
  {
      _DD_MM_YY_HH_MM = [[ProjectDateFormat alloc] init:0];
  }
  return _DD_MM_YY_HH_MM;
}

+(ProjectDateFormat *)DD_MM_YY
{
  if(_DD_MM_YY == nil)
  {
      _DD_MM_YY = [[ProjectDateFormat alloc] init:1];
  }
  return _DD_MM_YY;
}

+(ProjectDateFormat *)DD_MMMMM_YYYY_HH_MM
{
  if(_DD_MMMMM_YYYY_HH_MM == nil)
  {
      _DD_MMMMM_YYYY_HH_MM = [[ProjectDateFormat alloc] init:2];
  }
  return _DD_MMMMM_YYYY_HH_MM;
}

+(ProjectDateFormat *)DD_MMMMM_YYYY
{
  if(_DD_MMMMM_YYYY == nil)
  {
      _DD_MMMMM_YYYY = [[ProjectDateFormat alloc] init:3];
  }
  return _DD_MMMMM_YYYY;
}

+(ProjectDateFormat *)DD_MMM_HH_MM
{
  if(_DD_MMM_HH_MM == nil)
  {
      _DD_MMM_HH_MM = [[ProjectDateFormat alloc] init:4];
  }
  return _DD_MMM_HH_MM;
}

+(ProjectDateFormat *)DD_MMM_YY
{
  if(_DD_MMM_YY == nil)
  {
      _DD_MMM_YY = [[ProjectDateFormat alloc] init:5];
  }
  return _DD_MMM_YY;
}

+(ProjectDateFormat *)DD_MMMMM
{
  if(_DD_MMMMM == nil)
  {
      _DD_MMMMM = [[ProjectDateFormat alloc] init:6];
  }
  return _DD_MMMMM;
}

+(ProjectDateFormat *)DD_MMM
{
  if(_DD_MMM == nil)
  {
      _DD_MMM = [[ProjectDateFormat alloc] init:7];
  }
  return _DD_MMM;
}

+(ProjectDateFormat *)EEE_DD_MM_YY_HH_MM
{
  if(_EEE_DD_MM_YY_HH_MM == nil)
  {
      _EEE_DD_MM_YY_HH_MM = [[ProjectDateFormat alloc] init:8];
  }
  return _EEE_DD_MM_YY_HH_MM;
}

+(ProjectDateFormat *)EEE_DD_MM_YY
{
  if(_EEE_DD_MM_YY == nil)
  {
      _EEE_DD_MM_YY = [[ProjectDateFormat alloc] init:9];
  }
  return _EEE_DD_MM_YY;
}

+(ProjectDateFormat *)EEE_DD_MMM_YY
{
  if(_EEE_DD_MMM_YY == nil)
  {
      _EEE_DD_MMM_YY = [[ProjectDateFormat alloc] init:10];
  }
  return _EEE_DD_MMM_YY;
}

+(ProjectDateFormat *)EEE_HH_MM
{
  if(_EEE_HH_MM == nil)
  {
      _EEE_HH_MM = [[ProjectDateFormat alloc] init:11];
  }
  return _EEE_HH_MM;
}

+(ProjectDateFormat *)DD_MM
{
  if(_DD_MM == nil)
  {
      _DD_MM = [[ProjectDateFormat alloc] init:12];
  }
  return _DD_MM;
}

+(ProjectDateFormat *)DD
{
  if(_DD == nil)
  {
      _DD = [[ProjectDateFormat alloc] init:13];
  }
  return _DD;
}

+(ProjectDateFormat *)HH_MM
{
  if(_HH_MM == nil)
  {
      _HH_MM = [[ProjectDateFormat alloc] init:14];
  }
  return _HH_MM;
}

+(ProjectDateFormat *)EEE_DD_MMM
{
  if(_EEE_DD_MMM == nil)
  {
      _EEE_DD_MMM = [[ProjectDateFormat alloc] init:15];
  }
  return _EEE_DD_MMM;
}

+(ProjectDateFormat *)EEE_DD_MM
{
  if(_EEE_DD_MM == nil)
  {
      _EEE_DD_MM = [[ProjectDateFormat alloc] init:16];
  }
  return _EEE_DD_MM;
}

+(ProjectDateFormat *)EEE_DD
{
  if(_EEE_DD == nil)
  {
      _EEE_DD = [[ProjectDateFormat alloc] init:17];
  }
  return _EEE_DD;
}

+(ProjectDateFormat *)DD_WWW
{
  if(_DD_WWW == nil)
  {
      _DD_WWW = [[ProjectDateFormat alloc] init:18];
  }
  return _DD_WWW;
}

+(ProjectDateFormat *)DD_WWW_YY_HH_MM
{
  if(_DD_WWW_YY_HH_MM == nil)
  {
      _DD_WWW_YY_HH_MM = [[ProjectDateFormat alloc] init:19];
  }
  return _DD_WWW_YY_HH_MM;
}

+(ProjectDateFormat *)DD_MM_YYYY
{
  if(_DD_MM_YYYY == nil)
  {
      _DD_MM_YYYY = [[ProjectDateFormat alloc] init:20];
  }
  return _DD_MM_YYYY;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[ProjectDateFormat DD_MM_YY_HH_MM], [ProjectDateFormat DD_MM_YY], [ProjectDateFormat DD_MMMMM_YYYY_HH_MM], [ProjectDateFormat DD_MMMMM_YYYY], [ProjectDateFormat DD_MMM_HH_MM], [ProjectDateFormat DD_MMM_YY], [ProjectDateFormat DD_MMMMM], [ProjectDateFormat DD_MMM], [ProjectDateFormat EEE_DD_MM_YY_HH_MM], [ProjectDateFormat EEE_DD_MM_YY], [ProjectDateFormat EEE_DD_MMM_YY], [ProjectDateFormat EEE_HH_MM], [ProjectDateFormat DD_MM], [ProjectDateFormat DD], [ProjectDateFormat HH_MM], [ProjectDateFormat EEE_DD_MMM], [ProjectDateFormat EEE_DD_MM], [ProjectDateFormat EEE_DD], [ProjectDateFormat DD_WWW], [ProjectDateFormat DD_WWW_YY_HH_MM], [ProjectDateFormat DD_MM_YYYY],  nil];
  }
  return _TYPE_VALUES;
}

@end
