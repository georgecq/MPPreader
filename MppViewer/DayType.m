//
//  DayType.m
//  mppParser
//
//  Created by George on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DayType.h"

@implementation DayType

static DayType *_NON_WORKING = nil;
static DayType *_WORKING = nil;
static DayType *_DEFAULT = nil;
static NSMutableArray *_TYPE_VALUES = nil;

// Private constructor.
// 
// @param type int version of the enum

-(id)init:(int)type
{
    self= [super init];
    if (self)
    {
        _value = type;
    }
    
    return self;
}

// Retrieve an instance of the enum based on its int value.
//
// @param type int type
// @return enum instance

+(DayType *)getInstance:(int) type
{
    if (type < 0 || type >= [[DayType TYPE_VALUES]count])
    {
        type = [[DayType NON_WORKING]getValue];
    }
    return [[DayType TYPE_VALUES] objectAtIndex:type];
}


// Accessor method used to retrieve the numeric representation of the enum. 
//
// @return int representation of the enum

-(int)getValue
{
    return _value;
}

+(DayType *)NON_WORKING
{
    if (_NON_WORKING == nil)
    {
        _NON_WORKING = [[DayType alloc]init:0];
    }
    return _NON_WORKING;
}

+(DayType *)WORKING
{
    if (_WORKING == nil)
    {
        _WORKING = [[DayType alloc]init:1];
    }
    return _WORKING;
}

+(DayType *)DEFAULT
{
    if (_DEFAULT == nil)
    {
        _DEFAULT = [[DayType alloc]init:2];
    }
    return _DEFAULT;
}

+(NSMutableArray *)TYPE_VALUES
{
    if (_TYPE_VALUES == nil) 
    {
        _TYPE_VALUES = [[NSMutableArray alloc]initWithObjects:[DayType NON_WORKING], [DayType WORKING], [DayType DEFAULT], nil];
    }
    return _TYPE_VALUES;
}

@end
