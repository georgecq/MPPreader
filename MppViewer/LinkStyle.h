//
// LinkStyle.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface LinkStyle : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(LinkStyle *)getInstance:(int)type;

+(LinkStyle *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)getName;

-(NSString *)toString;

+(LinkStyle *)NONE;
+(LinkStyle *)END_TOP;
+(LinkStyle *)END_START;

@end
