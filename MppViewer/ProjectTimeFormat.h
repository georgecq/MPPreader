//
// ProjectTimeFormat.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface ProjectTimeFormat : NSObject <MpxjEnum>
{
    int _value;
}

+(ProjectTimeFormat *)getInstance:(int)type;

+(ProjectTimeFormat *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)toString;

+(ProjectTimeFormat *)TWELVE_HOUR;
+(ProjectTimeFormat *)TWENTY_FOUR_HOUR;

@end
