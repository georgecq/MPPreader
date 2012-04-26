//
//  ProjectHeader.h
//  mppParser
//
//  Created by George on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectEntity.h"

@class ProjectFile;
@class TimeUnit;
@class MPPDuration;

@interface ProjectHeader : ProjectEntity

@property (strong, nonatomic) TimeUnit *defaultDurationUnits;

-(id)init:(ProjectFile *)file;

-(int)getMinutesPerDay;

-(int)getMinutesPerWeek;

-(int)getDaysPerMonth;

-(MPPDuration *)getDuration;

@end
