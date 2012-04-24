//
// ViewType.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface ViewType : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(ViewType *)getInstance:(int)type;

+(ViewType *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)getName;

-(NSString *)toString;

+(ViewType *)UNKNOWN;
+(ViewType *)GANTT_CHART;
+(ViewType *)NETWORK_DIAGRAM;
+(ViewType *)RELATIONSHIP_DIAGRAM;
+(ViewType *)TASK_FORM;
+(ViewType *)TASK_SHEET;
+(ViewType *)RESOURCE_FORM;
+(ViewType *)RESOURCE_SHEET;
+(ViewType *)RESOURCE_GRAPH;
+(ViewType *)TASK_DETAILS_FORM;
+(ViewType *)TASK_NAME_FORM;
+(ViewType *)RESOURCE_NAME_FORM;
+(ViewType *)CALENDAR;
+(ViewType *)TASK_USAGE;
+(ViewType *)RESOURCE_USAGE;

@end
