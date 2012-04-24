//
// GanttBarStartEndShape.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface GanttBarStartEndShape : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(GanttBarStartEndShape *)getInstance:(int)type;

+(GanttBarStartEndShape *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)getName;

-(NSString *)toString;

+(GanttBarStartEndShape *)NONE;
+(GanttBarStartEndShape *)NORTHHOMEPLATE;
+(GanttBarStartEndShape *)SOUTHHOMEPLATE;
+(GanttBarStartEndShape *)DIAMOND;
+(GanttBarStartEndShape *)UPARROW;
+(GanttBarStartEndShape *)DOWNARROW;
+(GanttBarStartEndShape *)RIGHTARROW;
+(GanttBarStartEndShape *)LEFTARROW;
+(GanttBarStartEndShape *)UPPOINTER;
+(GanttBarStartEndShape *)SOUTHMINIHOMEPLATE;
+(GanttBarStartEndShape *)NORTHMINIHOMEPLATE;
+(GanttBarStartEndShape *)VERTICALBAR;
+(GanttBarStartEndShape *)SQUARE;
+(GanttBarStartEndShape *)DIAMONDCIRCLED;
+(GanttBarStartEndShape *)DOWNPOINTER;
+(GanttBarStartEndShape *)UPARROWCIRCLED;
+(GanttBarStartEndShape *)DOWNARROWCIRCLED;
+(GanttBarStartEndShape *)UPPOINTERCIRCLED;
+(GanttBarStartEndShape *)DOWNPOINTERCIRCLED;
+(GanttBarStartEndShape *)CIRCLE;
+(GanttBarStartEndShape *)STAR;
+(GanttBarStartEndShape *)LEFTBRACKET;
+(GanttBarStartEndShape *)RIGHTBRACKET;
+(GanttBarStartEndShape *)LEFTGRADIENT;
+(GanttBarStartEndShape *)RIGHTGRADIENT;

@end
