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
@class MPPDuration;
@class TimeUnit;

@interface ProjectCalendar : ProjectCalendarWeek

-(id)init:(ProjectFile *)file;

-(Resource *)getResource;

-(void)setParent:(ProjectCalendar *)calendar;

-(void)remove;

+(NSString *)DEFAULT_BASE_CALENDAR_NAME;

-(MPPDuration *)getDuration:(NSDate *)startDate to:(NSDate *)endDate;

-(MPPDuration *)getWork:(NSDate *)startDate withEndDate:(NSDate *)endDate withFormat:(TimeUnit *)format;

-(NSDate *)getDate:(NSDate *)startDate withDuration:(MPPDuration *)duration withNextWorkStart:(Boolean)returnNextWorkStart;

-(NSNumber *)getUniqueID;

-(void)setUniqueID:(NSNumber *)uniqueID;

@end
