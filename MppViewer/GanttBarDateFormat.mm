//
// GanttBarDateFormat.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GanttBarDateFormat.h"
#import "NumberUtility.h"

@implementation GanttBarDateFormat

static GanttBarDateFormat *_DEFAULT = nil;
static GanttBarDateFormat *_DDMMYY_MMSS = nil;
static GanttBarDateFormat *_DDMMYY = nil;
static GanttBarDateFormat *_DDMMYYYY = nil;
static GanttBarDateFormat *_DD_MMMM_YYYY_HHMM = nil;
static GanttBarDateFormat *_DD_MMMM_YYYY = nil;
static GanttBarDateFormat *_DD_MMM_HHMM = nil;
static GanttBarDateFormat *_DD_MMM_YY = nil;
static GanttBarDateFormat *_DD_MMMM = nil;
static GanttBarDateFormat *_DD_MMM = nil;
static GanttBarDateFormat *_DDD_DDMMYY_HHMM = nil;
static GanttBarDateFormat *_DDD_DDMMYY = nil;
static GanttBarDateFormat *_DDD_DD_MMM_YY = nil;
static GanttBarDateFormat *_DDD_HHMM = nil;
static GanttBarDateFormat *_DDD_DD_MMM = nil;
static GanttBarDateFormat *_DDD_DDMM = nil;
static GanttBarDateFormat *_DDD_DD = nil;
static GanttBarDateFormat *_DDMM = nil;
static GanttBarDateFormat *_DD = nil;
static GanttBarDateFormat *_HHMM = nil;
static GanttBarDateFormat *_MWW = nil;
static GanttBarDateFormat *_MWWYY_HHMM = nil;
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

+(GanttBarDateFormat *)getInstance:(int)type
{
    if(type < 0 || type >= [[GanttBarDateFormat TYPE_VALUES]count])
    {
        type = [[GanttBarDateFormat DEFAULT]getValue];
    }
    return [[GanttBarDateFormat TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(GanttBarDateFormat *)getInstanceWithNumber:(NSNumber *)type
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

+(GanttBarDateFormat *)DEFAULT
{
  if(_DEFAULT == nil)
  {
      _DEFAULT = [[GanttBarDateFormat alloc] init:0  withName:@"Default"];
  }
  return _DEFAULT;
}

+(GanttBarDateFormat *)DDMMYY_MMSS
{
  if(_DDMMYY_MMSS == nil)
  {
      _DDMMYY_MMSS = [[GanttBarDateFormat alloc] init:1  withName:@"28/01/02 12:33"];
  }
  return _DDMMYY_MMSS;
}

+(GanttBarDateFormat *)DDMMYY
{
  if(_DDMMYY == nil)
  {
      _DDMMYY = [[GanttBarDateFormat alloc] init:2  withName:@"28/01/02"];
  }
  return _DDMMYY;
}

+(GanttBarDateFormat *)DDMMYYYY
{
  if(_DDMMYYYY == nil)
  {
      _DDMMYYYY = [[GanttBarDateFormat alloc] init:21  withName:@"28/01/2002"];
  }
  return _DDMMYYYY;
}

+(GanttBarDateFormat *)DD_MMMM_YYYY_HHMM
{
  if(_DD_MMMM_YYYY_HHMM == nil)
  {
      _DD_MMMM_YYYY_HHMM = [[GanttBarDateFormat alloc] init:3  withName:@"28 January 2002 12:33"];
  }
  return _DD_MMMM_YYYY_HHMM;
}

+(GanttBarDateFormat *)DD_MMMM_YYYY
{
  if(_DD_MMMM_YYYY == nil)
  {
      _DD_MMMM_YYYY = [[GanttBarDateFormat alloc] init:4  withName:@"28 January 2002"];
  }
  return _DD_MMMM_YYYY;
}

+(GanttBarDateFormat *)DD_MMM_HHMM
{
  if(_DD_MMM_HHMM == nil)
  {
      _DD_MMM_HHMM = [[GanttBarDateFormat alloc] init:5  withName:@"28 Jan 12:33"];
  }
  return _DD_MMM_HHMM;
}

+(GanttBarDateFormat *)DD_MMM_YY
{
  if(_DD_MMM_YY == nil)
  {
      _DD_MMM_YY = [[GanttBarDateFormat alloc] init:6  withName:@"28 Jan '02"];
  }
  return _DD_MMM_YY;
}

+(GanttBarDateFormat *)DD_MMMM
{
  if(_DD_MMMM == nil)
  {
      _DD_MMMM = [[GanttBarDateFormat alloc] init:7  withName:@"28 January"];
  }
  return _DD_MMMM;
}

+(GanttBarDateFormat *)DD_MMM
{
  if(_DD_MMM == nil)
  {
      _DD_MMM = [[GanttBarDateFormat alloc] init:8  withName:@"28 Jan"];
  }
  return _DD_MMM;
}

+(GanttBarDateFormat *)DDD_DDMMYY_HHMM
{
  if(_DDD_DDMMYY_HHMM == nil)
  {
      _DDD_DDMMYY_HHMM = [[GanttBarDateFormat alloc] init:9  withName:@"Mon 28/01/02 12:33"];
  }
  return _DDD_DDMMYY_HHMM;
}

+(GanttBarDateFormat *)DDD_DDMMYY
{
  if(_DDD_DDMMYY == nil)
  {
      _DDD_DDMMYY = [[GanttBarDateFormat alloc] init:10  withName:@"Mon 28/01/02"];
  }
  return _DDD_DDMMYY;
}

+(GanttBarDateFormat *)DDD_DD_MMM_YY
{
  if(_DDD_DD_MMM_YY == nil)
  {
      _DDD_DD_MMM_YY = [[GanttBarDateFormat alloc] init:11  withName:@"Mon 28 Jan '02"];
  }
  return _DDD_DD_MMM_YY;
}

+(GanttBarDateFormat *)DDD_HHMM
{
  if(_DDD_HHMM == nil)
  {
      _DDD_HHMM = [[GanttBarDateFormat alloc] init:12  withName:@"Mon 12:33"];
  }
  return _DDD_HHMM;
}

+(GanttBarDateFormat *)DDD_DD_MMM
{
  if(_DDD_DD_MMM == nil)
  {
      _DDD_DD_MMM = [[GanttBarDateFormat alloc] init:16  withName:@"Mon 28 Jan"];
  }
  return _DDD_DD_MMM;
}

+(GanttBarDateFormat *)DDD_DDMM
{
  if(_DDD_DDMM == nil)
  {
      _DDD_DDMM = [[GanttBarDateFormat alloc] init:17  withName:@"Mon 28/01"];
  }
  return _DDD_DDMM;
}

+(GanttBarDateFormat *)DDD_DD
{
  if(_DDD_DD == nil)
  {
      _DDD_DD = [[GanttBarDateFormat alloc] init:18  withName:@"Mon 28"];
  }
  return _DDD_DD;
}

+(GanttBarDateFormat *)DDMM
{
  if(_DDMM == nil)
  {
      _DDMM = [[GanttBarDateFormat alloc] init:13  withName:@"28/01"];
  }
  return _DDMM;
}

+(GanttBarDateFormat *)DD
{
  if(_DD == nil)
  {
      _DD = [[GanttBarDateFormat alloc] init:14  withName:@"28"];
  }
  return _DD;
}

+(GanttBarDateFormat *)HHMM
{
  if(_HHMM == nil)
  {
      _HHMM = [[GanttBarDateFormat alloc] init:15  withName:@"12:33"];
  }
  return _HHMM;
}

+(GanttBarDateFormat *)MWW
{
  if(_MWW == nil)
  {
      _MWW = [[GanttBarDateFormat alloc] init:19  withName:@"1/W05"];
  }
  return _MWW;
}

+(GanttBarDateFormat *)MWWYY_HHMM
{
  if(_MWWYY_HHMM == nil)
  {
      _MWWYY_HHMM = [[GanttBarDateFormat alloc] init:20  withName:@"1/W05/02 12:33"];
  }
  return _MWWYY_HHMM;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[GanttBarDateFormat DEFAULT], [GanttBarDateFormat DDMMYY_MMSS], [GanttBarDateFormat DDMMYY], [GanttBarDateFormat DDMMYYYY], [GanttBarDateFormat DD_MMMM_YYYY_HHMM], [GanttBarDateFormat DD_MMMM_YYYY], [GanttBarDateFormat DD_MMM_HHMM], [GanttBarDateFormat DD_MMM_YY], [GanttBarDateFormat DD_MMMM], [GanttBarDateFormat DD_MMM], [GanttBarDateFormat DDD_DDMMYY_HHMM], [GanttBarDateFormat DDD_DDMMYY], [GanttBarDateFormat DDD_DD_MMM_YY], [GanttBarDateFormat DDD_HHMM], [GanttBarDateFormat DDD_DD_MMM], [GanttBarDateFormat DDD_DDMM], [GanttBarDateFormat DDD_DD], [GanttBarDateFormat DDMM], [GanttBarDateFormat DD], [GanttBarDateFormat HHMM], [GanttBarDateFormat MWW], [GanttBarDateFormat MWWYY_HHMM],  nil];
  }
  return _TYPE_VALUES;
}

@end
