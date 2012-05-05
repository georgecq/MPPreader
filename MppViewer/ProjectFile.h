//
//  ProjectFile.h
//  mppParser
//
//  Created by George on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectListener.h"

@class Task;
@class FileCreationRecord;
@class ProjectCalendar;
@class ProjectHeader;
@class Resource;
@class ResourceAssignment;
@class Relation;
@class TaskField;
@class MPPDuration;
@class ResourceField;
@class View;
@class Table;
@class Filter;
@class Group;
@class GraphicalIndicator;
@class SubProject;
@class ViewState;
@class CustomFieldValueItem;

@protocol FieldType;

@interface ProjectFile : NSObject
{
    NSMutableArray *_allResources;
    NSMutableArray *_allTasks;
    NSMutableArray *_childTasks;
    NSMutableArray *_allResourceAssignments;
    NSMutableArray *_baseCalendars;
    NSMutableArray *_resourceCalendars;
    NSMutableArray *_projectListeners;
    
    NSMutableArray *_views;
    NSMutableArray *_tables;
    NSMutableArray *_taskFilters;
    NSMutableArray *_resourceFilters;
    NSMutableArray *_groups;
    NSMutableArray *_allSubProjects;
    
    NSMutableDictionary *_taskUniqueIDMap;
    NSMutableDictionary *_taskIDMap;
    NSMutableDictionary *_resourceUniqueIDMap;
    NSMutableDictionary *_resourceIDMap;
    NSMutableDictionary *_calendarUniqueIDMap;
    NSMutableDictionary *_taskFieldAlias;
    NSMutableDictionary *_aliasTaskField;
    NSMutableDictionary *_taskFieldValueList;
    NSMutableDictionary *_taskFieldDescriptionList;
    NSMutableDictionary *_resourceFieldAlias;
    NSMutableDictionary *_aliasResourceField;
    NSMutableDictionary *_graphicalIndicators;
    NSMutableDictionary *_taskTablesByName;
    NSMutableDictionary *_resourceTablesByName;
    NSMutableDictionary *_filtersByName;
    NSMutableDictionary *_filtersByID;
    NSMutableDictionary *_groupsByName;
    NSMutableDictionary *_customFieldValueItems;
    
    int _taskUniqueID;
    int _calendarUniqueID;
    int _assignmentUniqueID;
    int _taskID;
    int _resourceUniqueID;
    int _resourceID;
    int _mppFileType;
    
    Byte _encryptionKey;
    
    FileCreationRecord *_fileCreationRecord;
    ProjectHeader *_projectHeader;
}

// Gets or Sets the file delimiter character.
@property (strong, nonatomic) NSString *delimiter;

// Gets or Sets whether WBS numbers are automatically created.
@property (nonatomic) Boolean autoWBS;

// Gets or Sets whether outline level numbers are automatically created.
@property (nonatomic) Boolean autoOutlineLevel;

// Gets or Sets whether outline numbers are automatically created.
@property (nonatomic) Boolean autoOutlineNumber;

// Gets or Sets whether the task unique ID field is automatically populated.
@property (nonatomic) Boolean autoTaskUniqueID;

// Gets or Sets whether the calendar unique ID field is automatically populated.
@property (nonatomic) Boolean autoCalendarUniqueID;

// Gets or Sets whether the assignment unique ID field is automatically populated.
@property (nonatomic) Boolean autoAssignmentUniqueID;

// Gets or Sets whether the task ID field is automatically populated.
@property (nonatomic) Boolean autoTaskID;

// Gets or Sets whether the resource unique ID field is automatically populated.
@property (nonatomic) Boolean autoResourceUniqueID;

// Gets or Sets whether the resource ID field is automatically populated.
@property (nonatomic) Boolean autoResourceID;

// Gets or sets the details of the sub project file used as a resource pool.
@property (strong, nonatomic) SubProject *resourceSubProject;

// Gets or Sets whether the auto filter is enabled.
@property (nonatomic) Boolean autoFilter;

// Gets or Sets the saved view state associated with this file.
@property (strong, nonatomic) ViewState *viewState;

// Gets or Sets whether the data is encoded in the file.
@property (nonatomic) Boolean encoded;

// Gets or Sets the project file path.
@property (strong, nonatomic) NSString *projectFilePath;

// Gets or Sets the file type.
@property (nonatomic) int mppFileType;

-(void)addTask:(Task *) task;

-(Task *)addTask;

-(void)removeTask:(Task *) task;

-(void)renumberTaskIDs;

-(void)renumberResourceIDs;

-(void)renumberTaskUniqueIDs;

-(void)renumberResourceUniqueIDs;

-(void)renumberAssignmentUniqueIDs;

-(void)renumberCalendarUniqueIDs;

-(void)validateUniqueIDsForMicrosoftProject;

-(void)synchronizeTaskIDToHierarchy;

-(int)synchroizeTaskIDToHierarchy:(Task *)parentTask withId:(int)currentID;

-(NSMutableArray *)getChildTasks;

-(NSMutableArray *)getAllTasks;

-(int)getTaskUniqueID;

-(int)getCalendarUniqueID;

-(int)getAssignmentUniqueID;

-(int)getTaskID;

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

-(void)removeResource:(Resource *)resource;

-(NSMutableArray *)getAllResources;

-(NSMutableArray *)getAllResourceAssignments;

-(void)addResourceAssignment:(ResourceAssignment *)assignment;

-(void)removeResourceAssignment:(ResourceAssignment *)assignment;

-(ResourceAssignment *)newResourceAssignment:(Task *)task;

-(ProjectCalendar *)getBaseCalendar:(NSString *)calendarName;

-(ProjectCalendar *)getBaseCalendarByUniqueID:(int)calendarID;

-(int)getChildTaskCount;

-(MPPDuration *)getDuration:(NSDate *)startDate to:(NSDate *)endDate;

-(MPPDuration *)getDuration:(NSString *)calendarName starting:(NSDate *)startDate ending:(NSDate *)endDate;

-(Task *)getTaskByID:(int)iD;

-(Task *)getTaskByUniqueID:(int)iD;

-(Resource *)getResourceByID:(int)iD;

-(Resource *)getResourceByUniqueID:(int)iD;

-(void)updateStructure;

-(void)updateUniqueCounters;

-(NSDate *)getStartDate;

-(NSDate *)getFinishDate;

-(void)fireTaskReadEvent:(Task *)task;

-(void)fireTaskWrittenEvent:(Task *)task;

-(void)fireResourceReadEvent:(Resource *)resource;

-(void)fireResourceWrittenEvent:(Resource *)resource;

-(void)fireCalendarReadEvent:(ProjectCalendar *)calendar;

-(void)fireAssignmentReadEvent:(ResourceAssignment *)resourceAssignment;

-(void)fireAssignmentWrittenEvent:(ResourceAssignment *)resourceAssignment;

-(void)fireRelationReadEvent:(Relation *)relation;

-(void)fireRelationWrittenEvent:(Relation *)relation;

-(void)fireCalendarWrittenEvent:(ProjectCalendar *)calendar;

-(void)addProjectListener:(id<ProjectListener>)listener;

-(void)addProjectListeners:(NSMutableArray *)listeners;

-(void)removeProjectListener:(id<ProjectListener>)listener;

-(void)setTaskFieldAlias:(TaskField *)field with:(NSString *)alias;

-(NSString *)getTaskFieldAlias:(TaskField *)field;

-(TaskField *)getAliasTaskField:(NSString *)alias;

-(void)setTaskFieldValueList:(TaskField *)field withList:(NSMutableArray *)values;

-(NSMutableArray *)getTaskFieldValueList:(TaskField *)field;

-(void)setTaskFieldDescriptionList:(TaskField *)field witList:(NSMutableArray *)descriptions;

-(NSMutableArray *)getTaskFieldDescriptionList:(TaskField *)field;

-(void)setResourceFieldAlias:(ResourceField *)field withAlias:(NSString *)alias;

-(NSString *)getResourceFieldAlias:(ResourceField *)filed;

-(ResourceField *)getAliasResourceField:(NSString *)alias;

-(NSMutableDictionary *)getTaskFieldAliasMap;

-(NSMutableDictionary *)getResourceFieldAliasMap;

-(void)unmapTaskUniqueID:(NSNumber *)identifier;

-(void)mapTaskUniqueID:(NSNumber *)identifier withTask:(Task *)task;

-(void)unmapTaskID:(NSNumber *)identifier;

-(void)mapTaskID:(NSNumber *)identifier withTask:(Task *)task;

-(void)unmapResourceUniqueID:(NSNumber *)identifier;

-(void)mapResourceUniqueID:(NSNumber *)identifier withResource:(Resource *)resource;

-(void)unmapResourceID:(NSNumber *)identifier;

-(void)mapResourceID:(NSNumber *)identifier withResource:(Resource *)resource;

-(void)unmapCalendarUniqueID:(NSNumber *)identifier;

-(void)mapCalendarUniqueID:(NSNumber *)identifier withResource:(ProjectCalendar *)resource;

-(void)addView:(View *)view;

-(NSMutableArray *)getViews;

-(void)addTable:(Table *)table;

-(NSMutableArray *)getTables;

-(void)addFilter:(Filter *)filter;

-(void)removeFilter:(NSString *)filterName;

-(NSMutableArray *)getAllResourceFilters;

-(NSMutableArray *)getAllTaskFilters;

-(Filter *)getFilterByName:(NSString *)name;

-(Filter *)getFilterByID:(NSNumber *)identifier;

-(NSMutableArray *)getAllGroups;

-(Group *)getGroupByName:(NSString *)name;

-(void)addGroup:(Group *)group;

-(void)addGraphicalIndicator:(id<FieldType>)field withIndicator:(GraphicalIndicator *)indicator;

-(GraphicalIndicator *)getGraphicalIndicator:(id<FieldType>)field;

-(Table *)getTaskTableByName:(NSString *)name;

-(Table *)getResourceTableByName:(NSString *)name;

-(void)addSubProject:(SubProject *)project;

-(NSMutableArray *)getAllSubProjects;

-(void)setEncryptionCode:(Byte)encriptionKey;

-(Byte)getEncryptionCode;

-(void)addCustomFieldValue:(CustomFieldValueItem *)item;

-(CustomFieldValueItem *)getCustomFieldValueItem:(NSNumber *)uniqueID;

-(ProjectCalendar *)getCalendar;

-(void)setCalendar:(ProjectCalendar *)calendar;

-(ProjectCalendar *)getBaseCalendar;

@end
