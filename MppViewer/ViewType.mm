//
// ViewType.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewType.h"
#import "NumberUtility.h"
#import "EnumUtility.h"

@implementation ViewType

static ViewType *_UNKNOWN = nil;
static ViewType *_GANTT_CHART = nil;
static ViewType *_NETWORK_DIAGRAM = nil;
static ViewType *_RELATIONSHIP_DIAGRAM = nil;
static ViewType *_TASK_FORM = nil;
static ViewType *_TASK_SHEET = nil;
static ViewType *_RESOURCE_FORM = nil;
static ViewType *_RESOURCE_SHEET = nil;
static ViewType *_RESOURCE_GRAPH = nil;
static ViewType *_TASK_DETAILS_FORM = nil;
static ViewType *_TASK_NAME_FORM = nil;
static ViewType *_RESOURCE_NAME_FORM = nil;
static ViewType *_CALENDAR = nil;
static ViewType *_TASK_USAGE = nil;
static ViewType *_RESOURCE_USAGE = nil;
static NSMutableArray *_TYPE_VALUES = nil;

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

+(ViewType *)getInstance:(int)type
{
    
    if(type < 0 || type >= [[ViewType TYPE_VALUES]count])
    {
        type = [[ViewType UNKNOWN]getValue];
    }
    ViewType *result = [[ViewType TYPE_VALUES]objectAtIndex:type];
    if (result == nil) 
    {
        result = [ViewType UNKNOWN];
    }
    return result;
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(ViewType *)getInstanceWithNumber:(NSNumber *)type
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

/**
 * Retrieve the name of this alignment. Note that this is not
 * localised.
 *
 * @return name of this alignment type
 */

-(NSString *)getName
{   
    return _name;
}

/**
 * Generate a string representation of this instance.
 *
 * @return string representation of this instance
 */

-(NSString *)toString
{
    return [self getName];
}

+(ViewType *)UNKNOWN
{
  if(_UNKNOWN == nil)
  {
      _UNKNOWN = [[ViewType alloc] init:0  withName:@"UNKNOWN"];
  }
  return _UNKNOWN;
}

+(ViewType *)GANTT_CHART
{
  if(_GANTT_CHART == nil)
  {
      _GANTT_CHART = [[ViewType alloc] init:1  withName:@"GANTT_CHART"];
  }
  return _GANTT_CHART;
}

+(ViewType *)NETWORK_DIAGRAM
{
  if(_NETWORK_DIAGRAM == nil)
  {
      _NETWORK_DIAGRAM = [[ViewType alloc] init:2  withName:@"NETWORK_DIAGRAM"];
  }
  return _NETWORK_DIAGRAM;
}

+(ViewType *)RELATIONSHIP_DIAGRAM
{
  if(_RELATIONSHIP_DIAGRAM == nil)
  {
      _RELATIONSHIP_DIAGRAM = [[ViewType alloc] init:3  withName:@"RELATIONSHIP_DIAGRAM"];
  }
  return _RELATIONSHIP_DIAGRAM;
}

+(ViewType *)TASK_FORM
{
  if(_TASK_FORM == nil)
  {
      _TASK_FORM = [[ViewType alloc] init:4  withName:@"TASK_FORM"];
  }
  return _TASK_FORM;
}

+(ViewType *)TASK_SHEET
{
  if(_TASK_SHEET == nil)
  {
      _TASK_SHEET = [[ViewType alloc] init:5  withName:@"TASK_SHEET"];
  }
  return _TASK_SHEET;
}

+(ViewType *)RESOURCE_FORM
{
  if(_RESOURCE_FORM == nil)
  {
      _RESOURCE_FORM = [[ViewType alloc] init:6  withName:@"RESOURCE_FORM"];
  }
  return _RESOURCE_FORM;
}

+(ViewType *)RESOURCE_SHEET
{
  if(_RESOURCE_SHEET == nil)
  {
      _RESOURCE_SHEET = [[ViewType alloc] init:7  withName:@"RESOURCE_SHEET"];
  }
  return _RESOURCE_SHEET;
}

+(ViewType *)RESOURCE_GRAPH
{
  if(_RESOURCE_GRAPH == nil)
  {
      _RESOURCE_GRAPH = [[ViewType alloc] init:8  withName:@"RESOURCE_GRAPH"];
  }
  return _RESOURCE_GRAPH;
}

+(ViewType *)TASK_DETAILS_FORM
{
  if(_TASK_DETAILS_FORM == nil)
  {
      _TASK_DETAILS_FORM = [[ViewType alloc] init:10  withName:@"TASK_DETAILS_FORM"];
  }
  return _TASK_DETAILS_FORM;
}

+(ViewType *)TASK_NAME_FORM
{
  if(_TASK_NAME_FORM == nil)
  {
      _TASK_NAME_FORM = [[ViewType alloc] init:11  withName:@"TASK_NAME_FORM"];
  }
  return _TASK_NAME_FORM;
}

+(ViewType *)RESOURCE_NAME_FORM
{
  if(_RESOURCE_NAME_FORM == nil)
  {
      _RESOURCE_NAME_FORM = [[ViewType alloc] init:12  withName:@"RESOURCE_NAME_FORM"];
  }
  return _RESOURCE_NAME_FORM;
}

+(ViewType *)CALENDAR
{
  if(_CALENDAR == nil)
  {
      _CALENDAR = [[ViewType alloc] init:13  withName:@"CALENDAR"];
  }
  return _CALENDAR;
}

+(ViewType *)TASK_USAGE
{
  if(_TASK_USAGE == nil)
  {
      _TASK_USAGE = [[ViewType alloc] init:14  withName:@"TASK_USAGE"];
  }
  return _TASK_USAGE;
}

+(ViewType *)RESOURCE_USAGE
{
  if(_RESOURCE_USAGE == nil)
  {
      _RESOURCE_USAGE = [[ViewType alloc] init:15  withName:@"RESOURCE_USAGE"];
  }
  return _RESOURCE_USAGE;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      NSMutableArray *temp = [[NSMutableArray alloc] initWithObjects:[ViewType UNKNOWN], [ViewType GANTT_CHART], [ViewType NETWORK_DIAGRAM], [ViewType RELATIONSHIP_DIAGRAM], [ViewType TASK_FORM], [ViewType TASK_SHEET], [ViewType RESOURCE_FORM], [ViewType RESOURCE_SHEET], [ViewType RESOURCE_GRAPH], [ViewType TASK_DETAILS_FORM], [ViewType TASK_NAME_FORM], [ViewType RESOURCE_NAME_FORM], [ViewType CALENDAR], [ViewType TASK_USAGE], [ViewType RESOURCE_USAGE],  nil];
      
      _TYPE_VALUES = [EnumUtility createTypeArray:temp withOffSet:1];
  }
  return _TYPE_VALUES;
}

@end
