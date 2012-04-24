//
//  DataType.m
//  MppViewer
//
//  Created by Fernando Araya on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataType.h"
#import "NumberUtility.h"
#import "EnumUtility.h"

@implementation DataType

static DataType *_STRING = nil;
static DataType *_DATE = nil;
static DataType *_CURRENCY = nil;
static DataType *_BOOLEAN = nil;
static DataType *_NUMERIC = nil;
static DataType *_DURATION = nil;
static DataType *_UNITS = nil;
static DataType *_PERCENTAGE = nil;
static DataType *_ACCRUE = nil;
static DataType *_CONSTRAINT = nil;
static DataType *_RATE = nil;
static DataType *_PRIORITY = nil;
static DataType *_RELATION_LIST = nil;
static DataType *_TASK_TYPE = nil;
static DataType *_RESOURCE_TYPE = nil;
static DataType *_TIME_UNITS = nil;
static DataType *_WORK = nil;
static DataType *_INTEGER = nil;
static DataType *_ASCII_STRING = nil;
static DataType *_SHORT = nil;
static DataType *_BINARY = nil;
static DataType *_DELAY = nil;
static DataType *_WORK_UNITS = nil;
static DataType *_WORKGROUP = nil;
static DataType *_GUID = nil;
static DataType *_RATE_UNITS = nil;
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

+(DataType *)getInstance:(int) type
{
    if (type < 0 || type >= [[DataType TYPE_VALUES]count])
    {
        type = [[DataType STRING]getValue];
    }
    return [[DataType TYPE_VALUES] objectAtIndex:type];
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(DataType *)getinstanceWithNumber:(NSNumber *)type
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

// Accessor method used to retrieve the numeric representation of the enum. 
//
// @return int representation of the enum

-(int)getValue
{
    return _value;
}

+(DataType *)STRING
{
    if (_STRING == nil)
    {
        _STRING = [[DataType alloc]init:1];
    }
    return _STRING;
}

+(DataType *)DATE
{
    if (_DATE == nil)
    {
        _DATE= [[DataType alloc]init:2];
    }
    return _DATE;
}

+(DataType *)CURRENCY
{
    if (_CURRENCY == nil)
    {
        _CURRENCY = [[DataType alloc]init:3];
    }
    return _CURRENCY;
}

+(DataType *)BOOLEAN
{
    if (_BOOLEAN == nil)
    {
        _BOOLEAN = [[DataType alloc]init:4];
    }
    return _BOOLEAN;
}

+(DataType *)NUMERIC
{
    if (_NUMERIC == nil)
    {
        _NUMERIC = [[DataType alloc]init:5];
    }
    return _NUMERIC;
}

+(DataType *)DURATION
{
    if (_DURATION == nil)
    {
        _DURATION = [[DataType alloc]init:6];
    }
    return _DURATION;
}

+(DataType *)UNITS
{
    if (_UNITS == nil)
    {
        _UNITS = [[DataType alloc]init:7];
    }
    return _UNITS;
}

+(DataType *)PERCENTAGE
{
    if (_PERCENTAGE == nil)
    {
        _PERCENTAGE = [[DataType alloc]init:8];
    }
    return _PERCENTAGE;
}

+(DataType *)ACCRUE
{
    if (_ACCRUE == nil)
    {
        _ACCRUE = [[DataType alloc]init:9];
    }
    return _ACCRUE;
}

+(DataType *)CONSTRAINT
{
    if (_CONSTRAINT == nil)
    {
        _CONSTRAINT = [[DataType alloc]init:10];
    }
    return _CONSTRAINT;
}

+(DataType *)RATE
{
    if (_RATE == nil)
    {
        _RATE = [[DataType alloc]init:11];
    }
    return _RATE;
}

+(DataType *)PRIORITY
{
    if (_PRIORITY == nil)
    {
        _PRIORITY = [[DataType alloc]init:12];
    }
    return _PRIORITY;
}

+(DataType *)RELATION_LIST
{
    if (_RELATION_LIST == nil)
    {
        _RELATION_LIST = [[DataType alloc]init:13];
    }
    return _RELATION_LIST;
}

+(DataType *)TASK_TYPE
{
    if (_TASK_TYPE == nil)
    {
        _TASK_TYPE = [[DataType alloc]init:14];
    }
    return _TASK_TYPE;
}

+(DataType *)RESOURCE_TYPE
{
    if (_RESOURCE_TYPE == nil)
    {
        _RESOURCE_TYPE = [[DataType alloc]init:15];
    }
    return _RESOURCE_TYPE;
}

+(DataType *)TIME_UNITS
{
    if (_TIME_UNITS == nil)
    {
        _TIME_UNITS = [[DataType alloc]init:15];
    }
    return _TIME_UNITS;
}

+(DataType *)WORK
{
    if (_WORK == nil)
    {
        _WORK = [[DataType alloc]init:16];
    }
    return _WORK;
}

+(DataType *)INTEGER
{
    if (_INTEGER == nil)
    {
        _INTEGER = [[DataType alloc]init:17];
    }
    return _INTEGER;
}

+(DataType *)ASCII_STRING
{
    if (_ASCII_STRING == nil)
    {
        _ASCII_STRING = [[DataType alloc]init:18];
    }
    return _ASCII_STRING;
}

+(DataType *)SHORT
{
    if (_SHORT == nil)
    {
        _SHORT = [[DataType alloc]init:19];
    }
    return _SHORT;
}

+(DataType *)BINARY
{
    if (_BINARY == nil)
    {
        _BINARY = [[DataType alloc]init:20];
    }
    return _BINARY;
}

+(DataType *)DELAY
{
    if (_DELAY == nil)
    {
        _DELAY = [[DataType alloc]init:21];
    }
    return _DELAY;
}

+(DataType *)WORK_UNITS
{
    if (_WORK_UNITS == nil)
    {
        _WORK_UNITS = [[DataType alloc]init:22];
    }
    return _WORK_UNITS;
}

+(DataType *)WORKGROUP
{
    if (_WORKGROUP == nil)
    {
        _WORKGROUP = [[DataType alloc]init:23];
    }
    return _WORKGROUP;
}

+(DataType *)GUID
{
    if (_GUID == nil)
    {
        _GUID = [[DataType alloc]init:24];
    }
    return _GUID;
}

+(DataType *)RATE_UNITS
{
    if (_RATE_UNITS == nil)
    {
        _RATE_UNITS = [[DataType alloc]init:25];
    }
    return _RATE_UNITS;
}

+(NSMutableArray *)TYPE_VALUES
{
    if (_TYPE_VALUES == nil) 
    {
        NSMutableArray *temp = [[NSMutableArray alloc]initWithObjects:[DataType STRING],[DataType DATE],[DataType CURRENCY],[DataType BOOLEAN],[DataType NUMERIC],[DataType DURATION],[DataType UNITS],[DataType PERCENTAGE],[DataType ACCRUE],[DataType CONSTRAINT],[DataType RATE],[DataType PRIORITY],[DataType RELATION_LIST],[DataType TASK_TYPE],[DataType RESOURCE_TYPE],[DataType TIME_UNITS],[DataType WORK],[DataType INTEGER],[DataType ASCII_STRING],[DataType SHORT],[DataType BINARY],[DataType DELAY],[DataType WORK_UNITS],[DataType WORKGROUP],[DataType GUID],[DataType RATE_UNITS], nil];
        
        _TYPE_VALUES = [EnumUtility createTypeArray:temp withOffSet:1];
    }
    return _TYPE_VALUES;
}

@end
