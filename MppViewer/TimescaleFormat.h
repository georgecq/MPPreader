//
// TimescaleFormat.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface TimescaleFormat : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(TimescaleFormat *)getInstance:(int)type;

+(TimescaleFormat *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)getName;

-(NSString *)toString;

+(TimescaleFormat *)NONE;
+(TimescaleFormat *)YEAR_YYYY;
+(TimescaleFormat *)YEAR_XYY;
+(TimescaleFormat *)YEAR_YY;
+(TimescaleFormat *)YEAR_YEAR_START;
+(TimescaleFormat *)YEAR_Y_START;
+(TimescaleFormat *)YEAR_1_START;
+(TimescaleFormat *)YEAR_YEAR_END;
+(TimescaleFormat *)YEAR_Y_END;
+(TimescaleFormat *)YEAR_1_END;
+(TimescaleFormat *)HALFYEAR_1_HALF;
+(TimescaleFormat *)HALFYEAR_HALF_1_YYYY;
+(TimescaleFormat *)HALFYEAR_HALF_1;
+(TimescaleFormat *)HALFYEAR_H1_XYY;
+(TimescaleFormat *)HALFYEAR_H1;
+(TimescaleFormat *)HALFYEAR_1;
+(TimescaleFormat *)HALFYEAR_1HYY;
+(TimescaleFormat *)HALFYEAR_HALF_1_START;
+(TimescaleFormat *)HALFYEAR_H1_START;
+(TimescaleFormat *)HALFYEAR_1_START;
+(TimescaleFormat *)HALFYEAR_HALF_1_END;
+(TimescaleFormat *)HALFYEAR_H1_END;
+(TimescaleFormat *)HALFYEAR_1_END;
+(TimescaleFormat *)QUARTER_1_QUARTER;
+(TimescaleFormat *)QUARTER_QTR_1_YYYY;
+(TimescaleFormat *)QUARTER_QTR_1;
+(TimescaleFormat *)QUARTER_Q1_XYY;
+(TimescaleFormat *)QUARTER_Q1;
+(TimescaleFormat *)QUARTER_1;
+(TimescaleFormat *)QUARTER_1QYY;
+(TimescaleFormat *)QUARTER_QUARTER_1_START;
+(TimescaleFormat *)QUARTER_Q1_START;
+(TimescaleFormat *)QUARTER_1_START;
+(TimescaleFormat *)QUARTER_QUARTER_1_END;
+(TimescaleFormat *)QUARTER_Q1_END;
+(TimescaleFormat *)QUARTER_1_END;
+(TimescaleFormat *)MONTHS_MMMM_YYYY;
+(TimescaleFormat *)MONTHS_MMM_XYY;
+(TimescaleFormat *)MONTHS_MMMM;
+(TimescaleFormat *)MONTHS_MMM;
+(TimescaleFormat *)MONTHS_M;
+(TimescaleFormat *)MONTHS_1;
+(TimescaleFormat *)MONTHS_1_XYY;
+(TimescaleFormat *)MONTHS_1SYY;
+(TimescaleFormat *)MONTHS_MONTH_1_START;
+(TimescaleFormat *)MONTHS_M1_START;
+(TimescaleFormat *)MONTHS_1_START;
+(TimescaleFormat *)MONTHS_MONTH_1_END;
+(TimescaleFormat *)MONTHS_M1_END;
+(TimescaleFormat *)MONTHS_1_END;
+(TimescaleFormat *)TRIMONTHS_1;
+(TimescaleFormat *)TRIMONTHS_B;
+(TimescaleFormat *)TRIMONTHS_BEGINNING;
+(TimescaleFormat *)TRIMONTHS_MS1;
+(TimescaleFormat *)TRIMONTHS_MSB;
+(TimescaleFormat *)TRIMONTHS_MMMM_BEGINNING;
+(TimescaleFormat *)TRIMONTHS_MMM_1;
+(TimescaleFormat *)TRIMONTHS_MMM_B;
+(TimescaleFormat *)TRIMONTHS_MMMM_1;
+(TimescaleFormat *)TRIMONTHS_MS1SYY;
+(TimescaleFormat *)TRIMONTHS_MSBSYY;
+(TimescaleFormat *)TRIMONTHS_MMM_1_X02;
+(TimescaleFormat *)TRIMONTHS_MMM_B_X02;
+(TimescaleFormat *)TRIMONTHS_MMMM_1_YYYY;
+(TimescaleFormat *)TRIMONTHS_MMMM_BEGINNING_YYYY;
+(TimescaleFormat *)WEEKS_MMMM_DD_YYYY;
+(TimescaleFormat *)WEEKS_MMM_DD_XYY;
+(TimescaleFormat *)WEEKS_MMMM_DD;
+(TimescaleFormat *)WEEKS_MMM_DD;
+(TimescaleFormat *)WEEKS_MDD;
+(TimescaleFormat *)WEEKS_MSDDSYY;
+(TimescaleFormat *)WEEKS_MSDD;
+(TimescaleFormat *)WEEKS_DD;
+(TimescaleFormat *)WEEKS_DDD_DD;
+(TimescaleFormat *)WEEKS_DDD_MSDDSYY;
+(TimescaleFormat *)WEEKS_DDD_MMMM_DD_XYY;
+(TimescaleFormat *)WEEKS_DDD_MMM_DD_XYY;
+(TimescaleFormat *)WEEKS_DDD_MMMM_DD;
+(TimescaleFormat *)WEEKS_DDD_MMM_DD;
+(TimescaleFormat *)WEEKS_MMM_W;
+(TimescaleFormat *)WEEKS_D_MMM_DD;
+(TimescaleFormat *)WEEKS_DDD_M_DD;
+(TimescaleFormat *)WEEKS_DD_M_DD;
+(TimescaleFormat *)WEEKS_D_M_DD;
+(TimescaleFormat *)WEEKS_DDD_MSDD;
+(TimescaleFormat *)WEEKS_DD_MSDD;
+(TimescaleFormat *)WEEKS_D_MSDD;
+(TimescaleFormat *)WEEKS_W;
+(TimescaleFormat *)WEEKS_DDD_W;
+(TimescaleFormat *)WEEKS_D_W;
+(TimescaleFormat *)WEEKS_WEEK_1_START;
+(TimescaleFormat *)WEEKS_W1_START;
+(TimescaleFormat *)WEEKS_1_START;
+(TimescaleFormat *)WEEKS_WEEK_1_END;
+(TimescaleFormat *)WEEKS_W1_END;
+(TimescaleFormat *)WEEKS_1_END;
+(TimescaleFormat *)DAYS_DDD_MMM_DD_XYY;
+(TimescaleFormat *)DAYS_DDD_MMMM_DD;
+(TimescaleFormat *)DAYS_DDD_MMM_DD;
+(TimescaleFormat *)DAYS_DDD_M_DD;
+(TimescaleFormat *)DAYS_DD_M_DD;
+(TimescaleFormat *)DAYS_D_M_DD;
+(TimescaleFormat *)DAYS_DDD_MSDD;
+(TimescaleFormat *)DAYS_DD_MSDD;
+(TimescaleFormat *)DAYS_D_MSDD;
+(TimescaleFormat *)DAYS_DDD_DD;
+(TimescaleFormat *)DAYS_DD_DD;
+(TimescaleFormat *)DAYS_D_DD;
+(TimescaleFormat *)DAYS_DXDD;
+(TimescaleFormat *)DAYS_DD_MMM;
+(TimescaleFormat *)DAYS_DDD_DD_XYY;
+(TimescaleFormat *)DAYS_M_DD;
+(TimescaleFormat *)DAYS_DDDD;
+(TimescaleFormat *)DAYS_DDD;
+(TimescaleFormat *)DAYS_DD;
+(TimescaleFormat *)DAYS_D;
+(TimescaleFormat *)DAYS_MSDDSYY;
+(TimescaleFormat *)DAYS_DDD_MSDDSYY;
+(TimescaleFormat *)DAYS_MSDD;
+(TimescaleFormat *)DAYS_1;
+(TimescaleFormat *)DAYS_128_YYYY;
+(TimescaleFormat *)DAYS_128_XYY;
+(TimescaleFormat *)DAYS_128;
+(TimescaleFormat *)DAYS_DAY_1_START;
+(TimescaleFormat *)DAYS_D1_START;
+(TimescaleFormat *)DAYS_1_START;
+(TimescaleFormat *)DAYS_DAY_1_END;
+(TimescaleFormat *)DAYS_D1_END;
+(TimescaleFormat *)DAYS_1_END;
+(TimescaleFormat *)HOURS_DDD_MMM_DD_HH_AM;
+(TimescaleFormat *)HOURS_MMM_DD_HH_AM;
+(TimescaleFormat *)HOURS_MSDD_HH_AM;
+(TimescaleFormat *)HOURS_HHMM_AM;
+(TimescaleFormat *)HOURS_HH_AM;
+(TimescaleFormat *)HOURS_HH;
+(TimescaleFormat *)HOURS_HOUR_1_START;
+(TimescaleFormat *)HOURS_H1_START;
+(TimescaleFormat *)HOURS_1_START;
+(TimescaleFormat *)HOURS_HOUR_1_END;
+(TimescaleFormat *)HOURS_H1_END;
+(TimescaleFormat *)HOURS_1_END;
+(TimescaleFormat *)MINUTES_HHMM_AM;
+(TimescaleFormat *)MINUTES_MM;
+(TimescaleFormat *)MINUTES_MINUTE_1_START;
+(TimescaleFormat *)MINUTES_M1_START;
+(TimescaleFormat *)MINUTES_1_START;
+(TimescaleFormat *)MINUTES_MINUTE_1_END;
+(TimescaleFormat *)MINUTES_M1_END;
+(TimescaleFormat *)MINUTES_1_END;

@end
