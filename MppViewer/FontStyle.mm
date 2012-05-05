//
//  FontStyle.m
//  MppViewer
//
//  Created by Julián! on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FontStyle.h"
#import "FontBase.h"
#import "BackgroundPattern.h"

@implementation FontStyle

/**
 * Constructor.
 *
 * @param fontBase font base instance
 * @param italic italic flag
 * @param bold bold flag
 * @param underline underline flag
 * @param strikethrough strikethrough flag
 * @param color color type
 * @param backgroundColor background color
 * @param backgroundPattern background pattern
 */

-(id)init:(FontBase *)fontBase isItalic:(Boolean)italic isBold:(Boolean)bold isUnderline:(Boolean)underline isStrikethrough:(Boolean)strikethrough withColor:(UIColor *)color withBackgroundColor:(UIColor *)backgroundColor withBackgroundPattern:(BackgroundPattern *)backgroundPattern
{
    self = [super init];
    if (self) 
    {
        _fontBase = fontBase;
        _italic = italic;
        _bold = bold;
        _underline = underline;
        _strikethrough = strikethrough;
        _color = color;
        _backgroundColor = backgroundColor;
        _backgroundPattern = backgroundPattern;
    }
    return self;
}

/**
 * Retrieve the font base instance.
 *
 * @return font base instance
 */

-(FontBase *)getFontBase
{
    return _fontBase;
}

/**
 * Retrieve the bold flag.
 *
 * @return bold flag
 */

-(Boolean)getBold
{
    return _bold;
}

/**
 * Retrieve the font color.
 *
 * @return font color
 */

-(UIColor *)getColor
{
    return _color;
}

/**
 * Retrieve the italic flag.
 *
 * @return italic flag
 */

-(Boolean)getItalic
{
    return _italic;
}

/**
 * Retrieve the underline flag.
 *
 * @return underline flag
 */

-(Boolean)getUnderline
{
    return _underline;
}

/**
 * Retrieve the strikethrough flag.
 *
 * @return strikethrough flag
 */

-(Boolean)getStrikethrough
{
    return _strikethrough;
}

/**
 * Retrieve the background color.
 * 
 * @return background color
 */

-(UIColor *)getBackgroundColor
{
    return _backgroundColor;
}

/**
 * Retrieve the background pattern.
 * 
 * @return background pattern
 */

-(BackgroundPattern *)getBackgroundPattern
{
    return _backgroundPattern;
}

/**
 * {@inheritDoc}
 */

-(NSString *)toString
{
    return [NSString stringWithFormat:@"[FontStyle fontBase=%@ italic=%d bold=%d underline=%d strikethrough=%d color=%@ backgroundColor=%@ backgroundPattern=%@]", [_fontBase toString], _italic, _bold, _underline, _strikethrough, _color, _backgroundColor, [_backgroundPattern toString]];
}

@end
