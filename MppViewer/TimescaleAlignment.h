//
// TimescaleAlignment.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface TimescaleAlignment : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(TimescaleAlignment *)getInstance:(int)type;

+(TimescaleAlignment *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)getName;

-(NSString *)toString;

+(TimescaleAlignment *)LEFT;
+(TimescaleAlignment *)CENTER;
+(TimescaleAlignment *)RIGHT;

@end
