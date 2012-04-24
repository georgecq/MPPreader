//
// EarnedValueMethod.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface EarnedValueMethod : NSObject <MpxjEnum>
{
    int _value;
}

+(EarnedValueMethod *)getInstance:(int)type;

+(EarnedValueMethod *)getInstanceWithNumber:(NSNumber *)type;

+(EarnedValueMethod *)PERCENT_COMPLETE;
+(EarnedValueMethod *)PHYSICAL_PERCENT_COMPLETE;

@end
