//
// GanttBarShowForTasks.m
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GanttBarShowForTasks.h"
#import "NumberUtility.h"
#import "EnumUtility.h"

@implementation GanttBarShowForTasks

static GanttBarShowForTasks *_NORMAL = nil;
static GanttBarShowForTasks *_MILESTONE = nil;
static GanttBarShowForTasks *_SUMMARY = nil;
static GanttBarShowForTasks *_CRITICAL = nil;
static GanttBarShowForTasks *_NONCRITICAL = nil;
static GanttBarShowForTasks *_MARKED = nil;
static GanttBarShowForTasks *_FINISHED = nil;
static GanttBarShowForTasks *_INPROGRESS = nil;
static GanttBarShowForTasks *_NOTFINISHED = nil;
static GanttBarShowForTasks *_NOTSTARTED = nil;
static GanttBarShowForTasks *_STARTEDLATE = nil;
static GanttBarShowForTasks *_FINISHEDLATE = nil;
static GanttBarShowForTasks *_STARTEDEARLY = nil;
static GanttBarShowForTasks *_FINISHEDEARLY = nil;
static GanttBarShowForTasks *_STARTEDONTIME = nil;
static GanttBarShowForTasks *_FINISHEDONTIME = nil;
static GanttBarShowForTasks *_FLAG1 = nil;
static GanttBarShowForTasks *_FLAG2 = nil;
static GanttBarShowForTasks *_FLAG3 = nil;
static GanttBarShowForTasks *_FLAG4 = nil;
static GanttBarShowForTasks *_FLAG5 = nil;
static GanttBarShowForTasks *_FLAG6 = nil;
static GanttBarShowForTasks *_FLAG7 = nil;
static GanttBarShowForTasks *_FLAG8 = nil;
static GanttBarShowForTasks *_FLAG9 = nil;
static GanttBarShowForTasks *_FLAG10 = nil;
static GanttBarShowForTasks *_ROLLEDUP = nil;
static GanttBarShowForTasks *_PROJECTSUMMARY = nil;
static GanttBarShowForTasks *_SPLIT = nil;
static GanttBarShowForTasks *_EXTERNAL = nil;
static GanttBarShowForTasks *_FLAG11 = nil;
static GanttBarShowForTasks *_FLAG12 = nil;
static GanttBarShowForTasks *_FLAG13 = nil;
static GanttBarShowForTasks *_FLAG14 = nil;
static GanttBarShowForTasks *_FLAG15 = nil;
static GanttBarShowForTasks *_FLAG16 = nil;
static GanttBarShowForTasks *_FLAG17 = nil;
static GanttBarShowForTasks *_FLAG18 = nil;
static GanttBarShowForTasks *_FLAG19 = nil;
static GanttBarShowForTasks *_FLAG20 = nil;
static GanttBarShowForTasks *_GROUPBYSUMMARY = nil;
static GanttBarShowForTasks *_DELIVERABLE = nil;
static GanttBarShowForTasks *_DEPENDENCY = nil;
static GanttBarShowForTasks *_ACTIVE = nil;
static GanttBarShowForTasks *_MANUALLYSCHEDULED = nil;
static GanttBarShowForTasks *_WARNING = nil;
static GanttBarShowForTasks *_PLACEHOLDERSTART = nil;
static GanttBarShowForTasks *_PLACEHOLDERFINISH = nil;
static GanttBarShowForTasks *_PLACEHOLDERDURATION = nil;
static GanttBarShowForTasks *_PLACEHOLDER = nil;
static GanttBarShowForTasks *_LATE = nil;
static GanttBarShowForTasks *_NOT_NORMAL = nil;
static GanttBarShowForTasks *_NOT_MILESTONE = nil;
static GanttBarShowForTasks *_NOT_SUMMARY = nil;
static GanttBarShowForTasks *_NOT_CRITICAL = nil;
static GanttBarShowForTasks *_NOT_MARKED = nil;
static GanttBarShowForTasks *_NOT_INPROGRESS = nil;
static GanttBarShowForTasks *_NOT_STARTEDLATE = nil;
static GanttBarShowForTasks *_NOT_FINISHEDLATE = nil;
static GanttBarShowForTasks *_NOT_STARTEDEARLY = nil;
static GanttBarShowForTasks *_NOT_FINISHEDEARLY = nil;
static GanttBarShowForTasks *_NOT_STARTEDONTIME = nil;
static GanttBarShowForTasks *_NOT_FINISHEDONTIME = nil;
static GanttBarShowForTasks *_NOT_FLAG1 = nil;
static GanttBarShowForTasks *_NOT_FLAG2 = nil;
static GanttBarShowForTasks *_NOT_FLAG3 = nil;
static GanttBarShowForTasks *_NOT_FLAG4 = nil;
static GanttBarShowForTasks *_NOT_FLAG5 = nil;
static GanttBarShowForTasks *_NOT_FLAG6 = nil;
static GanttBarShowForTasks *_NOT_FLAG7 = nil;
static GanttBarShowForTasks *_NOT_FLAG8 = nil;
static GanttBarShowForTasks *_NOT_FLAG9 = nil;
static GanttBarShowForTasks *_NOT_FLAG10 = nil;
static GanttBarShowForTasks *_NOT_ROLLEDUP = nil;
static GanttBarShowForTasks *_NOT_PROJECTSUMMARY = nil;
static GanttBarShowForTasks *_NOT_SPLIT = nil;
static GanttBarShowForTasks *_NOT_EXTERNAL = nil;
static GanttBarShowForTasks *_NOT_FLAG11 = nil;
static GanttBarShowForTasks *_NOT_FLAG12 = nil;
static GanttBarShowForTasks *_NOT_FLAG13 = nil;
static GanttBarShowForTasks *_NOT_FLAG14 = nil;
static GanttBarShowForTasks *_NOT_FLAG15 = nil;
static GanttBarShowForTasks *_NOT_FLAG16 = nil;
static GanttBarShowForTasks *_NOT_FLAG17 = nil;
static GanttBarShowForTasks *_NOT_FLAG18 = nil;
static GanttBarShowForTasks *_NOT_FLAG19 = nil;
static GanttBarShowForTasks *_NOT_FLAG20 = nil;
static GanttBarShowForTasks *_NOT_GROUPBYSUMMARY = nil;
static GanttBarShowForTasks *_NOT_DELIVERABLE = nil;
static GanttBarShowForTasks *_NOT_DEPENDENCY = nil;
static GanttBarShowForTasks *_NOT_ACTIVE = nil;
static GanttBarShowForTasks *_NOT_MANUALLYSCHEDULED = nil;
static GanttBarShowForTasks *_NOT_WARNING = nil;
static GanttBarShowForTasks *_NOT_PLACEHOLDERSTART = nil;
static GanttBarShowForTasks *_NOT_PLACEHOLDERFINISH = nil;
static GanttBarShowForTasks *_NOT_PLACEHOLDERDURATION = nil;
static GanttBarShowForTasks *_NOT_PLACEHOLDER = nil;
static GanttBarShowForTasks *_NOT_LATE = nil;
static NSMutableArray *_TYPE_VALUES = nil;

/**
 * Private constructor.
 *
 * @param type int version of the enum
 * @param name name of the enum
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

+(GanttBarShowForTasks *)getInstance:(int)type
{
    GanttBarShowForTasks *result;
    if(type < 0 || type >= [[GanttBarShowForTasks TYPE_VALUES]count])
    {
        result = [GanttBarShowForTasks NORMAL];
    }
    else
    {
        result = [[GanttBarShowForTasks TYPE_VALUES]objectAtIndex:type];
    }
    return result;
}

/**
 * Retrieve an instance of the enum based on its int value.
 *
 * @param type int type
 * @return enum instance
 */

+(GanttBarShowForTasks *)getInstanceWithNumber:(NSNumber *)type
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
 * Retrieve the line style name. Currently this is not localised.
 *
 * @return style name
 */

-(NSString *)getName
{
    return _name;
}

/**
 * Retrieve the String representation of this line style.
 *
 * @return String representation of this line style
 */

-(NSString *)toString
{
    return [self getName];
}


+(GanttBarShowForTasks *)NORMAL
{
  if(_NORMAL == nil)
  {
      _NORMAL = [[GanttBarShowForTasks alloc] init:0  withName:@"Normal"];
  }
  return _NORMAL;
}

+(GanttBarShowForTasks *)MILESTONE
{
  if(_MILESTONE == nil)
  {
      _MILESTONE = [[GanttBarShowForTasks alloc] init:1  withName:@"Milestone"];
  }
  return _MILESTONE;
}

+(GanttBarShowForTasks *)SUMMARY
{
  if(_SUMMARY == nil)
  {
      _SUMMARY = [[GanttBarShowForTasks alloc] init:2  withName:@"Summary"];
  }
  return _SUMMARY;
}

+(GanttBarShowForTasks *)CRITICAL
{
  if(_CRITICAL == nil)
  {
      _CRITICAL = [[GanttBarShowForTasks alloc] init:3  withName:@"Critical"];
  }
  return _CRITICAL;
}

+(GanttBarShowForTasks *)NONCRITICAL
{
  if(_NONCRITICAL == nil)
  {
      _NONCRITICAL = [[GanttBarShowForTasks alloc] init:4  withName:@"Noncritical"];
  }
  return _NONCRITICAL;
}

+(GanttBarShowForTasks *)MARKED
{
  if(_MARKED == nil)
  {
      _MARKED = [[GanttBarShowForTasks alloc] init:5  withName:@"Marked"];
  }
  return _MARKED;
}

+(GanttBarShowForTasks *)FINISHED
{
  if(_FINISHED == nil)
  {
      _FINISHED = [[GanttBarShowForTasks alloc] init:6  withName:@"Finished"];
  }
  return _FINISHED;
}

+(GanttBarShowForTasks *)INPROGRESS
{
  if(_INPROGRESS == nil)
  {
      _INPROGRESS = [[GanttBarShowForTasks alloc] init:7  withName:@"In Progress"];
  }
  return _INPROGRESS;
}

+(GanttBarShowForTasks *)NOTFINISHED
{
  if(_NOTFINISHED == nil)
  {
      _NOTFINISHED = [[GanttBarShowForTasks alloc] init:8  withName:@"Not Finished"];
  }
  return _NOTFINISHED;
}

+(GanttBarShowForTasks *)NOTSTARTED
{
  if(_NOTSTARTED == nil)
  {
      _NOTSTARTED = [[GanttBarShowForTasks alloc] init:9  withName:@"Not Started"];
  }
  return _NOTSTARTED;
}

+(GanttBarShowForTasks *)STARTEDLATE
{
  if(_STARTEDLATE == nil)
  {
      _STARTEDLATE = [[GanttBarShowForTasks alloc] init:10  withName:@"Started Late"];
  }
  return _STARTEDLATE;
}

+(GanttBarShowForTasks *)FINISHEDLATE
{
  if(_FINISHEDLATE == nil)
  {
      _FINISHEDLATE = [[GanttBarShowForTasks alloc] init:11  withName:@"Finished Late"];
  }
  return _FINISHEDLATE;
}

+(GanttBarShowForTasks *)STARTEDEARLY
{
  if(_STARTEDEARLY == nil)
  {
      _STARTEDEARLY = [[GanttBarShowForTasks alloc] init:12  withName:@"Started Early"];
  }
  return _STARTEDEARLY;
}

+(GanttBarShowForTasks *)FINISHEDEARLY
{
  if(_FINISHEDEARLY == nil)
  {
      _FINISHEDEARLY = [[GanttBarShowForTasks alloc] init:13  withName:@"Finished Early"];
  }
  return _FINISHEDEARLY;
}

+(GanttBarShowForTasks *)STARTEDONTIME
{
  if(_STARTEDONTIME == nil)
  {
      _STARTEDONTIME = [[GanttBarShowForTasks alloc] init:14  withName:@"Started On Time"];
  }
  return _STARTEDONTIME;
}

+(GanttBarShowForTasks *)FINISHEDONTIME
{
  if(_FINISHEDONTIME == nil)
  {
      _FINISHEDONTIME = [[GanttBarShowForTasks alloc] init:15  withName:@"Finished On Time"];
  }
  return _FINISHEDONTIME;
}

+(GanttBarShowForTasks *)FLAG1
{
  if(_FLAG1 == nil)
  {
      _FLAG1 = [[GanttBarShowForTasks alloc] init:16  withName:@"Flag1"];
  }
  return _FLAG1;
}

+(GanttBarShowForTasks *)FLAG2
{
  if(_FLAG2 == nil)
  {
      _FLAG2 = [[GanttBarShowForTasks alloc] init:17  withName:@"Flag2"];
  }
  return _FLAG2;
}

+(GanttBarShowForTasks *)FLAG3
{
  if(_FLAG3 == nil)
  {
      _FLAG3 = [[GanttBarShowForTasks alloc] init:18  withName:@"Flag3"];
  }
  return _FLAG3;
}

+(GanttBarShowForTasks *)FLAG4
{
  if(_FLAG4 == nil)
  {
      _FLAG4 = [[GanttBarShowForTasks alloc] init:19  withName:@"Flag4"];
  }
  return _FLAG4;
}

+(GanttBarShowForTasks *)FLAG5
{
  if(_FLAG5 == nil)
  {
      _FLAG5 = [[GanttBarShowForTasks alloc] init:20  withName:@"Flag5"];
  }
  return _FLAG5;
}

+(GanttBarShowForTasks *)FLAG6
{
  if(_FLAG6 == nil)
  {
      _FLAG6 = [[GanttBarShowForTasks alloc] init:21  withName:@"Flag6"];
  }
  return _FLAG6;
}

+(GanttBarShowForTasks *)FLAG7
{
  if(_FLAG7 == nil)
  {
      _FLAG7 = [[GanttBarShowForTasks alloc] init:22  withName:@"Flag7"];
  }
  return _FLAG7;
}

+(GanttBarShowForTasks *)FLAG8
{
  if(_FLAG8 == nil)
  {
      _FLAG8 = [[GanttBarShowForTasks alloc] init:23  withName:@"Flag8"];
  }
  return _FLAG8;
}

+(GanttBarShowForTasks *)FLAG9
{
  if(_FLAG9 == nil)
  {
      _FLAG9 = [[GanttBarShowForTasks alloc] init:24  withName:@"Flag9"];
  }
  return _FLAG9;
}

+(GanttBarShowForTasks *)FLAG10
{
  if(_FLAG10 == nil)
  {
      _FLAG10 = [[GanttBarShowForTasks alloc] init:25  withName:@"Flag10"];
  }
  return _FLAG10;
}

+(GanttBarShowForTasks *)ROLLEDUP
{
  if(_ROLLEDUP == nil)
  {
      _ROLLEDUP = [[GanttBarShowForTasks alloc] init:26  withName:@"Rolled Up"];
  }
  return _ROLLEDUP;
}

+(GanttBarShowForTasks *)PROJECTSUMMARY
{
  if(_PROJECTSUMMARY == nil)
  {
      _PROJECTSUMMARY = [[GanttBarShowForTasks alloc] init:27  withName:@"Project Summary"];
  }
  return _PROJECTSUMMARY;
}

+(GanttBarShowForTasks *)SPLIT
{
  if(_SPLIT == nil)
  {
      _SPLIT = [[GanttBarShowForTasks alloc] init:28  withName:@"Split"];
  }
  return _SPLIT;
}

+(GanttBarShowForTasks *)EXTERNAL
{
  if(_EXTERNAL == nil)
  {
      _EXTERNAL = [[GanttBarShowForTasks alloc] init:29  withName:@"External Tasks"];
  }
  return _EXTERNAL;
}

+(GanttBarShowForTasks *)FLAG11
{
  if(_FLAG11 == nil)
  {
      _FLAG11 = [[GanttBarShowForTasks alloc] init:30  withName:@"Flag11"];
  }
  return _FLAG11;
}

+(GanttBarShowForTasks *)FLAG12
{
  if(_FLAG12 == nil)
  {
      _FLAG12 = [[GanttBarShowForTasks alloc] init:31  withName:@"Flag12"];
  }
  return _FLAG12;
}

+(GanttBarShowForTasks *)FLAG13
{
  if(_FLAG13 == nil)
  {
      _FLAG13 = [[GanttBarShowForTasks alloc] init:32  withName:@"Flag13"];
  }
  return _FLAG13;
}

+(GanttBarShowForTasks *)FLAG14
{
  if(_FLAG14 == nil)
  {
      _FLAG14 = [[GanttBarShowForTasks alloc] init:33  withName:@"Flag14"];
  }
  return _FLAG14;
}

+(GanttBarShowForTasks *)FLAG15
{
  if(_FLAG15 == nil)
  {
      _FLAG15 = [[GanttBarShowForTasks alloc] init:34  withName:@"Flag15"];
  }
  return _FLAG15;
}

+(GanttBarShowForTasks *)FLAG16
{
  if(_FLAG16 == nil)
  {
      _FLAG16 = [[GanttBarShowForTasks alloc] init:35  withName:@"Flag16"];
  }
  return _FLAG16;
}

+(GanttBarShowForTasks *)FLAG17
{
  if(_FLAG17 == nil)
  {
      _FLAG17 = [[GanttBarShowForTasks alloc] init:36  withName:@"Flag17"];
  }
  return _FLAG17;
}

+(GanttBarShowForTasks *)FLAG18
{
  if(_FLAG18 == nil)
  {
      _FLAG18 = [[GanttBarShowForTasks alloc] init:37  withName:@"Flag18"];
  }
  return _FLAG18;
}

+(GanttBarShowForTasks *)FLAG19
{
  if(_FLAG19 == nil)
  {
      _FLAG19 = [[GanttBarShowForTasks alloc] init:38  withName:@"Flag19"];
  }
  return _FLAG19;
}

+(GanttBarShowForTasks *)FLAG20
{
  if(_FLAG20 == nil)
  {
      _FLAG20 = [[GanttBarShowForTasks alloc] init:39  withName:@"Flag20"];
  }
  return _FLAG20;
}

+(GanttBarShowForTasks *)GROUPBYSUMMARY
{
  if(_GROUPBYSUMMARY == nil)
  {
      _GROUPBYSUMMARY = [[GanttBarShowForTasks alloc] init:40  withName:@"Group By Summary"];
  }
  return _GROUPBYSUMMARY;
}

+(GanttBarShowForTasks *)DELIVERABLE
{
  if(_DELIVERABLE == nil)
  {
      _DELIVERABLE = [[GanttBarShowForTasks alloc] init:41  withName:@"Deliverable"];
  }
  return _DELIVERABLE;
}

+(GanttBarShowForTasks *)DEPENDENCY
{
  if(_DEPENDENCY == nil)
  {
      _DEPENDENCY = [[GanttBarShowForTasks alloc] init:42  withName:@"Dependency"];
  }
  return _DEPENDENCY;
}

+(GanttBarShowForTasks *)ACTIVE
{
  if(_ACTIVE == nil)
  {
      _ACTIVE = [[GanttBarShowForTasks alloc] init:43  withName:@"Active"];
  }
  return _ACTIVE;
}

+(GanttBarShowForTasks *)MANUALLYSCHEDULED
{
  if(_MANUALLYSCHEDULED == nil)
  {
      _MANUALLYSCHEDULED = [[GanttBarShowForTasks alloc] init:44  withName:@"Manually Scheduled"];
  }
  return _MANUALLYSCHEDULED;
}

+(GanttBarShowForTasks *)WARNING
{
  if(_WARNING == nil)
  {
      _WARNING = [[GanttBarShowForTasks alloc] init:45  withName:@"Warning"];
  }
  return _WARNING;
}

+(GanttBarShowForTasks *)PLACEHOLDERSTART
{
  if(_PLACEHOLDERSTART == nil)
  {
      _PLACEHOLDERSTART = [[GanttBarShowForTasks alloc] init:46  withName:@"Placeholder (Start)"];
  }
  return _PLACEHOLDERSTART;
}

+(GanttBarShowForTasks *)PLACEHOLDERFINISH
{
  if(_PLACEHOLDERFINISH == nil)
  {
      _PLACEHOLDERFINISH = [[GanttBarShowForTasks alloc] init:47  withName:@"Placeholder (Finish)"];
  }
  return _PLACEHOLDERFINISH;
}

+(GanttBarShowForTasks *)PLACEHOLDERDURATION
{
  if(_PLACEHOLDERDURATION == nil)
  {
      _PLACEHOLDERDURATION = [[GanttBarShowForTasks alloc] init:48  withName:@"Placeholder (Duration)"];
  }
  return _PLACEHOLDERDURATION;
}

+(GanttBarShowForTasks *)PLACEHOLDER
{
  if(_PLACEHOLDER == nil)
  {
      _PLACEHOLDER = [[GanttBarShowForTasks alloc] init:49  withName:@"Placeholder"];
  }
  return _PLACEHOLDER;
}

+(GanttBarShowForTasks *)LATE
{
  if(_LATE == nil)
  {
      _LATE = [[GanttBarShowForTasks alloc] init:50  withName:@"Late"];
  }
  return _LATE;
}

+(GanttBarShowForTasks *)NOT_NORMAL
{
  if(_NOT_NORMAL == nil)
  {
      _NOT_NORMAL = [[GanttBarShowForTasks alloc] init:64  withName:@"Not Normal"];
  }
  return _NOT_NORMAL;
}

+(GanttBarShowForTasks *)NOT_MILESTONE
{
  if(_NOT_MILESTONE == nil)
  {
      _NOT_MILESTONE = [[GanttBarShowForTasks alloc] init:65  withName:@"Not Milestone"];
  }
  return _NOT_MILESTONE;
}

+(GanttBarShowForTasks *)NOT_SUMMARY
{
  if(_NOT_SUMMARY == nil)
  {
      _NOT_SUMMARY = [[GanttBarShowForTasks alloc] init:66  withName:@"Not Summary"];
  }
  return _NOT_SUMMARY;
}

+(GanttBarShowForTasks *)NOT_CRITICAL
{
  if(_NOT_CRITICAL == nil)
  {
      _NOT_CRITICAL = [[GanttBarShowForTasks alloc] init:67  withName:@"Not Critical"];
  }
  return _NOT_CRITICAL;
}

+(GanttBarShowForTasks *)NOT_MARKED
{
  if(_NOT_MARKED == nil)
  {
      _NOT_MARKED = [[GanttBarShowForTasks alloc] init:69  withName:@"Not Marked"];
  }
  return _NOT_MARKED;
}

+(GanttBarShowForTasks *)NOT_INPROGRESS
{
  if(_NOT_INPROGRESS == nil)
  {
      _NOT_INPROGRESS = [[GanttBarShowForTasks alloc] init:71  withName:@"Not In Progress"];
  }
  return _NOT_INPROGRESS;
}

+(GanttBarShowForTasks *)NOT_STARTEDLATE
{
  if(_NOT_STARTEDLATE == nil)
  {
      _NOT_STARTEDLATE = [[GanttBarShowForTasks alloc] init:74  withName:@"Not Started Late"];
  }
  return _NOT_STARTEDLATE;
}

+(GanttBarShowForTasks *)NOT_FINISHEDLATE
{
  if(_NOT_FINISHEDLATE == nil)
  {
      _NOT_FINISHEDLATE = [[GanttBarShowForTasks alloc] init:75  withName:@"Not Finished Late"];
  }
  return _NOT_FINISHEDLATE;
}

+(GanttBarShowForTasks *)NOT_STARTEDEARLY
{
  if(_NOT_STARTEDEARLY == nil)
  {
      _NOT_STARTEDEARLY = [[GanttBarShowForTasks alloc] init:76  withName:@"Not Started Early"];
  }
  return _NOT_STARTEDEARLY;
}

+(GanttBarShowForTasks *)NOT_FINISHEDEARLY
{
  if(_NOT_FINISHEDEARLY == nil)
  {
      _NOT_FINISHEDEARLY = [[GanttBarShowForTasks alloc] init:77  withName:@"Not Finished Early"];
  }
  return _NOT_FINISHEDEARLY;
}

+(GanttBarShowForTasks *)NOT_STARTEDONTIME
{
  if(_NOT_STARTEDONTIME == nil)
  {
      _NOT_STARTEDONTIME = [[GanttBarShowForTasks alloc] init:78  withName:@"Not Started On Time"];
  }
  return _NOT_STARTEDONTIME;
}

+(GanttBarShowForTasks *)NOT_FINISHEDONTIME
{
  if(_NOT_FINISHEDONTIME == nil)
  {
      _NOT_FINISHEDONTIME = [[GanttBarShowForTasks alloc] init:79  withName:@"Not Finished On Time"];
  }
  return _NOT_FINISHEDONTIME;
}

+(GanttBarShowForTasks *)NOT_FLAG1
{
  if(_NOT_FLAG1 == nil)
  {
      _NOT_FLAG1 = [[GanttBarShowForTasks alloc] init:80  withName:@"Not Flag1"];
  }
  return _NOT_FLAG1;
}

+(GanttBarShowForTasks *)NOT_FLAG2
{
  if(_NOT_FLAG2 == nil)
  {
      _NOT_FLAG2 = [[GanttBarShowForTasks alloc] init:81  withName:@"Not Flag2"];
  }
  return _NOT_FLAG2;
}

+(GanttBarShowForTasks *)NOT_FLAG3
{
  if(_NOT_FLAG3 == nil)
  {
      _NOT_FLAG3 = [[GanttBarShowForTasks alloc] init:82  withName:@"Not Flag3"];
  }
  return _NOT_FLAG3;
}

+(GanttBarShowForTasks *)NOT_FLAG4
{
  if(_NOT_FLAG4 == nil)
  {
      _NOT_FLAG4 = [[GanttBarShowForTasks alloc] init:83  withName:@"Not Flag4"];
  }
  return _NOT_FLAG4;
}

+(GanttBarShowForTasks *)NOT_FLAG5
{
  if(_NOT_FLAG5 == nil)
  {
      _NOT_FLAG5 = [[GanttBarShowForTasks alloc] init:84  withName:@"Not Flag5"];
  }
  return _NOT_FLAG5;
}

+(GanttBarShowForTasks *)NOT_FLAG6
{
  if(_NOT_FLAG6 == nil)
  {
      _NOT_FLAG6 = [[GanttBarShowForTasks alloc] init:85  withName:@"Not Flag6"];
  }
  return _NOT_FLAG6;
}

+(GanttBarShowForTasks *)NOT_FLAG7
{
  if(_NOT_FLAG7 == nil)
  {
      _NOT_FLAG7 = [[GanttBarShowForTasks alloc] init:86  withName:@"Not Flag7"];
  }
  return _NOT_FLAG7;
}

+(GanttBarShowForTasks *)NOT_FLAG8
{
  if(_NOT_FLAG8 == nil)
  {
      _NOT_FLAG8 = [[GanttBarShowForTasks alloc] init:87  withName:@"Not Flag8"];
  }
  return _NOT_FLAG8;
}

+(GanttBarShowForTasks *)NOT_FLAG9
{
  if(_NOT_FLAG9 == nil)
  {
      _NOT_FLAG9 = [[GanttBarShowForTasks alloc] init:88  withName:@"Not Flag9"];
  }
  return _NOT_FLAG9;
}

+(GanttBarShowForTasks *)NOT_FLAG10
{
  if(_NOT_FLAG10 == nil)
  {
      _NOT_FLAG10 = [[GanttBarShowForTasks alloc] init:89  withName:@"Not Flag10"];
  }
  return _NOT_FLAG10;
}

+(GanttBarShowForTasks *)NOT_ROLLEDUP
{
  if(_NOT_ROLLEDUP == nil)
  {
      _NOT_ROLLEDUP = [[GanttBarShowForTasks alloc] init:90  withName:@"Not Rolled Up"];
  }
  return _NOT_ROLLEDUP;
}

+(GanttBarShowForTasks *)NOT_PROJECTSUMMARY
{
  if(_NOT_PROJECTSUMMARY == nil)
  {
      _NOT_PROJECTSUMMARY = [[GanttBarShowForTasks alloc] init:91  withName:@"Not Project Summary"];
  }
  return _NOT_PROJECTSUMMARY;
}

+(GanttBarShowForTasks *)NOT_SPLIT
{
  if(_NOT_SPLIT == nil)
  {
      _NOT_SPLIT = [[GanttBarShowForTasks alloc] init:92  withName:@"Not Split"];
  }
  return _NOT_SPLIT;
}

+(GanttBarShowForTasks *)NOT_EXTERNAL
{
  if(_NOT_EXTERNAL == nil)
  {
      _NOT_EXTERNAL = [[GanttBarShowForTasks alloc] init:93  withName:@"Not External Tasks"];
  }
  return _NOT_EXTERNAL;
}

+(GanttBarShowForTasks *)NOT_FLAG11
{
  if(_NOT_FLAG11 == nil)
  {
      _NOT_FLAG11 = [[GanttBarShowForTasks alloc] init:94  withName:@"Not Flag11"];
  }
  return _NOT_FLAG11;
}

+(GanttBarShowForTasks *)NOT_FLAG12
{
  if(_NOT_FLAG12 == nil)
  {
      _NOT_FLAG12 = [[GanttBarShowForTasks alloc] init:95  withName:@"Not Flag12"];
  }
  return _NOT_FLAG12;
}

+(GanttBarShowForTasks *)NOT_FLAG13
{
  if(_NOT_FLAG13 == nil)
  {
      _NOT_FLAG13 = [[GanttBarShowForTasks alloc] init:96  withName:@"Not Flag13"];
  }
  return _NOT_FLAG13;
}

+(GanttBarShowForTasks *)NOT_FLAG14
{
  if(_NOT_FLAG14 == nil)
  {
      _NOT_FLAG14 = [[GanttBarShowForTasks alloc] init:97  withName:@"Not Flag14"];
  }
  return _NOT_FLAG14;
}

+(GanttBarShowForTasks *)NOT_FLAG15
{
  if(_NOT_FLAG15 == nil)
  {
      _NOT_FLAG15 = [[GanttBarShowForTasks alloc] init:98  withName:@"Not Flag15"];
  }
  return _NOT_FLAG15;
}

+(GanttBarShowForTasks *)NOT_FLAG16
{
  if(_NOT_FLAG16 == nil)
  {
      _NOT_FLAG16 = [[GanttBarShowForTasks alloc] init:99  withName:@"Not Flag16"];
  }
  return _NOT_FLAG16;
}

+(GanttBarShowForTasks *)NOT_FLAG17
{
  if(_NOT_FLAG17 == nil)
  {
      _NOT_FLAG17 = [[GanttBarShowForTasks alloc] init:100  withName:@"Not Flag17"];
  }
  return _NOT_FLAG17;
}

+(GanttBarShowForTasks *)NOT_FLAG18
{
  if(_NOT_FLAG18 == nil)
  {
      _NOT_FLAG18 = [[GanttBarShowForTasks alloc] init:101  withName:@"Not Flag18"];
  }
  return _NOT_FLAG18;
}

+(GanttBarShowForTasks *)NOT_FLAG19
{
  if(_NOT_FLAG19 == nil)
  {
      _NOT_FLAG19 = [[GanttBarShowForTasks alloc] init:102  withName:@"Not Flag19"];
  }
  return _NOT_FLAG19;
}

+(GanttBarShowForTasks *)NOT_FLAG20
{
  if(_NOT_FLAG20 == nil)
  {
      _NOT_FLAG20 = [[GanttBarShowForTasks alloc] init:103  withName:@"Not Flag20"];
  }
  return _NOT_FLAG20;
}

+(GanttBarShowForTasks *)NOT_GROUPBYSUMMARY
{
  if(_NOT_GROUPBYSUMMARY == nil)
  {
      _NOT_GROUPBYSUMMARY = [[GanttBarShowForTasks alloc] init:104  withName:@"Not Group By Summary"];
  }
  return _NOT_GROUPBYSUMMARY;
}

+(GanttBarShowForTasks *)NOT_DELIVERABLE
{
  if(_NOT_DELIVERABLE == nil)
  {
      _NOT_DELIVERABLE = [[GanttBarShowForTasks alloc] init:105  withName:@"Not Deliverable"];
  }
  return _NOT_DELIVERABLE;
}

+(GanttBarShowForTasks *)NOT_DEPENDENCY
{
  if(_NOT_DEPENDENCY == nil)
  {
      _NOT_DEPENDENCY = [[GanttBarShowForTasks alloc] init:106  withName:@"Not Dependency"];
  }
  return _NOT_DEPENDENCY;
}

+(GanttBarShowForTasks *)NOT_ACTIVE
{
  if(_NOT_ACTIVE == nil)
  {
      _NOT_ACTIVE = [[GanttBarShowForTasks alloc] init:107  withName:@"Not Active"];
  }
  return _NOT_ACTIVE;
}

+(GanttBarShowForTasks *)NOT_MANUALLYSCHEDULED
{
  if(_NOT_MANUALLYSCHEDULED == nil)
  {
      _NOT_MANUALLYSCHEDULED = [[GanttBarShowForTasks alloc] init:108  withName:@"Not Manually Scheduled"];
  }
  return _NOT_MANUALLYSCHEDULED;
}

+(GanttBarShowForTasks *)NOT_WARNING
{
  if(_NOT_WARNING == nil)
  {
      _NOT_WARNING = [[GanttBarShowForTasks alloc] init:109  withName:@"Not Warning"];
  }
  return _NOT_WARNING;
}

+(GanttBarShowForTasks *)NOT_PLACEHOLDERSTART
{
  if(_NOT_PLACEHOLDERSTART == nil)
  {
      _NOT_PLACEHOLDERSTART = [[GanttBarShowForTasks alloc] init:110  withName:@"Not Placeholder (Start)"];
  }
  return _NOT_PLACEHOLDERSTART;
}

+(GanttBarShowForTasks *)NOT_PLACEHOLDERFINISH
{
  if(_NOT_PLACEHOLDERFINISH == nil)
  {
      _NOT_PLACEHOLDERFINISH = [[GanttBarShowForTasks alloc] init:111  withName:@"Not Placeholder (Finish)"];
  }
  return _NOT_PLACEHOLDERFINISH;
}

+(GanttBarShowForTasks *)NOT_PLACEHOLDERDURATION
{
  if(_NOT_PLACEHOLDERDURATION == nil)
  {
      _NOT_PLACEHOLDERDURATION = [[GanttBarShowForTasks alloc] init:112  withName:@"Placeholder (Duration)"];
  }
  return _NOT_PLACEHOLDERDURATION;
}

+(GanttBarShowForTasks *)NOT_PLACEHOLDER
{
  if(_NOT_PLACEHOLDER == nil)
  {
      _NOT_PLACEHOLDER = [[GanttBarShowForTasks alloc] init:113  withName:@"Not Placeholder"];
  }
  return _NOT_PLACEHOLDER;
}

+(GanttBarShowForTasks *)NOT_LATE
{
  if(_NOT_LATE == nil)
  {
      _NOT_LATE = [[GanttBarShowForTasks alloc] init:114  withName:@"Not Late"];
  }
  return _NOT_LATE;
}

+(NSMutableArray *)TYPE_VALUES
{
  if(_TYPE_VALUES == nil)
  {
      NSMutableArray *temp = [[NSMutableArray alloc] initWithObjects:[GanttBarShowForTasks NORMAL], [GanttBarShowForTasks MILESTONE], [GanttBarShowForTasks SUMMARY], [GanttBarShowForTasks CRITICAL], [GanttBarShowForTasks NONCRITICAL], [GanttBarShowForTasks MARKED], [GanttBarShowForTasks FINISHED], [GanttBarShowForTasks INPROGRESS], [GanttBarShowForTasks NOTFINISHED], [GanttBarShowForTasks NOTSTARTED], [GanttBarShowForTasks STARTEDLATE], [GanttBarShowForTasks FINISHEDLATE], [GanttBarShowForTasks STARTEDEARLY], [GanttBarShowForTasks FINISHEDEARLY], [GanttBarShowForTasks STARTEDONTIME], [GanttBarShowForTasks FINISHEDONTIME], [GanttBarShowForTasks FLAG1], [GanttBarShowForTasks FLAG2], [GanttBarShowForTasks FLAG3], [GanttBarShowForTasks FLAG4], [GanttBarShowForTasks FLAG5], [GanttBarShowForTasks FLAG6], [GanttBarShowForTasks FLAG7], [GanttBarShowForTasks FLAG8], [GanttBarShowForTasks FLAG9], [GanttBarShowForTasks FLAG10], [GanttBarShowForTasks ROLLEDUP], [GanttBarShowForTasks PROJECTSUMMARY], [GanttBarShowForTasks SPLIT], [GanttBarShowForTasks EXTERNAL], [GanttBarShowForTasks FLAG11], [GanttBarShowForTasks FLAG12], [GanttBarShowForTasks FLAG13], [GanttBarShowForTasks FLAG14], [GanttBarShowForTasks FLAG15], [GanttBarShowForTasks FLAG16], [GanttBarShowForTasks FLAG17], [GanttBarShowForTasks FLAG18], [GanttBarShowForTasks FLAG19], [GanttBarShowForTasks FLAG20], [GanttBarShowForTasks GROUPBYSUMMARY], [GanttBarShowForTasks DELIVERABLE], [GanttBarShowForTasks DEPENDENCY], [GanttBarShowForTasks ACTIVE], [GanttBarShowForTasks MANUALLYSCHEDULED], [GanttBarShowForTasks WARNING], [GanttBarShowForTasks PLACEHOLDERSTART], [GanttBarShowForTasks PLACEHOLDERFINISH], [GanttBarShowForTasks PLACEHOLDERDURATION], [GanttBarShowForTasks PLACEHOLDER], [GanttBarShowForTasks LATE], [GanttBarShowForTasks NOT_NORMAL], [GanttBarShowForTasks NOT_MILESTONE], [GanttBarShowForTasks NOT_SUMMARY], [GanttBarShowForTasks NOT_CRITICAL], [GanttBarShowForTasks NOT_MARKED], [GanttBarShowForTasks NOT_INPROGRESS], [GanttBarShowForTasks NOT_STARTEDLATE], [GanttBarShowForTasks NOT_FINISHEDLATE], [GanttBarShowForTasks NOT_STARTEDEARLY], [GanttBarShowForTasks NOT_FINISHEDEARLY], [GanttBarShowForTasks NOT_STARTEDONTIME], [GanttBarShowForTasks NOT_FINISHEDONTIME], [GanttBarShowForTasks NOT_FLAG1], [GanttBarShowForTasks NOT_FLAG2], [GanttBarShowForTasks NOT_FLAG3], [GanttBarShowForTasks NOT_FLAG4], [GanttBarShowForTasks NOT_FLAG5], [GanttBarShowForTasks NOT_FLAG6], [GanttBarShowForTasks NOT_FLAG7], [GanttBarShowForTasks NOT_FLAG8], [GanttBarShowForTasks NOT_FLAG9], [GanttBarShowForTasks NOT_FLAG10], [GanttBarShowForTasks NOT_ROLLEDUP], [GanttBarShowForTasks NOT_PROJECTSUMMARY], [GanttBarShowForTasks NOT_SPLIT], [GanttBarShowForTasks NOT_EXTERNAL], [GanttBarShowForTasks NOT_FLAG11], [GanttBarShowForTasks NOT_FLAG12], [GanttBarShowForTasks NOT_FLAG13], [GanttBarShowForTasks NOT_FLAG14], [GanttBarShowForTasks NOT_FLAG15], [GanttBarShowForTasks NOT_FLAG16], [GanttBarShowForTasks NOT_FLAG17], [GanttBarShowForTasks NOT_FLAG18], [GanttBarShowForTasks NOT_FLAG19], [GanttBarShowForTasks NOT_FLAG20], [GanttBarShowForTasks NOT_GROUPBYSUMMARY], [GanttBarShowForTasks NOT_DELIVERABLE], [GanttBarShowForTasks NOT_DEPENDENCY], [GanttBarShowForTasks NOT_ACTIVE], [GanttBarShowForTasks NOT_MANUALLYSCHEDULED], [GanttBarShowForTasks NOT_WARNING], [GanttBarShowForTasks NOT_PLACEHOLDERSTART], [GanttBarShowForTasks NOT_PLACEHOLDERFINISH], [GanttBarShowForTasks NOT_PLACEHOLDERDURATION], [GanttBarShowForTasks NOT_PLACEHOLDER], [GanttBarShowForTasks NOT_LATE],  nil];
      
      _TYPE_VALUES = [EnumUtility createTypeArray:temp withOffSet:26];
      
    #warning, Check original file //TYPE_VALUES[70] = GanttBarShowForTasks.NOTFINISHED;
  }
  return _TYPE_VALUES;
}

@end
