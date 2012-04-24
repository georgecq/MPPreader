//
// TimescaleUnits.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface TimescaleUnits : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(TimescaleUnits *)getInstance:(int)type;

+(TimescaleUnits *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)getName;

-(NSString *)toString;

+(TimescaleUnits *)NONE;
+(TimescaleUnits *)MINUTES;
+(TimescaleUnits *)HOURS;
+(TimescaleUnits *)DAYS;
+(TimescaleUnits *)WEEKS;
+(TimescaleUnits *)THIRDS_OF_MONTHS;
+(TimescaleUnits *)MONTHS;
+(TimescaleUnits *)QUARTERS;
+(TimescaleUnits *)HALF_YEARS;
+(TimescaleUnits *)YEARS;

@end
