//
//  BooleanUtility.m
//  MppViewer
//
//  Created by Julián! on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BooleanUtility.h"

@implementation BooleanUtility

/**
 * Retrieve a boolean value from a Boolean object. Handles null values.
 *
 * @param value Boolean instance
 * @return boolean value
 */

+(Boolean)getBoolean:(NSNumber *)value
{
    return value == nil ? false : [value boolValue];
}

@end
