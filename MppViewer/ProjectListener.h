//
//  ProjectListener.h
//  MppViewer
//
//  Created by Julián! on 4/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Task;
@class Resource;
@class ProjectCalendar;
@class ResourceAssignment;
@class Relation;

@protocol ProjectListener <NSObject>

/**
 * This method is called when a task is read from a file.
 *
 * @param task task instance
 */
-(void)taskRead:(task *)task;

/**
 * This method is called when a task is written to a file.
 *
 * @param task task instance
 */
-(void)taskWritten:(Task *)task;

/**
 * This method is called when a resource is read from a file.
 *
 * @param resource resource instance
 */
-(void)resourceRead:(Resource *)resource;

/**
 * This method is called when a resource is written to a file.
 *
 * @param resource resource instance
 */
-(void)resourceWritten:(Resource *)resource;

/**
 * This method is called when a calendar is read from a file.
 *
 * @param calendar calendar instance
 */
-(void)calendarRead:(ProjectCalendar *)calendar;

/**
 * This method is called when a calendar is written to a file.
 * 
 * @param calendar calendar instance
 */
-(void)calendarWritten:(ProjectCalendar *)calendar;

/**
 * This method is called when an assignment is read from a file.
 *
 * @param assignment resource assignment
 */
-(void)assignmentRead:(ResourceAssignment *)assignment;

/**
 * This method is called when an assignment is written to a file.
 * 
 * @param assignment assignment instance
 */
-(void)assignmentWritten:(ResourceAssignment *)assignment;

/**
 * This method is called when a relation is read from a file.
 *
 * @param relation relation instance
 */
-(void)relationRead:(Relation *)relation;

/**
 * This method is called when a relation is written to a file.
 * 
 * @param relation relation instance
 */
-(void)relationWritten:(Relation *)relation;

@end
