//
//  ResourceAssignment.h
//  mppParser
//
//  Created by George on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Task;
@class Resource;
@class ProjectFile;
@class MPPDuration;

@interface ResourceAssignment : NSObject

-(id)init:(ProjectFile *)file with:(Task *)task;

-(Task*) getTask;

-(NSNumber *)getUniqueID;

-(void)setUniqueID:(NSNumber *)val;

-(Resource*)getResource;

-(NSNumber *)getResourceUniqueID;

-(void)setTaskUniqueID:(NSNumber *)val;

-(void)setUnits:(NSNumber *)val;

-(void)setWork:(MPPDuration *)dur;

-(void)setResourceUniqueID:(NSNumber *)val;

+(double)DEFAULT_UNITS;

@end
