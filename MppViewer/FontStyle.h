//
//  FontStyle.h
//  MppViewer
//
//  Created by Julián! on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FontBase;
@class BackgroundPattern;

@interface FontStyle : NSObject
{
    FontBase *_fontBase;
    Boolean _italic;
    Boolean _bold;
    Boolean _underline;
    Boolean _strikethrough;
    UIColor *_color;
    UIColor *_backgroundColor;
    BackgroundPattern *_backgroundPattern;
}

-(id)init:(FontBase *)fontBase isItalic:(Boolean)italic isBold:(Boolean)bold isUnderline:(Boolean)underline isStrikethrough:(Boolean)strikethrough withColor:(UIColor *)color withBackgroundColor:(UIColor *)backgroundColor withBackgroundPattern:(BackgroundPattern *)backgroundPattern;

-(FontBase *)getFontBase;

-(Boolean)getBold;

-(UIColor *)getColor;

-(Boolean)getItalic;

-(Boolean)getUnderline;

-(Boolean)getStrikethrough;

-(UIColor *)getBackgroundColor;

-(BackgroundPattern *)getBackgroundPattern;

-(NSString *)toString;

@end
