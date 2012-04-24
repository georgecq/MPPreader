//
// LineStyle.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface LineStyle : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(LineStyle *)getInstance:(int)type;

+(LineStyle *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)getName;

-(NSString *)toString;

+(LineStyle *)NONE;
+(LineStyle *)SOLID;
+(LineStyle *)DOTTED1;
+(LineStyle *)DOTTED2;
+(LineStyle *)DASHED;

@end
