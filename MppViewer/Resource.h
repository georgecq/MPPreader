//
//  Resource.h
//  mppParser
//
//  Created by George on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ResourceAssignment;
@class ProjectCalendar;
@class ProjectFile;

@interface Resource : NSObject

-(id)init:(ProjectFile *)file;

-(void)removeResourceAssignment:(ResourceAssignment *)assignment;

-(void)setResourceCalendar:(ProjectCalendar *)calendar;

-(NSNumber *)getUniqueID;

-(NSNumber *)getID;

-(void)setID:(NSNumber *)val;

-(void)setUniqueID:(NSNumber *)val;

-(ProjectCalendar *)getResourceCalendar;

-(void)addResourceAssignment:(ResourceAssignment *)assignment;

@end
