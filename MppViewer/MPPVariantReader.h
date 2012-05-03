//
//  MPPVariantReader.h
//  MppViewer
//
//  Created by Julián! on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pole.h"

@class MPPReader;
@class ProjectFile;

@protocol MPPVariantReader <NSObject>

-(void)process:(MPPReader *)reader withProjectFile:(ProjectFile *)file withStorage:(POLE::Storage*) storage;

@end
