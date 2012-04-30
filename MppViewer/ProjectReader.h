//
//  ProjectReader.h
//  MppViewer
//
//  Created by Julián! on 4/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProjectFile;
@protocol ProjectListener;

@protocol ProjectReader <NSObject>

/**
 * Add a listener to receive events as a project is being read.
 * 
 * @param listener ProjectListener instance
 */
-(void)addProjectListener:(id<ProjectListener>)listener;

/**
 * Read a file where the file name is supplied.
 *
 * @param fileName file name
 * @return ProjectFile instance
 * @throws MPXJException
 */
-(ProjectFile *)read:(NSString *)fileName;

/**
 * Read a file where a File instance is supplied.
 *
 * @param file File instance
 * @return ProjectFile instance
 * @throws MPXJException
 */
//-(ProjectFile *)read(File file) throws MPXJException;

/**
 * Read a file where the contents of the project file
 * are supplied via an input stream.
 *
 * @param inputStream InputStream instance
 * @return ProjectFile instance
 * @throws MPXJException
 */
-(ProjectFile *)readWithStream:(NSInputStream *)inputStream;

@end
