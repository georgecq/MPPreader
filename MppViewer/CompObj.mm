
//
//  CompObj.m
//  MppViewer
//
//  Created by Julián! on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CompObj.h"
#import <fstream>
#import <iostream>

@implementation CompObj

/**
 * Constructor. Reads and processes the block data.
 *
 * @param is input stream
 * @throws IOException on read failure
 */

-(id)init:(POLE::Stream *)is
{
    self = [super init];
    if(self)
    {   
        int length;
        unsigned char buffer[28];
        is->read(buffer, sizeof( buffer ));
        length = [self readInt:is];
        
        unsigned char *array = [self readByteArray:is withSize:length];
        
        _applicationName = [[NSString alloc] initWithBytes:array length:length encoding:NSASCIIStringEncoding];
        
        if(_applicationName != nil && [_applicationName isEqualToString:@"Microsoft Project 4.0"] == YES)
        {
            #warning Format Not Supported in this version 
            _fileformat = @"MSProject.MPP4";
            _applicationID = @"MSProject.Project.4";
        }
        else
        {
            length = [self readInt:is];
            unsigned char *format = [self readByteArray:is withSize:length];
            
            _fileformat = [[NSString alloc] initWithBytes:format length:length encoding:NSASCIIStringEncoding];
            
            length = [self readInt:is];
            if(length > 0)
            {
                unsigned char *appID = [self readByteArray:is withSize:length];
                
                _applicationID = [[NSString alloc] initWithBytes:appID length:length encoding:NSASCIIStringEncoding];
            }
        }
    }
    
    return self;
}

/**
 * Accessor method to retrieve the application name.
 *
 * @return Name of the application
 */

-(NSString *)getApplicationName
{
    return _applicationName;
}

/**
 * Accessor method to retrieve the application ID.
 *
 * @return Application ID
 */

-(NSString *)getApplicationID
{
    return _applicationID;
}

/**
 * Accessor method to retrieve the file format.
 *
 * @return File format
 */

-(NSString *)getFileFormat
{
    return _fileformat;
}

@end
