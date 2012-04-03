//
//  ProjectFile.h
//  mppParser
//
//  Created by George on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Task;
@class FileCreationRecord;
@class ProjectCalendar;
@class ProjectHeader;
@class Resource;
@class ResourceAssignment;
@class Relation;
@class TaskField;

@interface ProjectFile : NSObject
{
    NSMutableArray *_allTasks;
    NSMutableArray *_childTasks;
    NSMutableArray *_allResourceAssignments;
    NSMutableArray *_allResources;
    NSMutableArray *_baseCalendars;
    NSMutableArray *_resourceCalendars;
    
    NSMutableDictionary *_taskUniqueIDMap;
    NSMutableDictionary *_taskIDMap;
    NSMutableDictionary *_resourceUniqueIDMap;
    NSMutableDictionary *_resourceIDMap;
    NSMutableDictionary *_calendarUniqueIDMap;
    NSMutableDictionary *_taskFieldAlias;
    NSMutableDictionary *_aliasTaskField;
    NSMutableDictionary *_taskFieldValueList;
    NSMutableDictionary *_taskFieldDescriptionList;
    
    int _taskUniqueID;
    int _calendarUniqueID;
    int _assignmentUniqueID;
    int _taskID;
    int _resourceUniqueID;
    int _resourceID;
    
    FileCreationRecord *_fileCreationRecord;
    ProjectHeader *_projectHeader;
}

// Gets or Sets the file delimiter character.
@property (strong, nonatomic) NSString *Delimiter;

// Gets or Sets whether WBS numbers are automatically created.
@property (nonatomic) Boolean AutoWBS;

// Gets or Sets whether outline level numbers are automatically created.
@property (nonatomic) Boolean AutoOutlineLevel;

// Gets or Sets whether outline numbers are automatically created.
@property (nonatomic) Boolean AutoOutlineNumber;

// Gets or Sets whether the task unique ID field is automatically populated.
@property (nonatomic) Boolean AutoTaskUniqueID;

// Gets or Sets whether the calendar unique ID field is automatically populated.
@property (nonatomic) Boolean AutoCalendarUniqueID;

// Gets or Sets whether the assignment unique ID field is automatically populated.
@property (nonatomic) Boolean AutoAssignmentUniqueID;

// Gets or Sets whether the task ID field is automatically populated.
@property (nonatomic) Boolean AutoTaskID;

// Gets or Sets whether the resource unique ID field is automatically populated.
@property (nonatomic) Boolean AutoResourceUniqueID;

// Gets or Sets whether the resource ID field is automatically populated.
@property (nonatomic) Boolean AutoResourceID;

-(void)addTask:(Task *) task;

-(Task *)addTask;

-(void)removeTask:(Task *) task;

-(void)renumberTaskIDs;

-(void)renumberResourceIDs;

-(void)renumberTaskUniqueIDs;

-(void)renumberResourceUniqueIDs;

-(void)renumberAssignmentUniqueIDs;

-(void) renumberCalendarUniqueIDs;

-(void)validateUniqueIDsForMicrosoftProject;

-(void)synchronizeTaskIDToHierarchy;

-(int)synchroizeTaskIDToHierarchy:(Task *)parentTask withId:(int)currentID;

-(NSMutableArray *)getChildTasks;

-(NSMutableArray *)getAllTasks;

-(int)getTaskUniqueID;

-(int)getCalendarUniqueID;

-(int)getAssignmentUniqueID;

-(int) getTaskID;

-(int)getResourceUniqueID;

-(int)getResourceID;

-(FileCreationRecord *)getFileCreationRecord;

-(ProjectCalendar *)addResourceCalendar;

-(ProjectCalendar *)addBaseCalendar;

-(void)removeCalendar:(ProjectCalendar *)calendar;

-(ProjectCalendar *)addDefaultBaseCalendar;

-(ProjectCalendar *)getDefaultResourceCalendar;

-(NSMutableArray *)getBaseCalendars;

-(NSMutableArray *)getResourceCalendars;

-(ProjectHeader *)getProjectHeader;

-(Resource *)addResource;

-(NSMutableArray *)getAllResources;

-(NSMutableArray *)getAllResourceAssignments;

-(void)addResourceAssignment:(ResourceAssignment *)assignment;

-(void)removeResourceAssignment:(ResourceAssignment *)assignment;

-(ResourceAssignment *)newResourceAssignment:(Task *)task;

-(ProjectCalendar *)getBaseCalendar:(NSString *)calendarName;

-(ProjectCalendar *)getBaseCalendarByUniqueID:(int)calendarID;

-(int)getChildTaskCount;

-(Duration)getDuration:(NSDate *)startDate to:(NSDate *)endDate;

-(Duration)getDuration:(NSString *)calendarName starting:(NSDate *)startDate ending:(NSDate *)endDate;

-(Task *)getTaskByID:(int)iD;

-(Task *)getTaskByUniqueID:(int) iD;

-(Resource *)getResourceByID:(int)iD;

-(Resource *)getResourceByUniqueID:(int) iD;

-(void)updateStructure;

-(void)updateUniqueCounters;

-(NSDate *)getStartDate;

-(NSDate *)getFinishDate;

-(void)fireTaskReadEvent:(Task *)task;

-(void)fireTaskWrittenEvent:(Task *)task;

-(void)fireResourceReadEvent:(Resource *)resource;

-(void)fireResourceWrittenEvent:(Resource *)resource;

-(void)fireCalendarReadEvent:(ProjectCalendar *)calendar;

-(void)fireAssignmentWrittenEvent:(ResourceAssignment *)resourceAssignment;

-(void)fireRelationReadEvent:(Relation *)relation;

-(void)fireRelationWrittenEvent:(Relation *)relation;

-(void)fireCalendarWrittenEvent:(ProjectCalendar *)calendar;

-(void)setTaskFieldAlias:(TaskField *)field with:(NSString *)alias;

-(NSString *)getTaskFieldAlias:(TaskField *)field;

-(TaskField *)getAliasTaskField:(NSString *)alias;

-(void)setTaskFieldValueList:(TaskField *)field withList:(NSMutableArray *)values;

-(NSMutableArray *)getTaskFieldValueList:(TaskField *)field;

-(void)setTaskFieldDescriptionList:(TaskField *)field witList:(NSMutableArray *)descriptions;

-(NSMutableArray *)getTaskFieldDescriptionList:(TaskField *)field;

@end
