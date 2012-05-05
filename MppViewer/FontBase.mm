//
//  FontBase.m
//  MppViewer
//
//  Created by Julián! on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FontBase.h"

@implementation FontBase

/**
 * Constructor.
 *
 * @param index index number for this font
 * @param name font name
 * @param size font size
 */

-(id)init:(NSNumber *)index withName:(NSString *)name withSize:(int)size
{
    self = [super init];
    if (self) 
    {
        _index = index;
        _name = name;
        _size = size;
    }
    
    return self;
}

/**
 * Retrieve the font name.
 *
 * @return font name
 */

-(NSString *)getName
{
    return _name;
}

/**
 * Retrieve the font size.
 *
 * @return font size
 */

-(int)getSize
{
    return _size;
}

/**
 * Retrieve the index number associated with this base font.
 *
 * @return index number
 */

-(NSNumber *)getIndex
{
    return _index;
}

/**
 * {@inheritDoc}
 */

-(NSString *)toString
{
    return [NSString stringWithFormat:@"[FontBase name=%@ size=%d]", _name, _size];
}

@end
