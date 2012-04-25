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

@interface MPPDuration : NSObject
{
    double _duration;
    TimeUnit * _units;
}

-(double)getDuration;

-(TimeUnit *) getUnits;

-(MPPDuration *) convertUnits:(TimeUnit *)type withDefaults: (ProjectHeader *) defaults;

+(MPPDuration *) convertUnits:(double) duration  withFromUnits:(TimeUnit *) fromUnits withToUnits: (TimeUnit *) toUnits withDefaults:(ProjectHeader *) defaults;

+(MPPDuration *) convertUnits:(double) duration withFromUnits: (TimeUnit *) fromUnits withToUnits:(TimeUnit *) toUnits  withMinutesPerDay:(double) minutesPerDay withMinutesPerWeek:(double) minutesPerWeek withDaysPerWeek:(double) daysPerMonth;

+(MPPDuration *) getInstance:(double) duration withDoubleType:(TimeUnit *) type;

+(MPPDuration *) getInstance:(int) duration withIntType:(TimeUnit *) type;

-(int) hashCode;

-(int) compareTo:(MPPDuration *) rhs;

-(NSString *) toString;

@end
