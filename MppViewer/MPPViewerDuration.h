//
//  MPPViewerDuration.h
//  MppViewer
//
//  Created by Fernando Araya on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TimeUnit;
@class ProjectHeader;

@interface MPPViewerDuration : NSObject
{
    double _duration;
    TimeUnit * _units;
}

-(double)getDuration;

-(TimeUnit *) getUnits;

-(MPPViewerDuration *) convertUnits:(TimeUnit *)type withDefaults: (ProjectHeader *) defaults;

+(MPPViewerDuration *) convertUnits:(double) duration  withFromUnits:(TimeUnit *) fromUnits withToUnits: (TimeUnit *) toUnits withDefaults:(ProjectHeader *) defaults;

+(MPPViewerDuration *) convertUnits:(double) duration withFromUnits: (TimeUnit *) fromUnits withToUnits:(TimeUnit *) toUnits  withMinutesPerDay:(double) minutesPerDay withMinutesPerWeek:(double) minutesPerWeek withDaysPerWeek:(double) daysPerMonth;

+(MPPViewerDuration *) getInstance:(double) duration withDoubleType:(TimeUnit *) type;

+(MPPViewerDuration *) getInstance:(int) duration withIntType:(TimeUnit *) type;

-(int) hashCode;

-(int) compareTo:(MPPViewerDuration *) rhs;

-(NSString *) toString;

@end
