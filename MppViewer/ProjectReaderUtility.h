//
//  ProjectReaderUtility.h
//  MppViewer
//
//  Created by Julián! on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectReader.h"

@interface ProjectReaderUtility : NSObject

+(id<ProjectReader>)getProjectReader:(NSString *)name;

+(NSMutableArray *)getSupportedFileExtensions;

@end
