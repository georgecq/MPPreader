//
// ScheduleFrom.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface ScheduleFrom : NSObject <MpxjEnum>
{
  int _value;
}

+(ScheduleFrom *)getInstance:(int)type;

+(ScheduleFrom *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)toString;

+(ScheduleFrom *)START;
+(ScheduleFrom *)FINISH;

@end
