//
// ChartPattern.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface ChartPattern : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(ChartPattern *)getInstance:(int)type;

+(ChartPattern *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)getName;

-(NSString *)toString;

+(ChartPattern *)TRANSPARENT;
+(ChartPattern *)SOLID;
+(ChartPattern *)LIGHTDOTTED;
+(ChartPattern *)DOTTED;
+(ChartPattern *)HEAVYDOTTED;
+(ChartPattern *)BACKSLASH;
+(ChartPattern *)FORWARDSLASH;
+(ChartPattern *)CHECKERED;
+(ChartPattern *)VERTICALSTRIPE;
+(ChartPattern *)HORIZONTALSTRIPE;
+(ChartPattern *)GRID;
+(ChartPattern *)SOLIDHAIRY;

@end
