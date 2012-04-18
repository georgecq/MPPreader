//
//  RelationType.m
//  MppViewer
//
//  Created by Fernando Araya on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RelationType.h"

@implementation RelationType

static RelationType *_FINISH_FINISH = nil;
static RelationType *_FINISH_START = nil;
static RelationType *_START_FINISH = nil;
static RelationType *_START_START = nil;
static NSMutableArray *_TYPE_VALUES = nil;

/**
 * Private constructor.
 * 
 * @param type int version of the enum
 * @param name enum name
 */

-(id)init:(int)type withName:(NSString *)name
{
    self = [super init];
    if(self)
    {
        _value = type;
        _name = name;
    }
    return self;
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(RelationType *)getInstance:(int)type
{
    if (type < 0 || type >= [[RelationType TYPE_VALUES] count])
    {
        type = [[RelationType FINISH_START] getValue];
    }
    return [[RelationType TYPE_VALUES] objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(RelationType *)getInstanceWithNumber:(NSNumber *)type
{
    int value;
    if(type == nil)
    {
        value = -1;
    }
    else
    {
        value = [type intValue];
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

/**
 * {@inheritDoc}
 */

-(NSString *)toString
{
    return _name;
}

+(RelationType *)FINISH_FINISH
{
    if(_FINISH_FINISH == nil)
    {
        _FINISH_FINISH = [[RelationType alloc] init:0 withName:@"FF"];
    }
    return _FINISH_FINISH;
}

+(RelationType *)FINISH_START
{
    if(_FINISH_START == nil)
    {
        _FINISH_START = [[RelationType alloc] init:1 withName:@"FS"];
    }
    return _FINISH_START;
}

+(RelationType *)START_FINISH
{
    if(_START_FINISH == nil)
    {
        _START_FINISH = [[RelationType alloc] init:2 withName:@"SF"];
    }
    return _START_FINISH;
}

+(RelationType *)START_START
{
    if(_START_START == nil)
    {
        _START_START = [[RelationType alloc] init:3 withName:@"SS"];
    }
    return _START_START;
}

+(NSMutableArray *)TYPE_VALUES
{
    if(_TYPE_VALUES == nil)
    {
        _TYPE_VALUES = [[NSMutableArray alloc] initWithObjects:[RelationType FINISH_FINISH], [RelationType FINISH_START], [RelationType START_FINISH], [RelationType START_START], nil];
    }
    return _TYPE_VALUES;
}

@end
