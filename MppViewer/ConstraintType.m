//
//  ConstraintType.m
//  MppViewer
//
//  Created by Fernando Araya on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConstraintType.h"
#import "NumberUtility.h"

@implementation ConstraintType

static ConstraintType *_AS_SOON_AS_POSSIBLE = nil;
static ConstraintType *_AS_LATE_AS_POSSIBLE = nil;
static ConstraintType *_MUST_START_ON = nil;
static ConstraintType *_MUST_FINISH_ON = nil;
static ConstraintType *_START_NO_EARLIER_THAN = nil;
static ConstraintType *_START_NO_LATER_THAN = nil;
static ConstraintType *_FINISH_NO_EARLIER_THAN = nil;
static ConstraintType *_FINISH_NO_LATER_THAN = nil;
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

+(ConstraintType *)getInstance:(int)type
{
    if (type < 0 || type >= [[ConstraintType TYPE_VALUES] count])
    {
        type = [[ConstraintType AS_SOON_AS_POSSIBLE] getValue];
    }
    return [[ConstraintType TYPE_VALUES] objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(ConstraintType *)getInstanceWithNumber:(NSNumber *)type
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
 
+(ConstraintType *)AS_SOON_AS_POSSIBLE
{
    if(_AS_SOON_AS_POSSIBLE == nil)
    {
        _AS_SOON_AS_POSSIBLE = [[ConstraintType alloc] init:0];
    }
    return _AS_SOON_AS_POSSIBLE;
}

+(ConstraintType *)AS_LATE_AS_POSSIBLE
{
    if(_AS_LATE_AS_POSSIBLE == nil)
    {
        _AS_LATE_AS_POSSIBLE = [[ConstraintType alloc] init:1];
    }
    return _AS_LATE_AS_POSSIBLE;
}

+(ConstraintType *)MUST_START_ON
{
    if(_MUST_START_ON == nil)
    {
        _MUST_START_ON = [[ConstraintType alloc] init:2];
    }
    return _MUST_START_ON;
}

+(ConstraintType *)MUST_FINISH_ON
{
    if(_MUST_FINISH_ON == nil)
    {
        _MUST_FINISH_ON = [[ConstraintType alloc] init:3];
    }
    return _MUST_FINISH_ON;
}

+(ConstraintType *)START_NO_EARLIER_THAN
{
    if(_START_NO_EARLIER_THAN == nil)
    {
        _START_NO_EARLIER_THAN = [[ConstraintType alloc] init:4];
    }
    return _START_NO_EARLIER_THAN;
}

+(ConstraintType *)START_NO_LATER_THAN
{
    if(_START_NO_LATER_THAN == nil)
    {
        _START_NO_LATER_THAN = [[ConstraintType alloc] init:5];
    }
    return _START_NO_LATER_THAN;
}

+(ConstraintType *)FINISH_NO_EARLIER_THAN
{
    if(_FINISH_NO_EARLIER_THAN == nil)
    {
        _FINISH_NO_EARLIER_THAN = [[ConstraintType alloc] init:6];
    }
    return _FINISH_NO_EARLIER_THAN;
}

+(ConstraintType *)FINISH_NO_LATER_THAN
{
    if(_FINISH_NO_LATER_THAN == nil)
    {
        _FINISH_NO_LATER_THAN = [[ConstraintType alloc] init:7];
    }
    return _FINISH_NO_LATER_THAN;
}

+(NSMutableArray *)TYPE_VALUES
{
    if (_TYPE_VALUES == nil) 
    {
        _TYPE_VALUES = [[NSMutableArray alloc]initWithObjects:[ConstraintType AS_SOON_AS_POSSIBLE], [ConstraintType AS_LATE_AS_POSSIBLE], [ConstraintType MUST_START_ON], [ConstraintType MUST_FINISH_ON], [ConstraintType START_NO_EARLIER_THAN], [ConstraintType START_NO_LATER_THAN], [ConstraintType FINISH_NO_EARLIER_THAN], [ConstraintType FINISH_NO_LATER_THAN],nil];
    }
    return _TYPE_VALUES;
}

@end
