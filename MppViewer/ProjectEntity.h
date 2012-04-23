//
//  ProjectEntity.h
//  MppViewer
//
//  Created by Fernando Araya on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProjectFile;

@interface ProjectEntity : NSObject
{
    ProjectFile *_mpx;
}

-(id)init:(ProjectFile *)mpx;

-(ProjectFile *)getParentFile;

@end
