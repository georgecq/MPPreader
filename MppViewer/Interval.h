//
// Interval.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface Interval : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(Interval *)getInstance:(int)type;

+(Interval *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)getName;

-(NSString *)toString;

+(Interval *)DAILY;
+(Interval *)WEEKLY;
+(Interval *)MONTHLY;

@end
