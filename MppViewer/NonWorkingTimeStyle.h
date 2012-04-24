//
// NonWorkingTimeStyle.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface NonWorkingTimeStyle : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(NonWorkingTimeStyle *)getInstance:(int)type;

+(NonWorkingTimeStyle *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)getName;

-(NSString *)toString;

+(NonWorkingTimeStyle *)BEHIND;
+(NonWorkingTimeStyle *)IN_FRONT;
+(NonWorkingTimeStyle *)DO_NOT_DRAW;

@end
