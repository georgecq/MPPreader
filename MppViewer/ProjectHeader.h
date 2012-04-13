//
//  ProjectHeader.h
//  mppParser
//
//  Created by George on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProjectFile;

@interface ProjectHeader : NSObject

-(id)init:(ProjectFile *)file;

-(int)getMinutesPerDay;

-(int)getMinutesPerWeek;

-(int)getDaysPerMonth;

@end
