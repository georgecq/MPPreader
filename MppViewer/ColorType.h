//
// ColorType.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface ColorType : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
    UIColor *_color;
}

+(ColorType *)getInstance:(int)type;

+(ColorType *)getinstanceWithNumber:(NSNumber *)type;

-(NSString *)getName;

-(UIColor *)getColor;

+(ColorType *)BLACK;
+(ColorType *)RED;
+(ColorType *)YELLOW;
+(ColorType *)LIME;
+(ColorType *)AQUA;
+(ColorType *)BLUE;
+(ColorType *)FUSCHIA;
+(ColorType *)WHITE;
+(ColorType *)MAROON;
+(ColorType *)GREEN;
+(ColorType *)OLIVE;
+(ColorType *)NAVY;
+(ColorType *)PURPLE;
+(ColorType *)TEAL;
+(ColorType *)GRAY;
+(ColorType *)SILVER;
+(ColorType *)AUTOMATIC;

@end
