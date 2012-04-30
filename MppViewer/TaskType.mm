//
//  TaskType.m
//  MppViewer
//
//  Created by Fernando Araya on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TaskType.h"
#import "NumberUtility.h"

@implementation TaskType

static TaskType *_FIXED_UNITS = nil;
static TaskType *_FIXED_DURATION = nil;
static TaskType *_FIXED_WORK = nil;
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

+(TaskType *)getInstance:(int)type
{
    if (type < 0 || type >= [[TaskType TYPE_VALUES] count])
    {
        type = [[TaskType FIXED_WORK] getValue];
    }
    return [[TaskType TYPE_VALUES] objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(TaskType *)getInstanceWithNumber:(NSNumber *)type
{
    int value;
    if(type == nil)
    {
        value = -1;
    }
    else
    {
        value = [NumberUtility getInt:type];
    }
    return [self getInstance:value];
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

+(TaskType *)FIXED_UNITS
{
    if(_FIXED_UNITS == nil)
    {
        _FIXED_UNITS = [[TaskType alloc] init:0];
    }
    return _FIXED_UNITS;
}

+(TaskType *)FIXED_DURATION
{
    if(_FIXED_DURATION == nil)
    {
        _FIXED_DURATION = [[TaskType alloc] init:1];
    }
    return _FIXED_DURATION;
}

+(TaskType *)FIXED_WORK
{
    if(_FIXED_WORK == nil)
    {
        _FIXED_WORK = [[TaskType alloc] init:2];
    }
    return _FIXED_WORK;
}

+(NSMutableArray *)TYPE_VALUES
{
    if(_TYPE_VALUES == nil)
    {
        _TYPE_VALUES = [[NSMutableArray alloc]initWithObjects:[TaskType FIXED_UNITS] , [TaskType FIXED_DURATION], [TaskType FIXED_WORK], nil];
    }
    return _TYPE_VALUES;
}

@end
