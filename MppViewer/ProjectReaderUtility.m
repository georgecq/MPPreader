//
//  ProjectReaderUtility.m
//  MppViewer
//
//  Created by Julián! on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProjectReaderUtility.h"
#import "MPPReader.h"
#import "ProjectReader.h"

@implementation ProjectReaderUtility

static NSMutableDictionary *_READER_MAP = nil;

+(id<ProjectReader>)getProjectReader:(NSString *)name 
{
    NSString *extension = [name pathExtension];
    if([extension isEqualToString:@""] == YES)
    {
        #warning throw exception
    }
    
    extension =  [extension uppercaseString];
    Class fileClass = [[self READER_MAP] objectForKey:extension];
    if(fileClass == nil)
    {
        #warning throw exception
    }
    
    id<ProjectReader> file = [[fileClass alloc]init];
    return file;
}

+(NSMutableDictionary *)READER_MAP
{
    if(_READER_MAP == nil)
    {
        _READER_MAP = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                       [MPPReader class], @"MPP", nil];
    }
    return _READER_MAP;
}

@end
