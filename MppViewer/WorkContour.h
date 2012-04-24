//
// WorkContour.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface WorkContour : NSObject <MpxjEnum>
{
    int _value;
}

+(WorkContour *)getInstance:(int)type;

+(WorkContour *)getInstanceWithNumber:(NSNumber *)type;

+(WorkContour *)FLAT;
+(WorkContour *)BACK_LOADED;
+(WorkContour *)FRONT_LOADED;
+(WorkContour *)DOUBLE_PEAK;
+(WorkContour *)EARLY_PEAK;
+(WorkContour *)LATE_PEAK;
+(WorkContour *)BELL;
+(WorkContour *)TURTLE;
+(WorkContour *)CONTOURED;

@end
