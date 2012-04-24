//
// GanttBarDateFormat.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface GanttBarDateFormat : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(GanttBarDateFormat *)getInstance:(int)type;

+(GanttBarDateFormat *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)getName;

-(NSString *)toString;

+(GanttBarDateFormat *)DEFAULT;
+(GanttBarDateFormat *)DDMMYY_MMSS;
+(GanttBarDateFormat *)DDMMYY;
+(GanttBarDateFormat *)DDMMYYYY;
+(GanttBarDateFormat *)DD_MMMM_YYYY_HHMM;
+(GanttBarDateFormat *)DD_MMMM_YYYY;
+(GanttBarDateFormat *)DD_MMM_HHMM;
+(GanttBarDateFormat *)DD_MMM_YY;
+(GanttBarDateFormat *)DD_MMMM;
+(GanttBarDateFormat *)DD_MMM;
+(GanttBarDateFormat *)DDD_DDMMYY_HHMM;
+(GanttBarDateFormat *)DDD_DDMMYY;
+(GanttBarDateFormat *)DDD_DD_MMM_YY;
+(GanttBarDateFormat *)DDD_HHMM;
+(GanttBarDateFormat *)DDD_DD_MMM;
+(GanttBarDateFormat *)DDD_DDMM;
+(GanttBarDateFormat *)DDD_DD;
+(GanttBarDateFormat *)DDMM;
+(GanttBarDateFormat *)DD;
+(GanttBarDateFormat *)HHMM;
+(GanttBarDateFormat *)MWW;
+(GanttBarDateFormat *)MWWYY_HHMM;

@end
