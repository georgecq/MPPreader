//
//  MPP14Reader.h
//  MppViewer
//
//  Created by Julián! on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MPPVariantReader.h"
#import "VarMeta.h"

@class MPPReader;
@class ProjectFile;
@class Props14;
@class Var2Data;

@interface MPP14Reader : NSObject <MPPVariantReader>
{
    MPPReader *_reader;
    ProjectFile *_file;
    POLE::Storage *_storage;
    NSMutableDictionary *_resourceMap;
    Var2Data *_outlineCodeVarData;
    id<VarMeta> _outlineCodeVarMeta;
    Props14 *_projectProps;
    NSMutableDictionary *_fontBases;
    NSMutableDictionary *_taskSubProjects;
    NSMutableDictionary *_parentTasks;
    NSMutableDictionary *_taskOrder;
    NSMutableDictionary *_nullTaskOrder;
}

@end
