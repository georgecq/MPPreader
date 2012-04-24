//
// GanttBarMiddleShape.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface GanttBarMiddleShape : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(GanttBarMiddleShape *)getInstance:(int)type;

+(GanttBarMiddleShape *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)getName;

-(NSString *)toString;

+(GanttBarMiddleShape *)NONE;
+(GanttBarMiddleShape *)ROUNDED;
+(GanttBarMiddleShape *)TOPTHINROUNDED;
+(GanttBarMiddleShape *)MIDDLETHINROUNDED;
+(GanttBarMiddleShape *)BOTTOMTHINROUNDED;
+(GanttBarMiddleShape *)TOPLINE;
+(GanttBarMiddleShape *)MIDDLELINE;
+(GanttBarMiddleShape *)BOTTOMLINE;

@end
