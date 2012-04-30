//
// TimescaleFormat.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimescaleFormat.h"
#import "NumberUtility.h"
#import "EnumUtility.h"

@implementation TimescaleFormat

static TimescaleFormat *_NONE = nil;
static TimescaleFormat *_YEAR_YYYY = nil;
static TimescaleFormat *_YEAR_XYY = nil;
static TimescaleFormat *_YEAR_YY = nil;
static TimescaleFormat *_YEAR_YEAR_START = nil;
static TimescaleFormat *_YEAR_Y_START = nil;
static TimescaleFormat *_YEAR_1_START = nil;
static TimescaleFormat *_YEAR_YEAR_END = nil;
static TimescaleFormat *_YEAR_Y_END = nil;
static TimescaleFormat *_YEAR_1_END = nil;
static TimescaleFormat *_HALFYEAR_1_HALF = nil;
static TimescaleFormat *_HALFYEAR_HALF_1_YYYY = nil;
static TimescaleFormat *_HALFYEAR_HALF_1 = nil;
static TimescaleFormat *_HALFYEAR_H1_XYY = nil;
static TimescaleFormat *_HALFYEAR_H1 = nil;
static TimescaleFormat *_HALFYEAR_1 = nil;
static TimescaleFormat *_HALFYEAR_1HYY = nil;
static TimescaleFormat *_HALFYEAR_HALF_1_START = nil;
static TimescaleFormat *_HALFYEAR_H1_START = nil;
static TimescaleFormat *_HALFYEAR_1_START = nil;
static TimescaleFormat *_HALFYEAR_HALF_1_END = nil;
static TimescaleFormat *_HALFYEAR_H1_END = nil;
static TimescaleFormat *_HALFYEAR_1_END = nil;
static TimescaleFormat *_QUARTER_1_QUARTER = nil;
static TimescaleFormat *_QUARTER_QTR_1_YYYY = nil;
static TimescaleFormat *_QUARTER_QTR_1 = nil;
static TimescaleFormat *_QUARTER_Q1_XYY = nil;
static TimescaleFormat *_QUARTER_Q1 = nil;
static TimescaleFormat *_QUARTER_1 = nil;
static TimescaleFormat *_QUARTER_1QYY = nil;
static TimescaleFormat *_QUARTER_QUARTER_1_START = nil;
static TimescaleFormat *_QUARTER_Q1_START = nil;
static TimescaleFormat *_QUARTER_1_START = nil;
static TimescaleFormat *_QUARTER_QUARTER_1_END = nil;
static TimescaleFormat *_QUARTER_Q1_END = nil;
static TimescaleFormat *_QUARTER_1_END = nil;
static TimescaleFormat *_MONTHS_MMMM_YYYY = nil;
static TimescaleFormat *_MONTHS_MMM_XYY = nil;
static TimescaleFormat *_MONTHS_MMMM = nil;
static TimescaleFormat *_MONTHS_MMM = nil;
static TimescaleFormat *_MONTHS_M = nil;
static TimescaleFormat *_MONTHS_1 = nil;
static TimescaleFormat *_MONTHS_1_XYY = nil;
static TimescaleFormat *_MONTHS_1SYY = nil;
static TimescaleFormat *_MONTHS_MONTH_1_START = nil;
static TimescaleFormat *_MONTHS_M1_START = nil;
static TimescaleFormat *_MONTHS_1_START = nil;
static TimescaleFormat *_MONTHS_MONTH_1_END = nil;
static TimescaleFormat *_MONTHS_M1_END = nil;
static TimescaleFormat *_MONTHS_1_END = nil;
static TimescaleFormat *_TRIMONTHS_1 = nil;
static TimescaleFormat *_TRIMONTHS_B = nil;
static TimescaleFormat *_TRIMONTHS_BEGINNING = nil;
static TimescaleFormat *_TRIMONTHS_MS1 = nil;
static TimescaleFormat *_TRIMONTHS_MSB = nil;
static TimescaleFormat *_TRIMONTHS_MMMM_BEGINNING = nil;
static TimescaleFormat *_TRIMONTHS_MMM_1 = nil;
static TimescaleFormat *_TRIMONTHS_MMM_B = nil;
static TimescaleFormat *_TRIMONTHS_MMMM_1 = nil;
static TimescaleFormat *_TRIMONTHS_MS1SYY = nil;
static TimescaleFormat *_TRIMONTHS_MSBSYY = nil;
static TimescaleFormat *_TRIMONTHS_MMM_1_X02 = nil;
static TimescaleFormat *_TRIMONTHS_MMM_B_X02 = nil;
static TimescaleFormat *_TRIMONTHS_MMMM_1_YYYY = nil;
static TimescaleFormat *_TRIMONTHS_MMMM_BEGINNING_YYYY = nil;
static TimescaleFormat *_WEEKS_MMMM_DD_YYYY = nil;
static TimescaleFormat *_WEEKS_MMM_DD_XYY = nil;
static TimescaleFormat *_WEEKS_MMMM_DD = nil;
static TimescaleFormat *_WEEKS_MMM_DD = nil;
static TimescaleFormat *_WEEKS_MDD = nil;
static TimescaleFormat *_WEEKS_MSDDSYY = nil;
static TimescaleFormat *_WEEKS_MSDD = nil;
static TimescaleFormat *_WEEKS_DD = nil;
static TimescaleFormat *_WEEKS_DDD_DD = nil;
static TimescaleFormat *_WEEKS_DDD_MSDDSYY = nil;
static TimescaleFormat *_WEEKS_DDD_MMMM_DD_XYY = nil;
static TimescaleFormat *_WEEKS_DDD_MMM_DD_XYY = nil;
static TimescaleFormat *_WEEKS_DDD_MMMM_DD = nil;
static TimescaleFormat *_WEEKS_DDD_MMM_DD = nil;
static TimescaleFormat *_WEEKS_MMM_W = nil;
static TimescaleFormat *_WEEKS_D_MMM_DD = nil;
static TimescaleFormat *_WEEKS_DDD_M_DD = nil;
static TimescaleFormat *_WEEKS_DD_M_DD = nil;
static TimescaleFormat *_WEEKS_D_M_DD = nil;
static TimescaleFormat *_WEEKS_DDD_MSDD = nil;
static TimescaleFormat *_WEEKS_DD_MSDD = nil;
static TimescaleFormat *_WEEKS_D_MSDD = nil;
static TimescaleFormat *_WEEKS_W = nil;
static TimescaleFormat *_WEEKS_DDD_W = nil;
static TimescaleFormat *_WEEKS_D_W = nil;
static TimescaleFormat *_WEEKS_WEEK_1_START = nil;
static TimescaleFormat *_WEEKS_W1_START = nil;
static TimescaleFormat *_WEEKS_1_START = nil;
static TimescaleFormat *_WEEKS_WEEK_1_END = nil;
static TimescaleFormat *_WEEKS_W1_END = nil;
static TimescaleFormat *_WEEKS_1_END = nil;
static TimescaleFormat *_DAYS_DDD_MMM_DD_XYY = nil;
static TimescaleFormat *_DAYS_DDD_MMMM_DD = nil;
static TimescaleFormat *_DAYS_DDD_MMM_DD = nil;
static TimescaleFormat *_DAYS_DDD_M_DD = nil;
static TimescaleFormat *_DAYS_DD_M_DD = nil;
static TimescaleFormat *_DAYS_D_M_DD = nil;
static TimescaleFormat *_DAYS_DDD_MSDD = nil;
static TimescaleFormat *_DAYS_DD_MSDD = nil;
static TimescaleFormat *_DAYS_D_MSDD = nil;
static TimescaleFormat *_DAYS_DDD_DD = nil;
static TimescaleFormat *_DAYS_DD_DD = nil;
static TimescaleFormat *_DAYS_D_DD = nil;
static TimescaleFormat *_DAYS_DXDD = nil;
static TimescaleFormat *_DAYS_DD_MMM = nil;
static TimescaleFormat *_DAYS_DDD_DD_XYY = nil;
static TimescaleFormat *_DAYS_M_DD = nil;
static TimescaleFormat *_DAYS_DDDD = nil;
static TimescaleFormat *_DAYS_DDD = nil;
static TimescaleFormat *_DAYS_DD = nil;
static TimescaleFormat *_DAYS_D = nil;
static TimescaleFormat *_DAYS_MSDDSYY = nil;
static TimescaleFormat *_DAYS_DDD_MSDDSYY = nil;
static TimescaleFormat *_DAYS_MSDD = nil;
static TimescaleFormat *_DAYS_1 = nil;
static TimescaleFormat *_DAYS_128_YYYY = nil;
static TimescaleFormat *_DAYS_128_XYY = nil;
static TimescaleFormat *_DAYS_128 = nil;
static TimescaleFormat *_DAYS_DAY_1_START = nil;
static TimescaleFormat *_DAYS_D1_START = nil;
static TimescaleFormat *_DAYS_1_START = nil;
static TimescaleFormat *_DAYS_DAY_1_END = nil;
static TimescaleFormat *_DAYS_D1_END = nil;
static TimescaleFormat *_DAYS_1_END = nil;
static TimescaleFormat *_HOURS_DDD_MMM_DD_HH_AM = nil;
static TimescaleFormat *_HOURS_MMM_DD_HH_AM = nil;
static TimescaleFormat *_HOURS_MSDD_HH_AM = nil;
static TimescaleFormat *_HOURS_HHMM_AM = nil;
static TimescaleFormat *_HOURS_HH_AM = nil;
static TimescaleFormat *_HOURS_HH = nil;
static TimescaleFormat *_HOURS_HOUR_1_START = nil;
static TimescaleFormat *_HOURS_H1_START = nil;
static TimescaleFormat *_HOURS_1_START = nil;
static TimescaleFormat *_HOURS_HOUR_1_END = nil;
static TimescaleFormat *_HOURS_H1_END = nil;
static TimescaleFormat *_HOURS_1_END = nil;
static TimescaleFormat *_MINUTES_HHMM_AM = nil;
static TimescaleFormat *_MINUTES_MM = nil;
static TimescaleFormat *_MINUTES_MINUTE_1_START = nil;
static TimescaleFormat *_MINUTES_M1_START = nil;
static TimescaleFormat *_MINUTES_1_START = nil;
static TimescaleFormat *_MINUTES_MINUTE_1_END = nil;
static TimescaleFormat *_MINUTES_M1_END = nil;
static TimescaleFormat *_MINUTES_1_END = nil;
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

+(TimescaleFormat *)getInstance:(int)type
{
    if(type < 0 || type >= [[TimescaleFormat TYPE_VALUES]count])
    {
        type = [[TimescaleFormat NONE]getValue];
    }
    return [[TimescaleFormat TYPE_VALUES]objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(TimescaleFormat *)getInstanceWithNumber:(NSNumber *)type
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

+(TimescaleFormat *)NONE
{
  if(_NONE == nil)
  {
      _NONE = [[TimescaleFormat alloc] init:35  withName:@"None"];
  }
  return _NONE;
}

+(TimescaleFormat *)YEAR_YYYY
{
  if(_YEAR_YYYY == nil)
  {
      _YEAR_YYYY = [[TimescaleFormat alloc] init:0  withName:@"2002, 2003, ..."];
  }
  return _YEAR_YYYY;
}

+(TimescaleFormat *)YEAR_XYY
{
  if(_YEAR_XYY == nil)
  {
      _YEAR_XYY = [[TimescaleFormat alloc] init:1  withName:@"'02, '03, ..."];
  }
  return _YEAR_XYY;
}

+(TimescaleFormat *)YEAR_YY
{
  if(_YEAR_YY == nil)
  {
      _YEAR_YY = [[TimescaleFormat alloc] init:78  withName:@"02, 03, ..."];
  }
  return _YEAR_YY;
}

+(TimescaleFormat *)YEAR_YEAR_START
{
  if(_YEAR_YEAR_START == nil)
  {
      _YEAR_YEAR_START = [[TimescaleFormat alloc] init:48  withName:@"Year 1, Year 2 ... (From Start)"];
  }
  return _YEAR_YEAR_START;
}

+(TimescaleFormat *)YEAR_Y_START
{
  if(_YEAR_Y_START == nil)
  {
      _YEAR_Y_START = [[TimescaleFormat alloc] init:73  withName:@"Y1, Y2, Y3, ... (From Start)"];
  }
  return _YEAR_Y_START;
}

+(TimescaleFormat *)YEAR_1_START
{
  if(_YEAR_1_START == nil)
  {
      _YEAR_1_START = [[TimescaleFormat alloc] init:74  withName:@"1, 2, 3, 4, ...(From Start)"];
  }
  return _YEAR_1_START;
}

+(TimescaleFormat *)YEAR_YEAR_END
{
  if(_YEAR_YEAR_END == nil)
  {
      _YEAR_YEAR_END = [[TimescaleFormat alloc] init:49  withName:@"Year 2, Year 1 ... (From End)"];
  }
  return _YEAR_YEAR_END;
}

+(TimescaleFormat *)YEAR_Y_END
{
  if(_YEAR_Y_END == nil)
  {
      _YEAR_Y_END = [[TimescaleFormat alloc] init:71  withName:@"Y3, Y2, Y1, ... (From End)"];
  }
  return _YEAR_Y_END;
}

+(TimescaleFormat *)YEAR_1_END
{
  if(_YEAR_1_END == nil)
  {
      _YEAR_1_END = [[TimescaleFormat alloc] init:72  withName:@"4, 3, 2, 1, ... (From End)"];
  }
  return _YEAR_1_END;
}

+(TimescaleFormat *)HALFYEAR_1_HALF
{
  if(_HALFYEAR_1_HALF == nil)
  {
      _HALFYEAR_1_HALF = [[TimescaleFormat alloc] init:123  withName:@"1st Half, 2nd Half, ..."];
  }
  return _HALFYEAR_1_HALF;
}

+(TimescaleFormat *)HALFYEAR_HALF_1_YYYY
{
  if(_HALFYEAR_HALF_1_YYYY == nil)
  {
      _HALFYEAR_HALF_1_YYYY = [[TimescaleFormat alloc] init:124  withName:@"Half 1, 2002, Half2, 2002, ..."];
  }
  return _HALFYEAR_HALF_1_YYYY;
}

+(TimescaleFormat *)HALFYEAR_HALF_1
{
  if(_HALFYEAR_HALF_1 == nil)
  {
      _HALFYEAR_HALF_1 = [[TimescaleFormat alloc] init:125  withName:@"Half 1, Half2, ..."];
  }
  return _HALFYEAR_HALF_1;
}

+(TimescaleFormat *)HALFYEAR_H1_XYY
{
  if(_HALFYEAR_H1_XYY == nil)
  {
      _HALFYEAR_H1_XYY = [[TimescaleFormat alloc] init:126  withName:@"H1 '02, H2 '02, ..."];
  }
  return _HALFYEAR_H1_XYY;
}

+(TimescaleFormat *)HALFYEAR_H1
{
  if(_HALFYEAR_H1 == nil)
  {
      _HALFYEAR_H1 = [[TimescaleFormat alloc] init:127  withName:@"H1, H2, ..."];
  }
  return _HALFYEAR_H1;
}

+(TimescaleFormat *)HALFYEAR_1
{
  if(_HALFYEAR_1 == nil)
  {
      _HALFYEAR_1 = [[TimescaleFormat alloc] init:128  withName:@"1, 2, ..."];
  }
  return _HALFYEAR_1;
}

+(TimescaleFormat *)HALFYEAR_1HYY
{
  if(_HALFYEAR_1HYY == nil)
  {
      _HALFYEAR_1HYY = [[TimescaleFormat alloc] init:129  withName:@"1H02, 2H02, ..."];
  }
  return _HALFYEAR_1HYY;
}

+(TimescaleFormat *)HALFYEAR_HALF_1_START
{
  if(_HALFYEAR_HALF_1_START == nil)
  {
      _HALFYEAR_HALF_1_START = [[TimescaleFormat alloc] init:130  withName:@"Half 1, Half 2, Half 3, ... (From Start)"];
  }
  return _HALFYEAR_HALF_1_START;
}

+(TimescaleFormat *)HALFYEAR_H1_START
{
  if(_HALFYEAR_H1_START == nil)
  {
      _HALFYEAR_H1_START = [[TimescaleFormat alloc] init:131  withName:@"H1, H2, H3, ... (From Start)"];
  }
  return _HALFYEAR_H1_START;
}

+(TimescaleFormat *)HALFYEAR_1_START
{
  if(_HALFYEAR_1_START == nil)
  {
      _HALFYEAR_1_START = [[TimescaleFormat alloc] init:132  withName:@"1, 2, 3, ... (From Start)"];
  }
  return _HALFYEAR_1_START;
}

+(TimescaleFormat *)HALFYEAR_HALF_1_END
{
  if(_HALFYEAR_HALF_1_END == nil)
  {
      _HALFYEAR_HALF_1_END = [[TimescaleFormat alloc] init:133  withName:@"Half 3, Half 2, Half 1, ... (From End)"];
  }
  return _HALFYEAR_HALF_1_END;
}

+(TimescaleFormat *)HALFYEAR_H1_END
{
  if(_HALFYEAR_H1_END == nil)
  {
      _HALFYEAR_H1_END = [[TimescaleFormat alloc] init:134  withName:@"H3, H2, H1, ... (From End)"];
  }
  return _HALFYEAR_H1_END;
}

+(TimescaleFormat *)HALFYEAR_1_END
{
  if(_HALFYEAR_1_END == nil)
  {
      _HALFYEAR_1_END = [[TimescaleFormat alloc] init:135  withName:@"3, 2, 1, ... (From End)"];
  }
  return _HALFYEAR_1_END;
}

+(TimescaleFormat *)QUARTER_1_QUARTER
{
  if(_QUARTER_1_QUARTER == nil)
  {
      _QUARTER_1_QUARTER = [[TimescaleFormat alloc] init:2  withName:@"1st Quarter"];
  }
  return _QUARTER_1_QUARTER;
}

+(TimescaleFormat *)QUARTER_QTR_1_YYYY
{
  if(_QUARTER_QTR_1_YYYY == nil)
  {
      _QUARTER_QTR_1_YYYY = [[TimescaleFormat alloc] init:3  withName:@"Qtr 1, 2002"];
  }
  return _QUARTER_QTR_1_YYYY;
}

+(TimescaleFormat *)QUARTER_QTR_1
{
  if(_QUARTER_QTR_1 == nil)
  {
      _QUARTER_QTR_1 = [[TimescaleFormat alloc] init:5  withName:@"Qtr 1, Qtr2, ..."];
  }
  return _QUARTER_QTR_1;
}

+(TimescaleFormat *)QUARTER_Q1_XYY
{
  if(_QUARTER_Q1_XYY == nil)
  {
      _QUARTER_Q1_XYY = [[TimescaleFormat alloc] init:4  withName:@"Q1 '02, Q2 '02, ..."];
  }
  return _QUARTER_Q1_XYY;
}

+(TimescaleFormat *)QUARTER_Q1
{
  if(_QUARTER_Q1 == nil)
  {
      _QUARTER_Q1 = [[TimescaleFormat alloc] init:6  withName:@"Q1, Q2, ..."];
  }
  return _QUARTER_Q1;
}

+(TimescaleFormat *)QUARTER_1
{
  if(_QUARTER_1 == nil)
  {
      _QUARTER_1 = [[TimescaleFormat alloc] init:62  withName:@"1, 2, ..."];
  }
  return _QUARTER_1;
}

+(TimescaleFormat *)QUARTER_1QYY
{
  if(_QUARTER_1QYY == nil)
  {
      _QUARTER_1QYY = [[TimescaleFormat alloc] init:51  withName:@"1Q02, 2Q02, ..."];
  }
  return _QUARTER_1QYY;
}

+(TimescaleFormat *)QUARTER_QUARTER_1_START
{
  if(_QUARTER_QUARTER_1_START == nil)
  {
      _QUARTER_QUARTER_1_START = [[TimescaleFormat alloc] init:46  withName:@"Quarter 1, Quarter 2, ...(From Start)"];
  }
  return _QUARTER_QUARTER_1_START;
}

+(TimescaleFormat *)QUARTER_Q1_START
{
  if(_QUARTER_Q1_START == nil)
  {
      _QUARTER_Q1_START = [[TimescaleFormat alloc] init:65  withName:@"Q1, Q2, Q3, Q4, ... (From Start)"];
  }
  return _QUARTER_Q1_START;
}

+(TimescaleFormat *)QUARTER_1_START
{
  if(_QUARTER_1_START == nil)
  {
      _QUARTER_1_START = [[TimescaleFormat alloc] init:66  withName:@"1, 2, 3, 4, ... (From Start)"];
  }
  return _QUARTER_1_START;
}

+(TimescaleFormat *)QUARTER_QUARTER_1_END
{
  if(_QUARTER_QUARTER_1_END == nil)
  {
      _QUARTER_QUARTER_1_END = [[TimescaleFormat alloc] init:47  withName:@"Quarter 2 Quarter 1, ... (From End)"];
  }
  return _QUARTER_QUARTER_1_END;
}

+(TimescaleFormat *)QUARTER_Q1_END
{
  if(_QUARTER_Q1_END == nil)
  {
      _QUARTER_Q1_END = [[TimescaleFormat alloc] init:63  withName:@"Q4, Q3, Q2, Q1, ... (From End)"];
  }
  return _QUARTER_Q1_END;
}

+(TimescaleFormat *)QUARTER_1_END
{
  if(_QUARTER_1_END == nil)
  {
      _QUARTER_1_END = [[TimescaleFormat alloc] init:64  withName:@"4, 3, 2, 1, (From End)"];
  }
  return _QUARTER_1_END;
}

+(TimescaleFormat *)MONTHS_MMMM_YYYY
{
  if(_MONTHS_MMMM_YYYY == nil)
  {
      _MONTHS_MMMM_YYYY = [[TimescaleFormat alloc] init:7  withName:@"January 2002"];
  }
  return _MONTHS_MMMM_YYYY;
}

+(TimescaleFormat *)MONTHS_MMM_XYY
{
  if(_MONTHS_MMM_XYY == nil)
  {
      _MONTHS_MMM_XYY = [[TimescaleFormat alloc] init:8  withName:@"Jan '02"];
  }
  return _MONTHS_MMM_XYY;
}

+(TimescaleFormat *)MONTHS_MMMM
{
  if(_MONTHS_MMMM == nil)
  {
      _MONTHS_MMMM = [[TimescaleFormat alloc] init:9  withName:@"January"];
  }
  return _MONTHS_MMMM;
}

+(TimescaleFormat *)MONTHS_MMM
{
  if(_MONTHS_MMM == nil)
  {
      _MONTHS_MMM = [[TimescaleFormat alloc] init:10  withName:@"Jan, Feb, ..."];
  }
  return _MONTHS_MMM;
}

+(TimescaleFormat *)MONTHS_M
{
  if(_MONTHS_M == nil)
  {
      _MONTHS_M = [[TimescaleFormat alloc] init:11  withName:@"J, F, ..."];
  }
  return _MONTHS_M;
}

+(TimescaleFormat *)MONTHS_1
{
  if(_MONTHS_1 == nil)
  {
      _MONTHS_1 = [[TimescaleFormat alloc] init:57  withName:@"1, 2, ..."];
  }
  return _MONTHS_1;
}

+(TimescaleFormat *)MONTHS_1_XYY
{
  if(_MONTHS_1_XYY == nil)
  {
      _MONTHS_1_XYY = [[TimescaleFormat alloc] init:85  withName:@"1 '02"];
  }
  return _MONTHS_1_XYY;
}

+(TimescaleFormat *)MONTHS_1SYY
{
  if(_MONTHS_1SYY == nil)
  {
      _MONTHS_1SYY = [[TimescaleFormat alloc] init:86  withName:@"1/02"];
  }
  return _MONTHS_1SYY;
}

+(TimescaleFormat *)MONTHS_MONTH_1_START
{
  if(_MONTHS_MONTH_1_START == nil)
  {
      _MONTHS_MONTH_1_START = [[TimescaleFormat alloc] init:44  withName:@"Month 1, Month 2, ... (From Start)"];
  }
  return _MONTHS_MONTH_1_START;
}

+(TimescaleFormat *)MONTHS_M1_START
{
  if(_MONTHS_M1_START == nil)
  {
      _MONTHS_M1_START = [[TimescaleFormat alloc] init:60  withName:@"M1, M2, M3, ... (From Start)"];
  }
  return _MONTHS_M1_START;
}

+(TimescaleFormat *)MONTHS_1_START
{
  if(_MONTHS_1_START == nil)
  {
      _MONTHS_1_START = [[TimescaleFormat alloc] init:61  withName:@"1, 2, 3, 4, ... (From Start)"];
  }
  return _MONTHS_1_START;
}

+(TimescaleFormat *)MONTHS_MONTH_1_END
{
  if(_MONTHS_MONTH_1_END == nil)
  {
      _MONTHS_MONTH_1_END = [[TimescaleFormat alloc] init:45  withName:@"Month 2 Month 1, ... (From End)"];
  }
  return _MONTHS_MONTH_1_END;
}

+(TimescaleFormat *)MONTHS_M1_END
{
  if(_MONTHS_M1_END == nil)
  {
      _MONTHS_M1_END = [[TimescaleFormat alloc] init:58  withName:@"M3, M2, M1, ... (From End)"];
  }
  return _MONTHS_M1_END;
}

+(TimescaleFormat *)MONTHS_1_END
{
  if(_MONTHS_1_END == nil)
  {
      _MONTHS_1_END = [[TimescaleFormat alloc] init:59  withName:@"4, 3, 2, 1, ... (From End)"];
  }
  return _MONTHS_1_END;
}

+(TimescaleFormat *)TRIMONTHS_1
{
  if(_TRIMONTHS_1 == nil)
  {
      _TRIMONTHS_1 = [[TimescaleFormat alloc] init:136  withName:@"1, 11, 21, ..."];
  }
  return _TRIMONTHS_1;
}

+(TimescaleFormat *)TRIMONTHS_B
{
  if(_TRIMONTHS_B == nil)
  {
      _TRIMONTHS_B = [[TimescaleFormat alloc] init:137  withName:@"B, M, E, ..."];
  }
  return _TRIMONTHS_B;
}

+(TimescaleFormat *)TRIMONTHS_BEGINNING
{
  if(_TRIMONTHS_BEGINNING == nil)
  {
      _TRIMONTHS_BEGINNING = [[TimescaleFormat alloc] init:138  withName:@"Beginning, Middle, End, ..."];
  }
  return _TRIMONTHS_BEGINNING;
}

+(TimescaleFormat *)TRIMONTHS_MS1
{
  if(_TRIMONTHS_MS1 == nil)
  {
      _TRIMONTHS_MS1 = [[TimescaleFormat alloc] init:139  withName:@"1/1, 1/11, 1/21, ..."];
  }
  return _TRIMONTHS_MS1;
}

+(TimescaleFormat *)TRIMONTHS_MSB
{
  if(_TRIMONTHS_MSB == nil)
  {
      _TRIMONTHS_MSB = [[TimescaleFormat alloc] init:140  withName:@"1/B, 1/M, 1/E, ..."];
  }
  return _TRIMONTHS_MSB;
}

+(TimescaleFormat *)TRIMONTHS_MMMM_BEGINNING
{
  if(_TRIMONTHS_MMMM_BEGINNING == nil)
  {
      _TRIMONTHS_MMMM_BEGINNING = [[TimescaleFormat alloc] init:141  withName:@"January Beginning, January Middle, ..."];
  }
  return _TRIMONTHS_MMMM_BEGINNING;
}

+(TimescaleFormat *)TRIMONTHS_MMM_1
{
  if(_TRIMONTHS_MMM_1 == nil)
  {
      _TRIMONTHS_MMM_1 = [[TimescaleFormat alloc] init:142  withName:@"Jan 1, Jan 11, Jan 21, ..."];
  }
  return _TRIMONTHS_MMM_1;
}

+(TimescaleFormat *)TRIMONTHS_MMM_B
{
  if(_TRIMONTHS_MMM_B == nil)
  {
      _TRIMONTHS_MMM_B = [[TimescaleFormat alloc] init:143  withName:@"Jan B, Jan M, Jan E, ..."];
  }
  return _TRIMONTHS_MMM_B;
}

+(TimescaleFormat *)TRIMONTHS_MMMM_1
{
  if(_TRIMONTHS_MMMM_1 == nil)
  {
      _TRIMONTHS_MMMM_1 = [[TimescaleFormat alloc] init:144  withName:@"January 1, January 11, January 21, ..."];
  }
  return _TRIMONTHS_MMMM_1;
}

+(TimescaleFormat *)TRIMONTHS_MS1SYY
{
  if(_TRIMONTHS_MS1SYY == nil)
  {
      _TRIMONTHS_MS1SYY = [[TimescaleFormat alloc] init:145  withName:@"1/1/02, 1/11/02, 1/21/02, ..."];
  }
  return _TRIMONTHS_MS1SYY;
}

+(TimescaleFormat *)TRIMONTHS_MSBSYY
{
  if(_TRIMONTHS_MSBSYY == nil)
  {
      _TRIMONTHS_MSBSYY = [[TimescaleFormat alloc] init:146  withName:@"1/B/02, 1/M/02, 1/E/02, ..."];
  }
  return _TRIMONTHS_MSBSYY;
}

+(TimescaleFormat *)TRIMONTHS_MMM_1_X02
{
  if(_TRIMONTHS_MMM_1_X02 == nil)
  {
      _TRIMONTHS_MMM_1_X02 = [[TimescaleFormat alloc] init:147  withName:@"Jan 1/02, Jan 11/02, Jan 21/02, ..."];
  }
  return _TRIMONTHS_MMM_1_X02;
}

+(TimescaleFormat *)TRIMONTHS_MMM_B_X02
{
  if(_TRIMONTHS_MMM_B_X02 == nil)
  {
      _TRIMONTHS_MMM_B_X02 = [[TimescaleFormat alloc] init:148  withName:@"Jan B/02, Jan M/02, Jan E/02, ..."];
  }
  return _TRIMONTHS_MMM_B_X02;
}

+(TimescaleFormat *)TRIMONTHS_MMMM_1_YYYY
{
  if(_TRIMONTHS_MMMM_1_YYYY == nil)
  {
      _TRIMONTHS_MMMM_1_YYYY = [[TimescaleFormat alloc] init:149  withName:@"January 1, 2002, January 11, 2002, ..."];
  }
  return _TRIMONTHS_MMMM_1_YYYY;
}

+(TimescaleFormat *)TRIMONTHS_MMMM_BEGINNING_YYYY
{
  if(_TRIMONTHS_MMMM_BEGINNING_YYYY == nil)
  {
      _TRIMONTHS_MMMM_BEGINNING_YYYY = [[TimescaleFormat alloc] init:150  withName:@"January Beginning, ..."];
  }
  return _TRIMONTHS_MMMM_BEGINNING_YYYY;
}

+(TimescaleFormat *)WEEKS_MMMM_DD_YYYY
{
  if(_WEEKS_MMMM_DD_YYYY == nil)
  {
      _WEEKS_MMMM_DD_YYYY = [[TimescaleFormat alloc] init:12  withName:@"January 27, 2007"];
  }
  return _WEEKS_MMMM_DD_YYYY;
}

+(TimescaleFormat *)WEEKS_MMM_DD_XYY
{
  if(_WEEKS_MMM_DD_XYY == nil)
  {
      _WEEKS_MMM_DD_XYY = [[TimescaleFormat alloc] init:13  withName:@"January 27, '02"];
  }
  return _WEEKS_MMM_DD_XYY;
}

+(TimescaleFormat *)WEEKS_MMMM_DD
{
  if(_WEEKS_MMMM_DD == nil)
  {
      _WEEKS_MMMM_DD = [[TimescaleFormat alloc] init:14  withName:@"January 27"];
  }
  return _WEEKS_MMMM_DD;
}

+(TimescaleFormat *)WEEKS_MMM_DD
{
  if(_WEEKS_MMM_DD == nil)
  {
      _WEEKS_MMM_DD = [[TimescaleFormat alloc] init:15  withName:@"Jan 27, Feb 3, ..."];
  }
  return _WEEKS_MMM_DD;
}

+(TimescaleFormat *)WEEKS_MDD
{
  if(_WEEKS_MDD == nil)
  {
      _WEEKS_MDD = [[TimescaleFormat alloc] init:89  withName:@"J 27, F 3, ..."];
  }
  return _WEEKS_MDD;
}

+(TimescaleFormat *)WEEKS_MSDDSYY
{
  if(_WEEKS_MSDDSYY == nil)
  {
      _WEEKS_MSDDSYY = [[TimescaleFormat alloc] init:16  withName:@"1/27/02, 2/3/02, ..."];
  }
  return _WEEKS_MSDDSYY;
}

+(TimescaleFormat *)WEEKS_MSDD
{
  if(_WEEKS_MSDD == nil)
  {
      _WEEKS_MSDD = [[TimescaleFormat alloc] init:17  withName:@"1/27, 2/3, ..."];
  }
  return _WEEKS_MSDD;
}

+(TimescaleFormat *)WEEKS_DD
{
  if(_WEEKS_DD == nil)
  {
      _WEEKS_DD = [[TimescaleFormat alloc] init:87  withName:@"27, 3, ..."];
  }
  return _WEEKS_DD;
}

+(TimescaleFormat *)WEEKS_DDD_DD
{
  if(_WEEKS_DDD_DD == nil)
  {
      _WEEKS_DDD_DD = [[TimescaleFormat alloc] init:88  withName:@"Sun 27"];
  }
  return _WEEKS_DDD_DD;
}

+(TimescaleFormat *)WEEKS_DDD_MSDDSYY
{
  if(_WEEKS_DDD_MSDDSYY == nil)
  {
      _WEEKS_DDD_MSDDSYY = [[TimescaleFormat alloc] init:100  withName:@"Sun 1/27/02"];
  }
  return _WEEKS_DDD_MSDDSYY;
}

+(TimescaleFormat *)WEEKS_DDD_MMMM_DD_XYY
{
  if(_WEEKS_DDD_MMMM_DD_XYY == nil)
  {
      _WEEKS_DDD_MMMM_DD_XYY = [[TimescaleFormat alloc] init:102  withName:@"Sun January 27, '02"];
  }
  return _WEEKS_DDD_MMMM_DD_XYY;
}

+(TimescaleFormat *)WEEKS_DDD_MMM_DD_XYY
{
  if(_WEEKS_DDD_MMM_DD_XYY == nil)
  {
      _WEEKS_DDD_MMM_DD_XYY = [[TimescaleFormat alloc] init:101  withName:@"Sun Jan 27, '02"];
  }
  return _WEEKS_DDD_MMM_DD_XYY;
}

+(TimescaleFormat *)WEEKS_DDD_MMMM_DD
{
  if(_WEEKS_DDD_MMMM_DD == nil)
  {
      _WEEKS_DDD_MMMM_DD = [[TimescaleFormat alloc] init:96  withName:@"Sun January 27"];
  }
  return _WEEKS_DDD_MMMM_DD;
}

+(TimescaleFormat *)WEEKS_DDD_MMM_DD
{
  if(_WEEKS_DDD_MMM_DD == nil)
  {
      _WEEKS_DDD_MMM_DD = [[TimescaleFormat alloc] init:93  withName:@"Su Jan 27"];
  }
  return _WEEKS_DDD_MMM_DD;
}

+(TimescaleFormat *)WEEKS_MMM_W
{
  if(_WEEKS_MMM_W == nil)
  {
      _WEEKS_MMM_W = [[TimescaleFormat alloc] init:94  withName:@"S Jan 27"];
  }
  return _WEEKS_MMM_W;
}

+(TimescaleFormat *)WEEKS_D_MMM_DD
{
  if(_WEEKS_D_MMM_DD == nil)
  {
      _WEEKS_D_MMM_DD = [[TimescaleFormat alloc] init:95  withName:@"Sun J 27"];
  }
  return _WEEKS_D_MMM_DD;
}

+(TimescaleFormat *)WEEKS_DDD_M_DD
{
  if(_WEEKS_DDD_M_DD == nil)
  {
      _WEEKS_DDD_M_DD = [[TimescaleFormat alloc] init:97  withName:@"Su J 27"];
  }
  return _WEEKS_DDD_M_DD;
}

+(TimescaleFormat *)WEEKS_DD_M_DD
{
  if(_WEEKS_DD_M_DD == nil)
  {
      _WEEKS_DD_M_DD = [[TimescaleFormat alloc] init:98  withName:@"S J 27"];
  }
  return _WEEKS_DD_M_DD;
}

+(TimescaleFormat *)WEEKS_D_M_DD
{
  if(_WEEKS_D_M_DD == nil)
  {
      _WEEKS_D_M_DD = [[TimescaleFormat alloc] init:99  withName:@"Sun 1/27"];
  }
  return _WEEKS_D_M_DD;
}

+(TimescaleFormat *)WEEKS_DDD_MSDD
{
  if(_WEEKS_DDD_MSDD == nil)
  {
      _WEEKS_DDD_MSDD = [[TimescaleFormat alloc] init:90  withName:@"Su 1/27"];
  }
  return _WEEKS_DDD_MSDD;
}

+(TimescaleFormat *)WEEKS_DD_MSDD
{
  if(_WEEKS_DD_MSDD == nil)
  {
      _WEEKS_DD_MSDD = [[TimescaleFormat alloc] init:91  withName:@"S 1/27"];
  }
  return _WEEKS_DD_MSDD;
}

+(TimescaleFormat *)WEEKS_D_MSDD
{
  if(_WEEKS_D_MSDD == nil)
  {
      _WEEKS_D_MSDD = [[TimescaleFormat alloc] init:92  withName:@"1, 2, ...52, 1, 2"];
  }
  return _WEEKS_D_MSDD;
}

+(TimescaleFormat *)WEEKS_W
{
  if(_WEEKS_W == nil)
  {
      _WEEKS_W = [[TimescaleFormat alloc] init:50  withName:@"Sun 1, ..., Sun 52, Sun 1,..."];
  }
  return _WEEKS_W;
}

+(TimescaleFormat *)WEEKS_DDD_W
{
  if(_WEEKS_DDD_W == nil)
  {
      _WEEKS_DDD_W = [[TimescaleFormat alloc] init:103  withName:@"1 1, ..., 7 1, 1 2, ..., 7 52"];
  }
  return _WEEKS_DDD_W;
}

+(TimescaleFormat *)WEEKS_D_W
{
  if(_WEEKS_D_W == nil)
  {
      _WEEKS_D_W = [[TimescaleFormat alloc] init:104  withName:@"Week 1, Week 2, ... (From Start)"];
  }
  return _WEEKS_D_W;
}

+(TimescaleFormat *)WEEKS_WEEK_1_START
{
  if(_WEEKS_WEEK_1_START == nil)
  {
      _WEEKS_WEEK_1_START = [[TimescaleFormat alloc] init:42  withName:@"W1, W2, ... (From start)"];
  }
  return _WEEKS_WEEK_1_START;
}

+(TimescaleFormat *)WEEKS_W1_START
{
  if(_WEEKS_W1_START == nil)
  {
      _WEEKS_W1_START = [[TimescaleFormat alloc] init:69  withName:@"1, 2, 3, 4, ... (From start)"];
  }
  return _WEEKS_W1_START;
}

+(TimescaleFormat *)WEEKS_1_START
{
  if(_WEEKS_1_START == nil)
  {
      _WEEKS_1_START = [[TimescaleFormat alloc] init:70  withName:@"Week 2, Week 1, ... (From end)"];
  }
  return _WEEKS_1_START;
}

+(TimescaleFormat *)WEEKS_WEEK_1_END
{
  if(_WEEKS_WEEK_1_END == nil)
  {
      _WEEKS_WEEK_1_END = [[TimescaleFormat alloc] init:43  withName:@"W4, W3, W2, W1, ... (From end)"];
  }
  return _WEEKS_WEEK_1_END;
}

+(TimescaleFormat *)WEEKS_W1_END
{
  if(_WEEKS_W1_END == nil)
  {
      _WEEKS_W1_END = [[TimescaleFormat alloc] init:67  withName:@"4, 3, 2, 1, ... (From end)"];
  }
  return _WEEKS_W1_END;
}

+(TimescaleFormat *)WEEKS_1_END
{
  if(_WEEKS_1_END == nil)
  {
      _WEEKS_1_END = [[TimescaleFormat alloc] init:68  withName:@"Mon Jan 28, '02"];
  }
  return _WEEKS_1_END;
}

+(TimescaleFormat *)DAYS_DDD_MMM_DD_XYY
{
  if(_DAYS_DDD_MMM_DD_XYY == nil)
  {
      _DAYS_DDD_MMM_DD_XYY = [[TimescaleFormat alloc] init:22  withName:@"Mon January 28"];
  }
  return _DAYS_DDD_MMM_DD_XYY;
}

+(TimescaleFormat *)DAYS_DDD_MMMM_DD
{
  if(_DAYS_DDD_MMMM_DD == nil)
  {
      _DAYS_DDD_MMMM_DD = [[TimescaleFormat alloc] init:111  withName:@"Mon Jan 28"];
  }
  return _DAYS_DDD_MMMM_DD;
}

+(TimescaleFormat *)DAYS_DDD_MMM_DD
{
  if(_DAYS_DDD_MMM_DD == nil)
  {
      _DAYS_DDD_MMM_DD = [[TimescaleFormat alloc] init:23  withName:@"Mon J 28"];
  }
  return _DAYS_DDD_MMM_DD;
}

+(TimescaleFormat *)DAYS_DDD_M_DD
{
  if(_DAYS_DDD_M_DD == nil)
  {
      _DAYS_DDD_M_DD = [[TimescaleFormat alloc] init:112  withName:@"Mo J 28"];
  }
  return _DAYS_DDD_M_DD;
}

+(TimescaleFormat *)DAYS_DD_M_DD
{
  if(_DAYS_DD_M_DD == nil)
  {
      _DAYS_DD_M_DD = [[TimescaleFormat alloc] init:113  withName:@"M J 28"];
  }
  return _DAYS_DD_M_DD;
}

+(TimescaleFormat *)DAYS_D_M_DD
{
  if(_DAYS_D_M_DD == nil)
  {
      _DAYS_D_M_DD = [[TimescaleFormat alloc] init:114  withName:@"Mon 1/28"];
  }
  return _DAYS_D_M_DD;
}

+(TimescaleFormat *)DAYS_DDD_MSDD
{
  if(_DAYS_DDD_MSDD == nil)
  {
      _DAYS_DDD_MSDD = [[TimescaleFormat alloc] init:108  withName:@"Mo 1/28"];
  }
  return _DAYS_DDD_MSDD;
}

+(TimescaleFormat *)DAYS_DD_MSDD
{
  if(_DAYS_DD_MSDD == nil)
  {
      _DAYS_DD_MSDD = [[TimescaleFormat alloc] init:109  withName:@"M 1/28"];
  }
  return _DAYS_DD_MSDD;
}

+(TimescaleFormat *)DAYS_D_MSDD
{
  if(_DAYS_D_MSDD == nil)
  {
      _DAYS_D_MSDD = [[TimescaleFormat alloc] init:110  withName:@"Mon 28"];
  }
  return _DAYS_D_MSDD;
}

+(TimescaleFormat *)DAYS_DDD_DD
{
  if(_DAYS_DDD_DD == nil)
  {
      _DAYS_DDD_DD = [[TimescaleFormat alloc] init:105  withName:@"Mo 28"];
  }
  return _DAYS_DDD_DD;
}

+(TimescaleFormat *)DAYS_DD_DD
{
  if(_DAYS_DD_DD == nil)
  {
      _DAYS_DD_DD = [[TimescaleFormat alloc] init:106  withName:@"M 28"];
  }
  return _DAYS_DD_DD;
}

+(TimescaleFormat *)DAYS_D_DD
{
  if(_DAYS_D_DD == nil)
  {
      _DAYS_D_DD = [[TimescaleFormat alloc] init:107  withName:@"M28"];
  }
  return _DAYS_D_DD;
}

+(TimescaleFormat *)DAYS_DXDD
{
  if(_DAYS_DXDD == nil)
  {
      _DAYS_DXDD = [[TimescaleFormat alloc] init:121  withName:@"Jan 28, '02"];
  }
  return _DAYS_DXDD;
}

+(TimescaleFormat *)DAYS_DD_MMM
{
  if(_DAYS_DD_MMM == nil)
  {
      _DAYS_DD_MMM = [[TimescaleFormat alloc] init:25  withName:@"28 Jan"];
  }
  return _DAYS_DD_MMM;
}

+(TimescaleFormat *)DAYS_DDD_DD_XYY
{
  if(_DAYS_DDD_DD_XYY == nil)
  {
      _DAYS_DDD_DD_XYY = [[TimescaleFormat alloc] init:24  withName:@"Jan 28, Jan 29, ... "];
  }
  return _DAYS_DDD_DD_XYY;
}

+(TimescaleFormat *)DAYS_M_DD
{
  if(_DAYS_M_DD == nil)
  {
      _DAYS_M_DD = [[TimescaleFormat alloc] init:115  withName:@"J28, J29, ... "];
  }
  return _DAYS_M_DD;
}

+(TimescaleFormat *)DAYS_DDDD
{
  if(_DAYS_DDDD == nil)
  {
      _DAYS_DDDD = [[TimescaleFormat alloc] init:18  withName:@"Sunday, Monday, ..."];
  }
  return _DAYS_DDDD;
}

+(TimescaleFormat *)DAYS_DDD
{
  if(_DAYS_DDD == nil)
  {
      _DAYS_DDD = [[TimescaleFormat alloc] init:19  withName:@"Sun, Mon, Tue, ..."];
  }
  return _DAYS_DDD;
}

+(TimescaleFormat *)DAYS_DD
{
  if(_DAYS_DD == nil)
  {
      _DAYS_DD = [[TimescaleFormat alloc] init:119  withName:@"Su, Mo, Tu, ..."];
  }
  return _DAYS_DD;
}

+(TimescaleFormat *)DAYS_D
{
  if(_DAYS_D == nil)
  {
      _DAYS_D = [[TimescaleFormat alloc] init:20  withName:@"S, M, T, ..."];
  }
  return _DAYS_D;
}

+(TimescaleFormat *)DAYS_MSDDSYY
{
  if(_DAYS_MSDDSYY == nil)
  {
      _DAYS_MSDDSYY = [[TimescaleFormat alloc] init:26  withName:@"1/28/02, 1/29/02, ... "];
  }
  return _DAYS_MSDDSYY;
}

+(TimescaleFormat *)DAYS_DDD_MSDDSYY
{
  if(_DAYS_DDD_MSDDSYY == nil)
  {
      _DAYS_DDD_MSDDSYY = [[TimescaleFormat alloc] init:52  withName:@"Mon 1/28/02, Tue 1/29/02, ... "];
  }
  return _DAYS_DDD_MSDDSYY;
}

+(TimescaleFormat *)DAYS_MSDD
{
  if(_DAYS_MSDD == nil)
  {
      _DAYS_MSDD = [[TimescaleFormat alloc] init:27  withName:@"1/28, 1/29, ... "];
  }
  return _DAYS_MSDD;
}

+(TimescaleFormat *)DAYS_1
{
  if(_DAYS_1 == nil)
  {
      _DAYS_1 = [[TimescaleFormat alloc] init:21  withName:@"1, 2, ..."];
  }
  return _DAYS_1;
}

+(TimescaleFormat *)DAYS_128_YYYY
{
  if(_DAYS_128_YYYY == nil)
  {
      _DAYS_128_YYYY = [[TimescaleFormat alloc] init:117  withName:@"128 2002 (Day of Year)"];
  }
  return _DAYS_128_YYYY;
}

+(TimescaleFormat *)DAYS_128_XYY
{
  if(_DAYS_128_XYY == nil)
  {
      _DAYS_128_XYY = [[TimescaleFormat alloc] init:116  withName:@"128 '02 (Day of Year)"];
  }
  return _DAYS_128_XYY;
}

+(TimescaleFormat *)DAYS_128
{
  if(_DAYS_128 == nil)
  {
      _DAYS_128 = [[TimescaleFormat alloc] init:118  withName:@"128 (Day of Year)"];
  }
  return _DAYS_128;
}

+(TimescaleFormat *)DAYS_DAY_1_START
{
  if(_DAYS_DAY_1_START == nil)
  {
      _DAYS_DAY_1_START = [[TimescaleFormat alloc] init:40  withName:@"Day 1, Day 2, ...  (From Start)"];
  }
  return _DAYS_DAY_1_START;
}

+(TimescaleFormat *)DAYS_D1_START
{
  if(_DAYS_D1_START == nil)
  {
      _DAYS_D1_START = [[TimescaleFormat alloc] init:55  withName:@"D1, D2, D3, ...  (From start)"];
  }
  return _DAYS_D1_START;
}

+(TimescaleFormat *)DAYS_1_START
{
  if(_DAYS_1_START == nil)
  {
      _DAYS_1_START = [[TimescaleFormat alloc] init:56  withName:@"1, 2, 3, 4, ...  (From start)"];
  }
  return _DAYS_1_START;
}

+(TimescaleFormat *)DAYS_DAY_1_END
{
  if(_DAYS_DAY_1_END == nil)
  {
      _DAYS_DAY_1_END = [[TimescaleFormat alloc] init:41  withName:@"Day 2, Day 1, ...  (From end)"];
  }
  return _DAYS_DAY_1_END;
}

+(TimescaleFormat *)DAYS_D1_END
{
  if(_DAYS_D1_END == nil)
  {
      _DAYS_D1_END = [[TimescaleFormat alloc] init:53  withName:@"D3, D2, D1, ...  (From end)"];
  }
  return _DAYS_D1_END;
}

+(TimescaleFormat *)DAYS_1_END
{
  if(_DAYS_1_END == nil)
  {
      _DAYS_1_END = [[TimescaleFormat alloc] init:54  withName:@"4, 3, 2, 1, ...  (From start)"];
  }
  return _DAYS_1_END;
}

+(TimescaleFormat *)HOURS_DDD_MMM_DD_HH_AM
{
  if(_HOURS_DDD_MMM_DD_HH_AM == nil)
  {
      _HOURS_DDD_MMM_DD_HH_AM = [[TimescaleFormat alloc] init:28  withName:@"Mon Jan 28, 11 AM"];
  }
  return _HOURS_DDD_MMM_DD_HH_AM;
}

+(TimescaleFormat *)HOURS_MMM_DD_HH_AM
{
  if(_HOURS_MMM_DD_HH_AM == nil)
  {
      _HOURS_MMM_DD_HH_AM = [[TimescaleFormat alloc] init:29  withName:@"Jan 28, 11 AM"];
  }
  return _HOURS_MMM_DD_HH_AM;
}

+(TimescaleFormat *)HOURS_MSDD_HH_AM
{
  if(_HOURS_MSDD_HH_AM == nil)
  {
      _HOURS_MSDD_HH_AM = [[TimescaleFormat alloc] init:120  withName:@"1/28, 11 AM"];
  }
  return _HOURS_MSDD_HH_AM;
}

+(TimescaleFormat *)HOURS_HHMM_AM
{
  if(_HOURS_HHMM_AM == nil)
  {
      _HOURS_HHMM_AM = [[TimescaleFormat alloc] init:30  withName:@"11:00 AM, 12:00 PM, ... "];
  }
  return _HOURS_HHMM_AM;
}

+(TimescaleFormat *)HOURS_HH_AM
{
  if(_HOURS_HH_AM == nil)
  {
      _HOURS_HH_AM = [[TimescaleFormat alloc] init:31  withName:@"11 AM, 12 PM, ... "];
  }
  return _HOURS_HH_AM;
}

+(TimescaleFormat *)HOURS_HH
{
  if(_HOURS_HH == nil)
  {
      _HOURS_HH = [[TimescaleFormat alloc] init:32  withName:@"11, 12, ... "];
  }
  return _HOURS_HH;
}

+(TimescaleFormat *)HOURS_HOUR_1_START
{
  if(_HOURS_HOUR_1_START == nil)
  {
      _HOURS_HOUR_1_START = [[TimescaleFormat alloc] init:38  withName:@"Hour 1, Hour 2, ...  (From Start)"];
  }
  return _HOURS_HOUR_1_START;
}

+(TimescaleFormat *)HOURS_H1_START
{
  if(_HOURS_H1_START == nil)
  {
      _HOURS_H1_START = [[TimescaleFormat alloc] init:78  withName:@"H1, H2, H3, ...  (From start)"];
  }
  return _HOURS_H1_START;
}

+(TimescaleFormat *)HOURS_1_START
{
  if(_HOURS_1_START == nil)
  {
      _HOURS_1_START = [[TimescaleFormat alloc] init:79  withName:@"1, 2, 3, 4, ...  (From start)"];
  }
  return _HOURS_1_START;
}

+(TimescaleFormat *)HOURS_HOUR_1_END
{
  if(_HOURS_HOUR_1_END == nil)
  {
      _HOURS_HOUR_1_END = [[TimescaleFormat alloc] init:39  withName:@"Hour 2, Hour 1, ...  (From end)"];
  }
  return _HOURS_HOUR_1_END;
}

+(TimescaleFormat *)HOURS_H1_END
{
  if(_HOURS_H1_END == nil)
  {
      _HOURS_H1_END = [[TimescaleFormat alloc] init:76  withName:@"H3, H2, H1, ...  (From end)"];
  }
  return _HOURS_H1_END;
}

+(TimescaleFormat *)HOURS_1_END
{
  if(_HOURS_1_END == nil)
  {
      _HOURS_1_END = [[TimescaleFormat alloc] init:77  withName:@"4, 3, 2, 1, ...  (From start)"];
  }
  return _HOURS_1_END;
}

+(TimescaleFormat *)MINUTES_HHMM_AM
{
  if(_MINUTES_HHMM_AM == nil)
  {
      _MINUTES_HHMM_AM = [[TimescaleFormat alloc] init:33  withName:@"1:45 PM, 1:46 PM, ... "];
  }
  return _MINUTES_HHMM_AM;
}

+(TimescaleFormat *)MINUTES_MM
{
  if(_MINUTES_MM == nil)
  {
      _MINUTES_MM = [[TimescaleFormat alloc] init:34  withName:@"45, 46, 47, ... "];
  }
  return _MINUTES_MM;
}

+(TimescaleFormat *)MINUTES_MINUTE_1_START
{
  if(_MINUTES_MINUTE_1_START == nil)
  {
      _MINUTES_MINUTE_1_START = [[TimescaleFormat alloc] init:36  withName:@"Minute 1, Minute 2, ...  (From Start)"];
  }
  return _MINUTES_MINUTE_1_START;
}

+(TimescaleFormat *)MINUTES_M1_START
{
  if(_MINUTES_M1_START == nil)
  {
      _MINUTES_M1_START = [[TimescaleFormat alloc] init:82  withName:@"M1, M2, M3, ...  (From start)"];
  }
  return _MINUTES_M1_START;
}

+(TimescaleFormat *)MINUTES_1_START
{
  if(_MINUTES_1_START == nil)
  {
      _MINUTES_1_START = [[TimescaleFormat alloc] init:83  withName:@"1, 2, 3, 4, ...  (From start)"];
  }
  return _MINUTES_1_START;
}

+(TimescaleFormat *)MINUTES_MINUTE_1_END
{
  if(_MINUTES_MINUTE_1_END == nil)
  {
      _MINUTES_MINUTE_1_END = [[TimescaleFormat alloc] init:37  withName:@"Minute 2, Minute 1, ...  (From end)"];
  }
  return _MINUTES_MINUTE_1_END;
}

+(TimescaleFormat *)MINUTES_M1_END
{
  if(_MINUTES_M1_END == nil)
  {
      _MINUTES_M1_END = [[TimescaleFormat alloc] init:80  withName:@"M3, M2, M1, ...  (From end)"];
  }
  return _MINUTES_M1_END;
}

+(TimescaleFormat *)MINUTES_1_END
{
  if(_MINUTES_1_END == nil)
  {
      _MINUTES_1_END = [[TimescaleFormat alloc] init:81  withName:@"4, 3, 2, 1, ...  (From start)"];
  }
  return _MINUTES_1_END;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      NSMutableArray *temp = [[NSMutableArray alloc] initWithObjects:[TimescaleFormat NONE], [TimescaleFormat YEAR_YYYY], [TimescaleFormat YEAR_XYY], [TimescaleFormat YEAR_YY], [TimescaleFormat YEAR_YEAR_START], [TimescaleFormat YEAR_Y_START], [TimescaleFormat YEAR_1_START], [TimescaleFormat YEAR_YEAR_END], [TimescaleFormat YEAR_Y_END], [TimescaleFormat YEAR_1_END], [TimescaleFormat HALFYEAR_1_HALF], [TimescaleFormat HALFYEAR_HALF_1_YYYY], [TimescaleFormat HALFYEAR_HALF_1], [TimescaleFormat HALFYEAR_H1_XYY], [TimescaleFormat HALFYEAR_H1], [TimescaleFormat HALFYEAR_1], [TimescaleFormat HALFYEAR_1HYY], [TimescaleFormat HALFYEAR_HALF_1_START], [TimescaleFormat HALFYEAR_H1_START], [TimescaleFormat HALFYEAR_1_START], [TimescaleFormat HALFYEAR_HALF_1_END], [TimescaleFormat HALFYEAR_H1_END], [TimescaleFormat HALFYEAR_1_END], [TimescaleFormat QUARTER_1_QUARTER], [TimescaleFormat QUARTER_QTR_1_YYYY], [TimescaleFormat QUARTER_QTR_1], [TimescaleFormat QUARTER_Q1_XYY], [TimescaleFormat QUARTER_Q1], [TimescaleFormat QUARTER_1], [TimescaleFormat QUARTER_1QYY], [TimescaleFormat QUARTER_QUARTER_1_START], [TimescaleFormat QUARTER_Q1_START], [TimescaleFormat QUARTER_1_START], [TimescaleFormat QUARTER_QUARTER_1_END], [TimescaleFormat QUARTER_Q1_END], [TimescaleFormat QUARTER_1_END], [TimescaleFormat MONTHS_MMMM_YYYY], [TimescaleFormat MONTHS_MMM_XYY], [TimescaleFormat MONTHS_MMMM], [TimescaleFormat MONTHS_MMM], [TimescaleFormat MONTHS_M], [TimescaleFormat MONTHS_1], [TimescaleFormat MONTHS_1_XYY], [TimescaleFormat MONTHS_1SYY], [TimescaleFormat MONTHS_MONTH_1_START], [TimescaleFormat MONTHS_M1_START], [TimescaleFormat MONTHS_1_START], [TimescaleFormat MONTHS_MONTH_1_END], [TimescaleFormat MONTHS_M1_END], [TimescaleFormat MONTHS_1_END], [TimescaleFormat TRIMONTHS_1], [TimescaleFormat TRIMONTHS_B], [TimescaleFormat TRIMONTHS_BEGINNING], [TimescaleFormat TRIMONTHS_MS1], [TimescaleFormat TRIMONTHS_MSB], [TimescaleFormat TRIMONTHS_MMMM_BEGINNING], [TimescaleFormat TRIMONTHS_MMM_1], [TimescaleFormat TRIMONTHS_MMM_B], [TimescaleFormat TRIMONTHS_MMMM_1], [TimescaleFormat TRIMONTHS_MS1SYY], [TimescaleFormat TRIMONTHS_MSBSYY], [TimescaleFormat TRIMONTHS_MMM_1_X02], [TimescaleFormat TRIMONTHS_MMM_B_X02], [TimescaleFormat TRIMONTHS_MMMM_1_YYYY], [TimescaleFormat TRIMONTHS_MMMM_BEGINNING_YYYY], [TimescaleFormat WEEKS_MMMM_DD_YYYY], [TimescaleFormat WEEKS_MMM_DD_XYY], [TimescaleFormat WEEKS_MMMM_DD], [TimescaleFormat WEEKS_MMM_DD], [TimescaleFormat WEEKS_MDD], [TimescaleFormat WEEKS_MSDDSYY], [TimescaleFormat WEEKS_MSDD], [TimescaleFormat WEEKS_DD], [TimescaleFormat WEEKS_DDD_DD], [TimescaleFormat WEEKS_DDD_MSDDSYY], [TimescaleFormat WEEKS_DDD_MMMM_DD_XYY], [TimescaleFormat WEEKS_DDD_MMM_DD_XYY], [TimescaleFormat WEEKS_DDD_MMMM_DD], [TimescaleFormat WEEKS_DDD_MMM_DD], [TimescaleFormat WEEKS_MMM_W], [TimescaleFormat WEEKS_D_MMM_DD], [TimescaleFormat WEEKS_DDD_M_DD], [TimescaleFormat WEEKS_DD_M_DD], [TimescaleFormat WEEKS_D_M_DD], [TimescaleFormat WEEKS_DDD_MSDD], [TimescaleFormat WEEKS_DD_MSDD], [TimescaleFormat WEEKS_D_MSDD], [TimescaleFormat WEEKS_W], [TimescaleFormat WEEKS_DDD_W], [TimescaleFormat WEEKS_D_W], [TimescaleFormat WEEKS_WEEK_1_START], [TimescaleFormat WEEKS_W1_START], [TimescaleFormat WEEKS_1_START], [TimescaleFormat WEEKS_WEEK_1_END], [TimescaleFormat WEEKS_W1_END], [TimescaleFormat WEEKS_1_END], [TimescaleFormat DAYS_DDD_MMM_DD_XYY], [TimescaleFormat DAYS_DDD_MMMM_DD], [TimescaleFormat DAYS_DDD_MMM_DD], [TimescaleFormat DAYS_DDD_M_DD], [TimescaleFormat DAYS_DD_M_DD], [TimescaleFormat DAYS_D_M_DD], [TimescaleFormat DAYS_DDD_MSDD], [TimescaleFormat DAYS_DD_MSDD], [TimescaleFormat DAYS_D_MSDD], [TimescaleFormat DAYS_DDD_DD], [TimescaleFormat DAYS_DD_DD], [TimescaleFormat DAYS_D_DD], [TimescaleFormat DAYS_DXDD], [TimescaleFormat DAYS_DD_MMM], [TimescaleFormat DAYS_DDD_DD_XYY], [TimescaleFormat DAYS_M_DD], [TimescaleFormat DAYS_DDDD], [TimescaleFormat DAYS_DDD], [TimescaleFormat DAYS_DD], [TimescaleFormat DAYS_D], [TimescaleFormat DAYS_MSDDSYY], [TimescaleFormat DAYS_DDD_MSDDSYY], [TimescaleFormat DAYS_MSDD], [TimescaleFormat DAYS_1], [TimescaleFormat DAYS_128_YYYY], [TimescaleFormat DAYS_128_XYY], [TimescaleFormat DAYS_128], [TimescaleFormat DAYS_DAY_1_START], [TimescaleFormat DAYS_D1_START], [TimescaleFormat DAYS_1_START], [TimescaleFormat DAYS_DAY_1_END], [TimescaleFormat DAYS_D1_END], [TimescaleFormat DAYS_1_END], [TimescaleFormat HOURS_DDD_MMM_DD_HH_AM], [TimescaleFormat HOURS_MMM_DD_HH_AM], [TimescaleFormat HOURS_MSDD_HH_AM], [TimescaleFormat HOURS_HHMM_AM], [TimescaleFormat HOURS_HH_AM], [TimescaleFormat HOURS_HH], [TimescaleFormat HOURS_HOUR_1_START], [TimescaleFormat HOURS_H1_START], [TimescaleFormat HOURS_1_START], [TimescaleFormat HOURS_HOUR_1_END], [TimescaleFormat HOURS_H1_END], [TimescaleFormat HOURS_1_END], [TimescaleFormat MINUTES_HHMM_AM], [TimescaleFormat MINUTES_MM], [TimescaleFormat MINUTES_MINUTE_1_START], [TimescaleFormat MINUTES_M1_START], [TimescaleFormat MINUTES_1_START], [TimescaleFormat MINUTES_MINUTE_1_END], [TimescaleFormat MINUTES_M1_END], [TimescaleFormat MINUTES_1_END],  nil];
      
      _TYPE_VALUES = [EnumUtility createTypeArray:temp withOffSet:3];
  }
  return _TYPE_VALUES;
}

@end
