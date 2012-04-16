//
//  RecurrenceType.m
//  MppViewer
//
//  Created by Fernando Araya on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RecurrenceType.h"

@implementation RecurrenceType

static RecurrenceType *_DAILY = nil;
static RecurrenceType *_WEEKLY = nil;
static RecurrenceType *_MONTLY = nil;
static RecurrenceType *_YEARLY = nil;
static NSMutableArray *_TYPE_VALUES = nil;

/**
 * Private constructor.
 * 
 * @param type int version of the enum
 * @param name English name used for debugging
 */

-(id)init:(int)type withName:(NSString *)name
{
    self= [super init];
    if (self)
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

+(RecurrenceType *)getInstance:(int)type
{
    if (type < 1 || type >= [[RecurrenceType TYPE_VALUES]count])
    {
        type = [[RecurrenceType DAILY]getValue];
    }
    return [[RecurrenceType TYPE_VALUES] objectAtIndex:type];
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

+(RecurrenceType *)DAILY
{
    if (_DAILY == nil)
    {
        _DAILY = [[RecurrenceType alloc]init:1 withName:@"Daily"];
    }
    return _DAILY;
}

+(RecurrenceType *)WEEKLY
{
    if (_WEEKLY == nil)
    {
        _WEEKLY = [[RecurrenceType alloc]init:4 withName:@"Weekly"];
    }
    return _WEEKLY
    ;
}

+(RecurrenceType *)MONTLY
{
    if (_MONTLY == nil)
    {
        _MONTLY = [[RecurrenceType alloc]init:8 withName:@"Monthly"];
    }
    return _MONTLY;
}

+(RecurrenceType *)YEARLY
{
    if (_YEARLY == nil)
    {
        _YEARLY = [[RecurrenceType alloc]init:16 withName:@"Yearly"];
    }
    return _YEARLY;
}

+(NSMutableArray *)TYPE_VALUES
{
    if (_TYPE_VALUES == nil) 
    {
        _TYPE_VALUES = [[NSMutableArray alloc]initWithObjects:[RecurrenceType DAILY],[RecurrenceType WEEKLY],[RecurrenceType MONTLY],[RecurrenceType YEARLY], nil];
    }
    return _TYPE_VALUES;
}

@end
