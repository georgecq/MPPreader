//
//  Pair.m
//  MppViewer
//
//  Created by emilio1 on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Pair.h"

@implementation Pair

/**
 * Constructor.
 *
 * @param first first object
 * @param second second object
 */

-(id)init:(id)first withSecond:(id)second
{
    self = [super init];
    if(self)
    {
        _first = first;
        _second = second;
    }
    return self;
}

/**
 * Retrieve the the first object.
 *
 * @return first object
 */

-(id)getFirst
{
    return _first;
}

/**
 * Retrieve the second object.
 *
 * @return second object
 */

-(id)getSecond
{
    return _second;
}

@end
