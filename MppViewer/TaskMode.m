//
//  TaskMode.m
//  MppViewer
//
//  Created by Fernando Araya on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TaskMode.h"

@implementation TaskMode

static TaskMode *_MANUALLY_SCHEDULED = nil;
static TaskMode *_AUTO_SCHEDULED = nil;
static NSMutableArray *_TYPE_VALUES = nil;

/**
 * Private constructor.
 * 
 * @param type int version of the enum
 */

-(id)init:(int)type
{
    self = [super init];
    if (self)
    {
        _value = type;
    }
    
    return self;
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(TaskMode *)getInstance:(int)type
{
    if (type < 0 || type >= [[TaskMode TYPE_VALUES] count])
    {
        type = [[TaskMode AUTO_SCHEDULED] getValue];
    }
    return [[TaskMode TYPE_VALUES] objectAtIndex:type];
}

/**
 * Accessor method used to retrieve the numeric representation of the enum. 
 *
 * @return int representation of the enum
 */

-(int)getValue
{
    return _value;
}

+(TaskMode *)MANUALLY_SCHEDULED
{
    if(_MANUALLY_SCHEDULED == nil)
    {
        _MANUALLY_SCHEDULED = [[TaskMode alloc] init:0];
    }
    return _MANUALLY_SCHEDULED;
}

+(TaskMode *)AUTO_SCHEDULED
{
    if(_AUTO_SCHEDULED == nil)
    {
        _AUTO_SCHEDULED = [[TaskMode alloc] init:1];
    }
    return _AUTO_SCHEDULED;
}

+(NSMutableArray *)TYPE_VALUES
{
    if (_TYPE_VALUES == nil) 
    {
        _TYPE_VALUES = [[NSMutableArray alloc]initWithObjects:[TaskMode MANUALLY_SCHEDULED], [TaskMode AUTO_SCHEDULED],nil];
    }
    return _TYPE_VALUES;
}

@end
