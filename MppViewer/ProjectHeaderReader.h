//
//  ProjectHeaderReader.h
//  MppViewer
//
//  Created by Julián! on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pole.h"

@class ProjectFile;
@class Props;

@interface ProjectHeaderReader : NSObject

-(void)process:(ProjectFile *)file withProps:(Props *)props withStorage:(POLE::Storage*) storage;

@end
