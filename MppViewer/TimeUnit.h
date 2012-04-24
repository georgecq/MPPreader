//
//  TimeUnit.h
//  MppViewer
//
//  Created by Fernando Araya on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface TimeUnit : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

-(id)init:(int)type withName:(NSString *)name;

-(NSString *)getName;

-(NSString *)toString;

+(TimeUnit *)getInstance:(int) type;

+(TimeUnit *)getInstanceWithNumber:(NSNumber *) type;

+(TimeUnit *)MINUTES;
+(TimeUnit *)HOURS;
+(TimeUnit *)DAYS;
+(TimeUnit *)WEEKS;
+(TimeUnit *)MONTHS;
+(TimeUnit *)PERCENT;
+(TimeUnit *)YEARS;
+(TimeUnit *)ELAPSED_MINUTES;
+(TimeUnit *)ELAPSED_HOURS;
+(TimeUnit *)ELAPSED_DAYS;
+(TimeUnit *)ELAPSED_WEEKS;
+(TimeUnit *)ELAPSED_MONTHS;
+(TimeUnit *)ELAPSED_YEARS;
+(TimeUnit *)ELAPSED_PERCENT;

@end
