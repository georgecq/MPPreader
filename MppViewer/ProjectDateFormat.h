//
// ProjectDateFormat.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface ProjectDateFormat : NSObject <MpxjEnum>
{
    int _value;
}

+(ProjectDateFormat *)getInstance:(int)type;

+(ProjectDateFormat *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)toString;

+(ProjectDateFormat *)DD_MM_YY_HH_MM;
+(ProjectDateFormat *)DD_MM_YY;
+(ProjectDateFormat *)DD_MMMMM_YYYY_HH_MM;
+(ProjectDateFormat *)DD_MMMMM_YYYY;
+(ProjectDateFormat *)DD_MMM_HH_MM;
+(ProjectDateFormat *)DD_MMM_YY;
+(ProjectDateFormat *)DD_MMMMM;
+(ProjectDateFormat *)DD_MMM;
+(ProjectDateFormat *)EEE_DD_MM_YY_HH_MM;
+(ProjectDateFormat *)EEE_DD_MM_YY;
+(ProjectDateFormat *)EEE_DD_MMM_YY;
+(ProjectDateFormat *)EEE_HH_MM;
+(ProjectDateFormat *)DD_MM;
+(ProjectDateFormat *)DD;
+(ProjectDateFormat *)HH_MM;
+(ProjectDateFormat *)EEE_DD_MMM;
+(ProjectDateFormat *)EEE_DD_MM;
+(ProjectDateFormat *)EEE_DD;
+(ProjectDateFormat *)DD_WWW;
+(ProjectDateFormat *)DD_WWW_YY_HH_MM;
+(ProjectDateFormat *)DD_MM_YYYY;

@end
