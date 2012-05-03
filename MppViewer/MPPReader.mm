//
//  MPPReader.m
//  MppViewer
//
//  Created by Julián! on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MPPReader.h"
#import "MPP14Reader.h"
#import "ProjectFile.h"
#import "StreamHelper.h"
#import "CompObj.h"
#import "Relation.h"
#import "Task.h"
#import "pole.h"

@implementation MPPReader

@synthesize preserveNoteFormatting;
@synthesize useRawTimphasedDate;
@synthesize readPresentationData;
@synthesize readPassword;
@synthesize writePassword;

static NSMutableDictionary *FILE_CLASS_MAP = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                               [MPP14Reader class], @"MSProject.MPP14",
                                               [MPP14Reader class], @"MSProject.MPT14", 
                                               [MPP14Reader class], @"MSProject.GLOBAL14", nil];
-(id)init
{
    self = [super init];
    if(self)
    {
        [self setReadPresentationData:true];
    }
    return self;
}

-(void)addProjectListener:(id<ProjectListener>)listener
{
    if(_projectListener == nil)
    {
        _projectListener = [[NSMutableArray alloc]init];
    }
    [_projectListener addObject:listener];
}

-(ProjectFile *)read:(NSString *)fileName
{
    @try 
    {
        ProjectFile *projectFile = [[ProjectFile alloc]init];
        
        #warning incomplete set values to projectFile
        
        const char* file = [fileName UTF8String]; 
        POLE::Storage* storage = new POLE::Storage(file);
        storage->open();
        if( storage->result() != POLE::Storage::Ok )
        {
            #warning  throw exception
        }
        
        POLE::Stream *stream = StreamHelper::getStream(storage, (char *)"CompObj");
        CompObj *compObj = [[CompObj alloc]init:stream];
        NSString *formatASCII = [compObj getFileFormat];
        NSString *format = nil;
        
        for (NSString *temp in [FILE_CLASS_MAP allKeys]) 
        {
            if([temp compare:formatASCII options:NSASCIIStringEncoding])
            {
                format = temp;
                break;
            }
        }
        
        Class readerClass = [FILE_CLASS_MAP objectForKey:format];
        if(readerClass == nil)
        {
            #warning  throw exception
        }
        
        id<MPPVariantReader> reader = [[readerClass alloc]init];
        [reader process:self withProjectFile:projectFile withStorage:storage];
        
        #warning setvalues to project file
        
        #warning Incomplete logic related to ProjectFile
        
        delete stream;
        return projectFile;
    }
    @catch (NSException *exception) 
    {
        #warning throw exception
    }
}

-(void)validateRelations:(Task *)task
{
    NSMutableArray *predecessors = [task getPredecessors];
    if(predecessors != nil)
    {
        NSMutableArray *invalid = [[NSMutableArray alloc]init];
        for (Relation *relation in predecessors) 
        {
            Task *sourceTask = [relation getSourceTask];
            Task *targetTask = [relation getTargetTask];
            
            NSString *sourceOutlineNumber = [sourceTask getOutlineNumber];
            NSString *targetOutlineNumber = [targetTask getOutlineNumber];
            
            //if(sourceOutlineNumber != nil && targetOutlineNumber != nil && 
            #warning Incomplete
        }
        
        for (Relation *relation in invalid) 
        {
            [[relation getSourceTask]removePredecessor:[relation getTargetTask] withType:[relation getType] withLag:[relation getLag]];
        }
    }
}

@end
