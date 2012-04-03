//
//  ProjectCalendar.h
//  mppParser
//
//  Created by George on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectCalendarWeek.h"

@class ProjectFile;
@class Resource;

@interface ProjectCalendar : ProjectCalendarWeek

// Gets or Sets the resource Unique Id.
@property (readwrite, assign) int UniqueID;

-(id)init:(ProjectFile *)file;

-(Resource *)getResource;

-(void)setParent:(ProjectCalendar *)calendar;

-(void)remove;

+(NSString *)DEFAULT_BASE_CALENDAR_NAME;

-(Duration)getDuration:(NSDate *)startDate to:(NSDate *)endDate;

@end
