//
// GanttBarShowForTasks.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface GanttBarShowForTasks : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(GanttBarShowForTasks *)getInstance:(int)type;

+(GanttBarShowForTasks *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)getName;

-(NSString *)toString;

+(GanttBarShowForTasks *)NORMAL;
+(GanttBarShowForTasks *)MILESTONE;
+(GanttBarShowForTasks *)SUMMARY;
+(GanttBarShowForTasks *)CRITICAL;
+(GanttBarShowForTasks *)NONCRITICAL;
+(GanttBarShowForTasks *)MARKED;
+(GanttBarShowForTasks *)FINISHED;
+(GanttBarShowForTasks *)INPROGRESS;
+(GanttBarShowForTasks *)NOTFINISHED;
+(GanttBarShowForTasks *)NOTSTARTED;
+(GanttBarShowForTasks *)STARTEDLATE;
+(GanttBarShowForTasks *)FINISHEDLATE;
+(GanttBarShowForTasks *)STARTEDEARLY;
+(GanttBarShowForTasks *)FINISHEDEARLY;
+(GanttBarShowForTasks *)STARTEDONTIME;
+(GanttBarShowForTasks *)FINISHEDONTIME;
+(GanttBarShowForTasks *)FLAG1;
+(GanttBarShowForTasks *)FLAG2;
+(GanttBarShowForTasks *)FLAG3;
+(GanttBarShowForTasks *)FLAG4;
+(GanttBarShowForTasks *)FLAG5;
+(GanttBarShowForTasks *)FLAG6;
+(GanttBarShowForTasks *)FLAG7;
+(GanttBarShowForTasks *)FLAG8;
+(GanttBarShowForTasks *)FLAG9;
+(GanttBarShowForTasks *)FLAG10;
+(GanttBarShowForTasks *)ROLLEDUP;
+(GanttBarShowForTasks *)PROJECTSUMMARY;
+(GanttBarShowForTasks *)SPLIT;
+(GanttBarShowForTasks *)EXTERNAL;
+(GanttBarShowForTasks *)FLAG11;
+(GanttBarShowForTasks *)FLAG12;
+(GanttBarShowForTasks *)FLAG13;
+(GanttBarShowForTasks *)FLAG14;
+(GanttBarShowForTasks *)FLAG15;
+(GanttBarShowForTasks *)FLAG16;
+(GanttBarShowForTasks *)FLAG17;
+(GanttBarShowForTasks *)FLAG18;
+(GanttBarShowForTasks *)FLAG19;
+(GanttBarShowForTasks *)FLAG20;
+(GanttBarShowForTasks *)GROUPBYSUMMARY;
+(GanttBarShowForTasks *)DELIVERABLE;
+(GanttBarShowForTasks *)DEPENDENCY;
+(GanttBarShowForTasks *)ACTIVE;
+(GanttBarShowForTasks *)MANUALLYSCHEDULED;
+(GanttBarShowForTasks *)WARNING;
+(GanttBarShowForTasks *)PLACEHOLDERSTART;
+(GanttBarShowForTasks *)PLACEHOLDERFINISH;
+(GanttBarShowForTasks *)PLACEHOLDERDURATION;
+(GanttBarShowForTasks *)PLACEHOLDER;
+(GanttBarShowForTasks *)LATE;
+(GanttBarShowForTasks *)NOT_NORMAL;
+(GanttBarShowForTasks *)NOT_MILESTONE;
+(GanttBarShowForTasks *)NOT_SUMMARY;
+(GanttBarShowForTasks *)NOT_CRITICAL;
+(GanttBarShowForTasks *)NOT_MARKED;
+(GanttBarShowForTasks *)NOT_INPROGRESS;
+(GanttBarShowForTasks *)NOT_STARTEDLATE;
+(GanttBarShowForTasks *)NOT_FINISHEDLATE;
+(GanttBarShowForTasks *)NOT_STARTEDEARLY;
+(GanttBarShowForTasks *)NOT_FINISHEDEARLY;
+(GanttBarShowForTasks *)NOT_STARTEDONTIME;
+(GanttBarShowForTasks *)NOT_FINISHEDONTIME;
+(GanttBarShowForTasks *)NOT_FLAG1;
+(GanttBarShowForTasks *)NOT_FLAG2;
+(GanttBarShowForTasks *)NOT_FLAG3;
+(GanttBarShowForTasks *)NOT_FLAG4;
+(GanttBarShowForTasks *)NOT_FLAG5;
+(GanttBarShowForTasks *)NOT_FLAG6;
+(GanttBarShowForTasks *)NOT_FLAG7;
+(GanttBarShowForTasks *)NOT_FLAG8;
+(GanttBarShowForTasks *)NOT_FLAG9;
+(GanttBarShowForTasks *)NOT_FLAG10;
+(GanttBarShowForTasks *)NOT_ROLLEDUP;
+(GanttBarShowForTasks *)NOT_PROJECTSUMMARY;
+(GanttBarShowForTasks *)NOT_SPLIT;
+(GanttBarShowForTasks *)NOT_EXTERNAL;
+(GanttBarShowForTasks *)NOT_FLAG11;
+(GanttBarShowForTasks *)NOT_FLAG12;
+(GanttBarShowForTasks *)NOT_FLAG13;
+(GanttBarShowForTasks *)NOT_FLAG14;
+(GanttBarShowForTasks *)NOT_FLAG15;
+(GanttBarShowForTasks *)NOT_FLAG16;
+(GanttBarShowForTasks *)NOT_FLAG17;
+(GanttBarShowForTasks *)NOT_FLAG18;
+(GanttBarShowForTasks *)NOT_FLAG19;
+(GanttBarShowForTasks *)NOT_FLAG20;
+(GanttBarShowForTasks *)NOT_GROUPBYSUMMARY;
+(GanttBarShowForTasks *)NOT_DELIVERABLE;
+(GanttBarShowForTasks *)NOT_DEPENDENCY;
+(GanttBarShowForTasks *)NOT_ACTIVE;
+(GanttBarShowForTasks *)NOT_MANUALLYSCHEDULED;
+(GanttBarShowForTasks *)NOT_WARNING;
+(GanttBarShowForTasks *)NOT_PLACEHOLDERSTART;
+(GanttBarShowForTasks *)NOT_PLACEHOLDERFINISH;
+(GanttBarShowForTasks *)NOT_PLACEHOLDERDURATION;
+(GanttBarShowForTasks *)NOT_PLACEHOLDER;
+(GanttBarShowForTasks *)NOT_LATE;

@end
