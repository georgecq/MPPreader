//
//  Priority.m
//  MppViewer
//
//  Created by emilio1 on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Priority.h"

@implementation Priority

static NSMutableArray *_VALUE = nil;

/**
 * This constructor takes the numeric enumerated representation of a
 * priority and populates the class instance appropriately.
 * Note that unrecognised values are treated as medium priorities.
 *
 * @param priority int representation of the priority
 */

-(id)init:(int)priority
{
    self = [super init];
    if(self)
    {
        if(priority < 0 || priority > [Priority DO_NOT_LEVEL])
        {
            _value = [Priority MEDIUM];
        }
        else
        {
            _value = priority;
        }
    }
    return self;
}

/**
 * This method takes an integer enumeration of a priority
 * and returns an appropriate instance of this class. Note that unrecognised
 * values are treated as medium priority.
 *
 * @param priority int version of the priority
 * @return Priority class instance
 */

+(Priority *)getInstance:(int)priority
{
    Priority *result;
    if(priority >= [Priority LOWEST] && priority <= [Priority DO_NOT_LEVEL] && (priority % 100 == 0))
    {
        result = [[Priority VALUE]objectAtIndex:((priority / 100)-1)];
    }
    else
    {
        result = [[Priority alloc]init:priority];
    }
    return result;
}

/**
 * Accessor method used to retrieve the numeric representation of the
 * priority.
 *
 * @return int representation of the priority
 */

-(int)getValue
{
    return _value;
}

+(int)LOWEST { return 100; }
+(int)VERY_LOW { return 200; }
+(int)LOWER { return 300; }
+(int)LOW { return 400; }
+(int)MEDIUM { return 500; }
+(int)HIGH { return 600; }
+(int)HIGHER { return 700; }
+(int)VERY_HIGH { return 800; }
+(int)HIGHEST { return 900; }
+(int)DO_NOT_LEVEL { return 1000; }

+(NSMutableArray *)VALUE
{
    if(_VALUE == nil)
    {
        _VALUE = [[NSMutableArray alloc] initWithObjects:[[Priority alloc] init:[Priority LOWEST]], [[Priority alloc] init:[Priority VERY_LOW]], [[Priority alloc] init:[Priority LOWER]], [[Priority alloc] init:[Priority LOW]], [[Priority alloc] init:[Priority MEDIUM]], [[Priority alloc] init:[Priority HIGH]], [[Priority alloc] init:[Priority HIGHER]], [[Priority alloc] init:[Priority VERY_HIGH]], [[Priority alloc] init:[Priority HIGHEST]], [[Priority alloc] init:[Priority DO_NOT_LEVEL]],nil];
    }
    return _VALUE;
}

@end
