//
// BackgroundPattern.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface BackgroundPattern : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(BackgroundPattern *)getInstance:(int)type;

-(NSString *)getName;

-(NSString *)toString;

+(BackgroundPattern *)TRANSPARENT;
+(BackgroundPattern *)SOLID;
+(BackgroundPattern *)LIGHTDOTTED;
+(BackgroundPattern *)DOTTED;
+(BackgroundPattern *)HEAVYDOTTED;
+(BackgroundPattern *)BACKSLASH;
+(BackgroundPattern *)FORWARDSLASH;
+(BackgroundPattern *)INVERSEBACKSLASH;
+(BackgroundPattern *)INVERSEFORWARDSLASH;
+(BackgroundPattern *)LIGHTVERTICALSTRIPE;
+(BackgroundPattern *)HEAVYVERTICALSTRIPE;
+(BackgroundPattern *)CHECKERED;
+(BackgroundPattern *)DENSEFORWARDSLASH;
+(BackgroundPattern *)INVERSECHECKERED;

@end
