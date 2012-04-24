//
// GanttBarStartEndType.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface GanttBarStartEndType : NSObject <MpxjEnum>
{
    int _value;
    NSString *_name;
}

+(GanttBarStartEndType *)getInstance:(int)type;

+(GanttBarStartEndType *)getInstanceWithNumber:(NSNumber *)type;

-(NSString *)getName;

-(NSString *)toString;

+(GanttBarStartEndType *)SOLID;
+(GanttBarStartEndType *)FRAMED;
+(GanttBarStartEndType *)DASHED;

@end
