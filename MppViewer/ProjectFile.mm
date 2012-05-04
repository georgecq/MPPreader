//
//  ProjectFile.m
//  mppParser
//
//  Created by George on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProjectFile.h"

#import "Task.h"
#import "Table.h"
#import "ResourceAssignment.h"
#import "Resource.h"
#import "ProjectCalendar.h"
#import "FileCreationRecord.h"
#import "Day.h"
#import "DayType.h"
#import "Filter.h"
#import "ProjectHeader.h"
#import "Relation.h"
#import "TaskField.h"
#import "NumberUtility.h"
#import "MPPDuration.h"
#import "ProjectListener.h"

@implementation ProjectFile

@synthesize delimiter;
@synthesize autoWBS;
@synthesize autoOutlineLevel;
@synthesize autoOutlineNumber;
@synthesize autoTaskUniqueID;
@synthesize autoCalendarUniqueID;
@synthesize autoAssignmentUniqueID;
@synthesize autoTaskID;
@synthesize autoResourceUniqueID;
@synthesize autoResourceID;
@synthesize projectFilePath;
@synthesize autoFilter;
@synthesize viewState;
@synthesize resourceSubProject;
@synthesize mppFileType;

int const MS_PROJECT_MAX_UNIQUE_ID = 0x1FFFFF;

-(id)init
{
    self = [super init];
    if(self)
    {
        _allResources = [[NSMutableArray alloc]init];
        _allTasks = [[NSMutableArray alloc]init];
        _childTasks = [[NSMutableArray alloc]init];
        _allResourceAssignments = [[NSMutableArray alloc]init];
        _baseCalendars = [[NSMutableArray alloc]init];
        _resourceCalendars = [[NSMutableArray alloc]init];
        _views = [[NSMutableArray alloc]init];
        _tables = [[NSMutableArray alloc]init];
        _taskFilters = [[NSMutableArray alloc]init];
        _resourceFilters = [[NSMutableArray alloc]init];
        _groups = [[NSMutableArray alloc]init];
        _allsubProjects = [[NSMutableArray alloc]init];
        
        _fileCreationRecord = [[FileCreationRecord alloc]init:self];
        _projectHeader = [[ProjectHeader alloc]init:self];
        
        self.delimiter = @",";
        self.autoWBS = true;
        self.autoOutlineLevel = true;
        self.autoOutlineNumber = true;
        self.autoTaskUniqueID = true;
        self.autoCalendarUniqueID = true;
        self.autoAssignmentUniqueID = true;
        self.autoTaskID = true;
        self.autoResourceUniqueID = true;
        self.autoResourceID = true;
        
        _taskFieldAlias = [[NSMutableDictionary alloc]init];
        _taskFieldValueList = [[NSMutableDictionary alloc]init];
        _taskFieldDescriptionList = [[NSMutableDictionary alloc]init];
        _aliasTaskField = [[NSMutableDictionary alloc]init];
        _resourceFieldAlias = [[NSMutableDictionary alloc]init];
        _aliasResourceField = [[NSMutableDictionary alloc]init];
        _taskUniqueIDMap = [[NSMutableDictionary alloc]init];
        _taskIDMap = [[NSMutableDictionary alloc]init];
        _resourceUniqueIDMap = [[NSMutableDictionary alloc]init];
        _resourceIDMap = [[NSMutableDictionary alloc]init];
        _calendarUniqueIDMap = [[NSMutableDictionary alloc]init];
        _graphicalIndicators = [[NSMutableDictionary alloc]init];
        _taskTablesByName = [[NSMutableDictionary alloc]init];
        _resourceTablesByName = [[NSMutableDictionary alloc]init];
        _filtersByName = [[NSMutableDictionary alloc]init];
        _filtersByID = [[NSMutableDictionary alloc]init];
        _groupsByName = [[NSMutableDictionary alloc]init];
        _customFieldValueItems = [[NSMutableDictionary alloc]init];
    }
    return self;
}


// This method is provided to allow child tasks that have been created
// programmatically to be added as a record to the main file.
//
// @param task task created as a child of another task
//
-(void)addTask:(Task *) task
{
    [_allTasks addObject:task];
}


// This method allows a task to be added to the file programatically.
//
// @return new task object

-(Task *)addTask
{
    Task * task = [[Task alloc]init:self withParent:nil];
    [_allTasks addObject:task];
    [_childTasks addObject:task];
    return task;
}


// This method is used to remove a task from the project.
//
// @param task task to be removed

-(void)removeTask:(Task *) task
{
    //
    // Remove the task from the file and its parent task
    //
    [_allTasks removeObject:task];
    [_taskUniqueIDMap removeObjectForKey:[NSString stringWithFormat:@"%d", [[task getUniqueID]intValue]]];
    [_taskIDMap removeObjectForKey:[NSString stringWithFormat:@"%d", [[task getID]intValue]]];
    
    Task *parentTask = [task getParentTask];
    if (parentTask != nil)
    {
        [parentTask removeChildTask:task];
    }
    else
    {
        [_childTasks removeObject:task];
    }
    
    //
    // Remove all resource assignments
    //
    for (ResourceAssignment *assignment in _allResourceAssignments) {
        if ([[task getID]intValue] == [[[assignment getTask]getID] intValue])
        {
            Resource *rsc = [assignment getResource];
            if (rsc  != nil)
            {
                [rsc removeResourceAssignment:assignment];
            }
            [_allResourceAssignments removeObject:assignment];
        }
    }
    
    //
    // Recursively remove any child tasks
    //
    while (true)
    {
        NSMutableArray* childTaskList = [task getChildTasks];
        if ([childTaskList count] == 0 )
        {
            break;
        }
        [self removeTask:[childTaskList objectAtIndex:0]];
    }
}


// This method can be called to ensure that the IDs of all
// tasks in this project are sequential, and start from an
// appropriate point. If tasks are added to and removed from
// the list of tasks, then the project is loaded into Microsoft
// project, if the ID values have gaps in the sequence, there will
// be blank task rows shown.

-(void)renumberTaskIDs
{
    if ([_allTasks count] != 0)
    {
        #warning sort using CompareTo of Task
        NSSortDescriptor *sortDescriptor;
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"ID" ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        _allTasks = [[_allTasks sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
        
        Task *firstTask = [_allTasks objectAtIndex:0];
        int identifier = [NumberUtility getInt:[firstTask getID]];
        if (identifier != 0)
        {
            identifier = 1;
        }
        
        for (Task *actTask in _allTasks)
        {
            [actTask setID:[NSNumber numberWithInt:identifier++]];
        }
    }
}

// This method can be called to ensure that the IDs of all
// resources in this project are sequential, and start from an
// appropriate point. If resources are added to and removed from
// the list of resources, then the project is loaded into Microsoft
// project, if the ID values have gaps in the sequence, there will
// be blank resource rows shown.

-(void)renumberResourceIDs
{
    if ([_allResources count] != 0)
    {
        #warning sort using CompareTo of Resource
        NSSortDescriptor *sortDescriptor;
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"ID" ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        _allResources = [[_allResources sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
        
        int identifier = 1;
        for (Resource *rsc in _allResources)
        {
            [rsc setID:[NSNumber numberWithInt:identifier++]];
        }
    }
}


// Renumbers all task unique IDs.

-(void)renumberTaskUniqueIDs
{
    Task *firstTask = [self getTaskByID:0];
    int uid = firstTask == nil ? 1: 0;
    
    for (Task *task in _allTasks)
    {
        [task setUniqueID:[NSNumber numberWithInt:uid++]];
    }
}


// Renumbers all resource unique IDs.

-(void)renumberResourceUniqueIDs
{
    int uid = 1;
    for (Resource *rsc in _allResources)
    {
        [rsc setUniqueID:[NSNumber numberWithInt:uid++]];
    }
}


// Renumbers all assignment unique IDs.

-(void)renumberAssignmentUniqueIDs
{
    int uid = 1;
    for (ResourceAssignment *assignment in _allResourceAssignments)
    {
        [assignment setUniqueID:[NSNumber numberWithInt:uid++]];
    }
}


// Renumbers all calendar unique IDs.

-(void)renumberCalendarUniqueIDs
{
    int uid = 1;
    for (ProjectCalendar *calendar in _baseCalendars)
    {
        [calendar setUniqueID:[NSNumber numberWithInt:uid++]];
    }
    
    for (ProjectCalendar *calendar in _resourceCalendars)
    {
        [calendar setUniqueID:[NSNumber numberWithInt:uid++]];
    }
}


// This method is called to ensure that all unique ID values
// held by MPXJ are within the range supported by MS Project.
// If any of these values fall outside of this range, the unique IDs
// of the relevant entities are renumbered.

-(void)validateUniqueIDsForMicrosoftProject
{
    if ([_allTasks count] != 0)
    {
        for (Task *task in _allTasks)
        {
            if ([NumberUtility getInt:[task getUniqueID]] > MS_PROJECT_MAX_UNIQUE_ID)
            {
                [self renumberTaskIDs];
                break;
            }
        }
    }
    
    if ([_allResources count] != 0)
    {
        for (Resource *resource in _allResources)
        {
            if ([NumberUtility getInt:[resource getUniqueID]] > MS_PROJECT_MAX_UNIQUE_ID)
            {
                [self renumberResourceUniqueIDs];
                break;
            }
        }
    }
    
    if ([_allResourceAssignments count] != 0)
    {
        for (ResourceAssignment *assignment in _allResourceAssignments)
        {
            if ([NumberUtility getInt:[assignment getUniqueID]] > MS_PROJECT_MAX_UNIQUE_ID)
            {
                [self renumberAssignmentUniqueIDs];
                break;
            }
        }
    }
    
    if ([_baseCalendars count] != 0)
    {
        for (ProjectCalendar *calendar in _baseCalendars)
        {
            if ([NumberUtility getInt:[calendar getUniqueID]] > MS_PROJECT_MAX_UNIQUE_ID)
            {
                [self renumberCalendarUniqueIDs];
                break;
            }
        }
    }
    
    if ([_resourceCalendars count] != 0)
    {
        for (ProjectCalendar *calendar in _resourceCalendars)
        {
            if ([NumberUtility getInt:[calendar getUniqueID]] > MS_PROJECT_MAX_UNIQUE_ID)
            {
                [self renumberCalendarUniqueIDs];
                break;
            }
        }
    }
}


// Microsoft Project bases the order of tasks displayed on their ID
// value. This method takes the hierarchical structure of tasks
// represented in MPXJ and renumbers the ID values to ensure that
// this structure is displayed as expected in Microsoft Project. This
// is typically used to deal with the case where a hierarchical task
// structure has been created programatically in MPXJ.  

-(void)synchronizeTaskIDToHierarchy
{
    [_allTasks removeAllObjects];
    
    int currentID = [self getTaskByID:0] == nil ? 1: 0;
    for (Task *task in _childTasks)
    {
        [task setID:[NSNumber numberWithInt:currentID++]];
        [_allTasks addObject:task];
        currentID = [self synchroizeTaskIDToHierarchy:task withId:currentID];
    }
}


// Called recursively to renumber child task IDs.
// 
// @param parentTask parent task instance
// @param currentID current task ID
// @return updated current task ID

-(int)synchroizeTaskIDToHierarchy:(Task *)parentTask withId:(int)currentID
{
    for (Task *task in [parentTask getChildTasks])
    {
        [task setID:[NSNumber numberWithInt:currentID++]];
        [_allTasks addObject:task];
        currentID = [self synchroizeTaskIDToHierarchy:task withId:currentID];
    }
    return currentID;
}


// This method is used to retrieve a list of all of the top level tasks
// that are defined in this MPX file.
//
// @return list of tasks

-(NSMutableArray *)getChildTasks
{
    return _childTasks;
}


// This method is used to retrieve a list of all of the tasks
// that are defined in this MPX file.
//
// @return list of all tasks

-(NSMutableArray *)getAllTasks
{
    return _allTasks;
}


// This method is used to retrieve the next unique ID for a task.
//
// @return next unique ID

-(int)getTaskUniqueID
{
    return ++_taskUniqueID;
}


// This method is used to retrieve the next unique ID for a calendar.
//
// @return next unique ID

-(int)getCalendarUniqueID
{
    return ++_calendarUniqueID;
}


// This method is used to retrieve the next unique ID for an assignment.
//
// @return next unique ID

-(int)getAssignmentUniqueID
{
    return ++_assignmentUniqueID;
}


// This method is used to retrieve the next ID for a task.
//
// @return next ID

-(int) getTaskID
{
    return ++_taskID;
}



// This method is used to retrieve the next unique ID for a resource.
//
// @return next unique ID

-(int)getResourceUniqueID
{
    return (++_resourceUniqueID);
}


// This method is used to retrieve the next ID for a resource.
//
// @return next ID

-(int)getResourceID
{
    return (++_resourceID);
}


// Retrieves the file creation record.
//
// @return file creation record.

-(FileCreationRecord *)getFileCreationRecord
{
    return (_fileCreationRecord);
}


// This method is provided to create a resource calendar, before it
// has been attached to a resource.
//
// @return new ProjectCalendar instance

-(ProjectCalendar *)addResourceCalendar
{
    ProjectCalendar *calendar = [[ProjectCalendar alloc]init:self];
    [_resourceCalendars addObject:calendar];
    return (calendar);
}

// This method is used to add a new base calendar to the file.
//
// @return new base calendar object

-(ProjectCalendar *)addBaseCalendar
{
    ProjectCalendar *calendar = [[ProjectCalendar alloc]init:self];
    [_baseCalendars addObject:calendar];
    return (calendar);
}


// Removes a base calendar.
//
// @param calendar calendar to be removed

-(void)removeCalendar:(ProjectCalendar *)calendar
{
    if ([_baseCalendars containsObject:calendar])
    {
        [_baseCalendars removeObject:calendar];
    }
    else
    {
        if ([_resourceCalendars containsObject:calendar])
        {
            [_resourceCalendars removeObject:calendar];
            Resource *resource = [calendar getResource];
            if (resource != nil)
            {
                [resource setResourceCalendar:nil];
            }
        }
    }
    [calendar setParent:nil];
}


// This is a convenience method used to add a base calendar called
// "Standard" to the file, and populate it with a default working week
// and default working hours.
//
// @return a new default base calendar

-(ProjectCalendar *)addDefaultBaseCalendar
{
    ProjectCalendar *calendar = [self addBaseCalendar];
    
    [calendar setName:[ProjectCalendar DEFAULT_BASE_CALENDAR_NAME]];
    
    [calendar setWorkingDay:[Day SUNDAY] AsWorking:false];
    [calendar setWorkingDay:[Day MONDAY] AsWorking:true];
    [calendar setWorkingDay:[Day TUESDAY] AsWorking:true];
    [calendar setWorkingDay:[Day WEDNESDAY] AsWorking:true];
    [calendar setWorkingDay:[Day THURSDAY] AsWorking:true];
    [calendar setWorkingDay:[Day FRIDAY] AsWorking:true];
    [calendar setWorkingDay:[Day SATURDAY] AsWorking:false];
    
    [calendar addDefaultCalendarHours];
    
    return calendar;
}


// This is a protected convenience method to add a default resource
// calendar. This is used when the calendar data is available before
// the resource data has been read, a situation which occurs with MPP
// files.
//
// @return new ProjectCalendar instance

-(ProjectCalendar *)getDefaultResourceCalendar
{
    ProjectCalendar *calendar = [[ProjectCalendar alloc]init:self];
    [calendar setWorkingDay:[Day SUNDAY] withType:[DayType DEFAULT]];
    [calendar setWorkingDay:[Day MONDAY] withType:[DayType DEFAULT]];
    [calendar setWorkingDay:[Day TUESDAY] withType:[DayType DEFAULT]];
    [calendar setWorkingDay:[Day WEDNESDAY] withType:[DayType DEFAULT]];
    [calendar setWorkingDay:[Day THURSDAY] withType:[DayType DEFAULT]];
    [calendar setWorkingDay:[Day FRIDAY] withType:[DayType DEFAULT]];
    [calendar setWorkingDay:[Day SATURDAY] withType:[DayType DEFAULT]];
    
    return calendar;
}


// This method retrieves the list of base calendars defined in
// this file.
//
// @return list of base calendars

-(NSMutableArray *)getBaseCalendars
{
    return _baseCalendars;
}


// This method retrieves the list of resource calendars defined in
// this file.
//
// @return list of resource calendars

-(NSMutableArray *)getResourceCalendars
{
    return _resourceCalendars;
}


// This method is used to retrieve the project header record.
//
// @return project header object

-(ProjectHeader *)getProjectHeader
{
    return _projectHeader;
}


// This method is used to add a new resource to the file.
//
// @return new resource object

-(Resource *)addResource
{
    Resource *resource = [[Resource alloc]init:self];
    [_allResources addObject:resource];
    return resource;
}


// This method is used to remove a resource from the project.
//
// @param resource resource to be removed

-(void)removeResource:(Resource *)resource
{
    [_allResources removeObject:resource];
    [_resourceUniqueIDMap removeObjectForKey:[NSString stringWithFormat:@"%d" , [[resource getUniqueID]intValue]]];
    [_resourceIDMap removeObjectForKey:[NSString stringWithFormat:@"%d" , [[resource getID]intValue]]];
    
    NSNumber *resourceUniqueID = [resource getUniqueID];
    for (ResourceAssignment * rscAssig in _allResourceAssignments) 
    {
        if ([resourceUniqueID intValue] == [[rscAssig getResourceUniqueID] intValue])
        {
            [[rscAssig getTask] removeResourceAssignment:rscAssig];
            [_allResourceAssignments removeObject:rscAssig];
        }
    }
    
    ProjectCalendar *calendar = [resource getResourceCalendar];
    if (calendar != nil)
    {
        [calendar remove];
    }
}


// This method is used to retrieve a list of all of the resources
// that are defined in this MPX file.
//
// @return list of all resources

-(NSMutableArray *)getAllResources
{
    return _allResources;
}


// This method is used to retrieve a list of all of the resource assignments
// that are defined in this MPX file.
//
// @return list of all resources

-(NSMutableArray *)getAllResourceAssignments
{
    return _allResourceAssignments;
}


// This method is provided to allow resource assignments that have been
// created programatically to be added as a record to the main file.
//
// @param assignment Resource assignment created as part of a task

-(void)addResourceAssignment:(ResourceAssignment *)assignment
{
    [_allResourceAssignments addObject:assignment];
}


// This method removes a resource assignment from the internal storage
// maintained by the project file.
//
// @param assignment resource assignment to remove

-(void)removeResourceAssignment:(ResourceAssignment *)assignment
{
    [_allResourceAssignments removeObject:assignment];
    [[assignment getTask] removeResourceAssignment:assignment];
    
    Resource *resource = [assignment getResource];
    if (resource != nil)
    {
        [resource removeResourceAssignment:assignment];
    }
}

// This method has been provided to allow the subclasses to
// instantiate ResourecAssignment instances.
//
// @param task parent task
// @return new resource assignment instance

-(ResourceAssignment *)newResourceAssignment:(Task *)task
{
    return [[ResourceAssignment alloc] init:self with:task];
}


// Retrieves the named base calendar. This method will return
// null if the named base calendar is not located.
//
// @param calendarName name of the required base calendar
// @return base calendar object

-(ProjectCalendar *)getBaseCalendar:(NSString *)calendarName
{
    ProjectCalendar *calendar = nil;
    
    if (calendarName != nil && [calendarName length] != 0)
    {
        for (calendar in _baseCalendars) 
        {
            NSString *name = [calendar Name];
            
            if ((name != nil) && ([name compare:calendarName options:NSCaseInsensitiveSearch] == NSOrderedSame))
            {
                break;
            }
            calendar = nil;
        }
    }
    
    return calendar;
}


// Retrieves the base calendar referred to by the supplied unique ID
// value. This method will return null if the required calendar is not
// located.
//
// @param calendarID calendar unique ID
// @return ProjectCalendar instance

-(ProjectCalendar *)getBaseCalendarByUniqueID:(int)calendarID
{
    return [_calendarUniqueIDMap objectForKey:[NSString stringWithFormat:@"%d", calendarID]];
}


// This method is used to retrieve the number of child tasks associated
// with this parent task. This method is used as part of the process
// of automatically generating the WBS.
//
// @return Number of child tasks

-(int)getChildTaskCount
{
    return [_childTasks count];
}


// This method is used to calculate the duration of work between two fixed
// dates according to the work schedule defined in the named calendar. The
// calendar used is the "Standard" calendar. If this calendar does not exist,
// and exception will be thrown.
//
// @param startDate start of the period
// @param endDate end of the period
// @return new Duration object

-(MPPDuration *)getDuration:(NSDate *)startDate to:(NSDate *)endDate
{
    return [self getDuration:@"Standard" starting:startDate ending:endDate];
}


// This method is used to calculate the duration of work between two fixed
// dates according to the work schedule defined in the named calendar.
// The name of the calendar to be used is passed as an argument.
//
// @param calendarName name of the calendar to use
// @param startDate start of the period
// @param endDate end of the period
// @return new Duration object

-(MPPDuration *)getDuration:(NSString *)calendarName starting:(NSDate *)startDate ending:(NSDate *)endDate
{
    ProjectCalendar *calendar = [self getBaseCalendar:calendarName];

    if (calendar == nil)
    {
        [NSException raise:@"Calendar Error" format:@"Error loading the calendar: %@", calendarName];
    }

    return [calendar getDuration:startDate to:endDate];
}


// This method allows an arbitrary task to be retrieved based
// on its ID field.
//
// @param id task identified
// @return the requested task, or null if not found

-(Task *)getTaskByID:(int)iD
{
    return [_taskIDMap objectForKey:[NSString stringWithFormat:@"%d", iD]];
}


// This method allows an arbitrary task to be retrieved based
// on its UniqueID field.
//
// @param id task identified
// @return the requested task, or null if not found

-(Task *)getTaskByUniqueID:(int) iD
{
    return [_taskUniqueIDMap objectForKey:[NSString stringWithFormat:@"%d", iD]];
}


// This method allows an arbitrary resource to be retrieved based
// on its ID field.
//
// @param id resource identified
// @return the requested resource, or null if not found

-(Resource *)getResourceByID:(int)iD
{
    return [_resourceIDMap objectForKey:[NSString stringWithFormat:@"%d", iD]];
}


// This method allows an arbitrary resource to be retrieved based
// on its UniqueID field.
//
// @param id resource identified
// @return the requested resource, or null if not found

-(Resource *)getResourceByUniqueID:(int) iD
{
    return [_resourceUniqueIDMap objectForKey:[NSString stringWithFormat:@"%d",iD]];
}


// This method is used to recreate the hierarchical structure of the
// MPX file from scratch. The method sorts the list of all tasks,
// then iterates through it creating the parent-child structure defined
// by the outline level field.

-(void)updateStructure
{
    if ([_allTasks count] > 1)
    {
        #warning sort Task using CompareTo
        NSSortDescriptor *sortDescriptor;
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"ID" ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        _allTasks = [[_allTasks sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
        
        [_childTasks removeAllObjects];
        
        Task *lastTask = nil;
        int lastLevel = -1;
        for (Task *task in _allTasks)
        {
            [task clearChildTasks];
            Task *parent = nil;
            if (![task getNull])
            {
                int level = [[task getOutlineLevel] intValue];
                
                if (lastTask != nil)
                {
                    if (level == lastLevel || [task getNull])
                    {
                        parent = [lastTask getParentTask];
                        level = lastLevel;
                    }
                    else
                    {
                        if (level > lastLevel)
                        {
                            parent = lastTask;
                        }
                        else
                        {
                            while (level <= lastLevel)
                            {
                                parent = [lastTask getParentTask];
                                
                                if (parent == nil)
                                {
                                    break;
                                }
                                
                                lastLevel = [[parent getOutlineLevel] intValue];
                                lastTask = parent;
                            }
                        }
                    }
                }
                
                lastTask = task;
                lastLevel = level;
                
                if (self.autoWBS || [task getWBS] == nil)
                {
                    [task generateWBS:parent];
                }
                
                if (self.autoOutlineNumber)
                {
                    [task generateOutlineNumber:parent];
                }
            }
            
            if (parent == nil)
            {
                [_childTasks addObject:task];
            }
            else
            {
                [parent addChildTask:task];               
            }
        }
    }
}


// This method is called to ensure that after a project file has been
// read, the cached unique ID values used to generate new unique IDs
// start after the end of the existing set of unique IDs.

-(void)updateUniqueCounters
{
    //
    // Update task unique IDs
    //
    for (Task *task in _allTasks)
    {
        int uniqueID = [[task getUniqueID]intValue];
        if (uniqueID > _taskUniqueID)
        {
            _taskUniqueID = uniqueID;
        }
    }
    
    //
    // Update resource unique IDs
    //
    for (Resource *resource in _allResources)
    {
        int uniqueID = [[resource getUniqueID] intValue];
        if (uniqueID > _resourceUniqueID)
        {
            _resourceUniqueID = uniqueID;
        }
    }
    
    //
    // Update base calendar unique IDs
    //
    for (ProjectCalendar *calendar in _baseCalendars)
    {
        int uniqueID = [[calendar getUniqueID]intValue];
        if (uniqueID > _calendarUniqueID)
        {
            _calendarUniqueID = uniqueID;
        }
    }
    
    //
    // Update resource calendar unique IDs
    //
    for (ProjectCalendar *calendar in _resourceCalendars)
    {
        int uniqueID = [[calendar getUniqueID]intValue];
        if (uniqueID > _calendarUniqueID)
        {
            _calendarUniqueID = uniqueID;
        }
    }
    
    //
    // Update assignment unique IDs
    //
    for (ResourceAssignment *assignment in _allResourceAssignments)
    {
        int uniqueID = [[assignment getUniqueID]intValue];
        if (uniqueID > _assignmentUniqueID)
        {
            _assignmentUniqueID = uniqueID;
        }
    }
}


// Find the earliest task start date. We treat this as the
// start date for the project.
//
// @return start date

-(NSDate *)getStartDate
{
    NSDate *startDate = nil;
    
    for (Task *task in _allTasks)
    {
        //
        // If a hidden "summary" task is present we ignore it
        //
        if ([task getUniqueID] == 0)
        {
            continue;
        }
        
        //
        // Select the actual or forecast start date. Note that the
        // behaviour is different for milestones. The milestone end date
        // is always correct, the milestone start date may be different
        // to reflect a missed deadline.
        //
        NSDate *taskStartDate;
        if ([task getMilestone] == true)
        {
            taskStartDate = [task getActualFinish];
            if (taskStartDate == nil)
            {
                taskStartDate = [task getFinish];
            }
        }
        else
        {
            taskStartDate = [task getActualStart];
            if (taskStartDate == nil)
            {
                taskStartDate = [task getStart];
            }
        }
        
        if (taskStartDate != nil)
        {
            if (startDate == nil)
            {
                startDate = taskStartDate;
            }
            else
            {
                if ([taskStartDate compare:startDate] == NSOrderedAscending)
                {
                    startDate = taskStartDate;
                }
            }
        }
    }
    
    return (startDate);
}

// Find the latest task finish date. We treat this as the
// finish date for the project.
//
// @return finish date

-(NSDate *)getFinishDate
{
    NSDate *finishDate = nil;
    
    for (Task *task in _allTasks)
    {
        //
        // If a hidden "summary" task is present we ignore it
        //
        if ([[task getUniqueID]intValue] == 0)
        {
            continue;
        }
        
        //
        // Select the actual or forecast start date
        //
        NSDate *taskFinishDate;
        taskFinishDate = [task getActualFinish];
        if (taskFinishDate == nil)
        {
            taskFinishDate = [task getFinish];
        }
        
        if (taskFinishDate != nil)
        {
            if (finishDate == nil)
            {
                finishDate = taskFinishDate;
            }
            else
            {
                if ([taskFinishDate compare:finishDate] == NSOrderedDescending)
                {
                    finishDate = taskFinishDate;
                }
            }
        }
    }
    
    return (finishDate);
}


// This method is called to alert project listeners to the fact that
// a task has been read from a project file.
//
// @param task task instance

-(void)fireTaskReadEvent:(Task *)task
{
    if (_projectListeners != nil)
    {
        for (id<ProjectListener> listener in _projectListeners)
        {
            [listener taskRead:task];
        }
    }
}


// This method is called to alert project listeners to the fact that
// a task has been written to a project file.
//
// @param task task instance

-(void)fireTaskWrittenEvent:(Task *)task
{
    if (_projectListeners != nil)
    {
        for (id<ProjectListener> listener in _projectListeners)
        {
            [listener taskWritten:task];
        }
    }
}


// This method is called to alert project listeners to the fact that
// a resource has been read from a project file.
//
// @param resource resource instance

-(void)fireResourceReadEvent:(Resource *)resource
{
    if (_projectListeners != nil)
    {
        for (id<ProjectListener> listener in _projectListeners)
        {
            [listener resourceRead:resource];
        }
    }
}

// This method is called to alert project listeners to the fact that
// a resource has been written to a project file.
//
// @param resource resource instance

-(void)fireResourceWrittenEvent:(Resource *)resource
{
    if (_projectListeners != nil)
    {
        for (id<ProjectListener> listener in _projectListeners)
        {
            [listener resourceWritten:resource];
        }
    }
}

// This method is called to alert project listeners to the fact that
// a calendar has been read from a project file.
//
// @param calendar calendar instance

-(void)fireCalendarReadEvent:(ProjectCalendar *)calendar
{
    if (_projectListeners != nil)
    {
        for (id<ProjectListener> listener in _projectListeners)
        {
            [listener calendarRead:calendar];
        }
    }
}


// This method is called to alert project listeners to the fact that
// a resource assignment has been read from a project file.
//
// @param resourceAssignment resourceAssignment instance

-(void)fireAssignmentReadEvent:(ResourceAssignment *)resourceAssignment
{
    if (_projectListeners != nil)
    {
        for (id<ProjectListener> listener in _projectListeners)
        {
            [listener assignmentRead:resourceAssignment];
        }
    }
}


// This method is called to alert project listeners to the fact that
// a resource assignment has been written to a project file.
//
// @param resourceAssignment resourceAssignment instance

-(void)fireAssignmentWrittenEvent:(ResourceAssignment *)resourceAssignment
{
    if (_projectListeners != nil)
    {
        for (id<ProjectListener> listener in _projectListeners)
        {
            [listener assignmentWritten:resourceAssignment];
        }
    }
}

// This method is called to alert project listeners to the fact that
// a relation has been read from a project file.
//
// @param relation relation instance

-(void)fireRelationReadEvent:(Relation *)relation
{
    if (_projectListeners != nil)
    {
        for (id<ProjectListener> listener in _projectListeners)
        {
            [listener relationRead:relation];
        }
    }
}


// This method is called to alert project listeners to the fact that
// a relation has been written to a project file.
//
// @param relation relation instance

-(void)fireRelationWrittenEvent:(Relation *)relation
{
    if (_projectListeners != nil)
    {
        for (id<ProjectListener> listener in _projectListeners)
        {
            [listener relationWritten:relation];
        }
    }
}


// This method is called to alert project listeners to the fact that
// a calendar has been written to a project file.
//
// @param calendar calendar instance

-(void)fireCalendarWrittenEvent:(ProjectCalendar *)calendar
{
    if (_projectListeners != nil)
    {
        for (id<ProjectListener> listener in _projectListeners)
        {
            [listener calendarWritten:calendar];
        }
    }
}

-(void)addProjectListener:(id<ProjectListener>)listener
{
    if (_projectListeners != nil)
    {
        _projectListeners = [[NSMutableArray alloc]init];
    }
    [_projectListeners addObject:listener];
}

-(void)addProjectListeners:(NSMutableArray *)listeners
{
    if (_projectListeners != nil)
    {
        for (id<ProjectListener> listener in listeners)
        {
            [_projectListeners addObject:listener];
        }
    }
}

-(void)removeProjectListener:(id<ProjectListener>)listener
{
    if (_projectListeners != nil)
    {
        [_projectListeners removeObject:listener];
    }
}


// Associates an alias with a custom task field number.
//
// @param field custom field number
// @param alias alias text
//
-(void)setTaskFieldAlias:(TaskField *)field with:(NSString *)alias
{
    if ((alias != nil) && ([alias length] != 0))
    {
        [_taskFieldAlias setObject:alias forKey:field];
        [_aliasTaskField setObject:field forKey:alias];
    }
}


// Retrieves the alias associated with a custom task field.
// This method will return null if no alias has been defined for
// this field.
//
// @param field task field instance
// @return alias text

-(NSString *)getTaskFieldAlias:(TaskField *)field
{
    return [_taskFieldAlias objectForKey:field];
}


// Retrieves a task field instance based on its alias. If the
// alias is not recognised, this method will return null.
//
// @param alias alias text
// @return task field instance

-(TaskField *)getAliasTaskField:(NSString *)alias
{
    return [_aliasTaskField objectForKey:alias];
}


// Associates a value list with a custom task field number.
//
// @param field custom field number
// @param values values for the value list

-(void)setTaskFieldValueList:(TaskField *)field withList:(NSMutableArray *)values
{
    if ((values != nil) && ([values count] != 0))
    {
        [_taskFieldValueList setObject:values forKey:field];
    }
}


// Retrieves the value list associated with a custom task field.
// This method will return null if no value list has been defined for
// this field.
//
// @param field task field instance
// @return alias text

-(NSMutableArray *)getTaskFieldValueList:(TaskField *)field
{
    return [_taskFieldValueList objectForKey:field];
}


// Associates a descriptions for value list with a custom task field number.
//
// @param field custom field number
// @param descriptions descriptions for the value list

-(void)setTaskFieldDescriptionList:(TaskField *)field witList:(NSMutableArray *)descriptions
{
    if ((descriptions != nil) && ([descriptions count] != 0))
    {
        [_taskFieldDescriptionList setObject:descriptions forKey:field];
    }
}


// Retrieves the description value list associated with a custom task field.
// This method will return null if no descriptions for the value list has been defined for
// this field.
//
// @param field task field instance
// @return alias text

-(NSMutableArray *)getTaskFieldDescriptionList:(TaskField *)field
{
    return [_taskFieldDescriptionList objectForKey:field];
}


-(void)setResourceFieldAlias:(ResourceField *)field withAlias:(NSString *)alias
{
    if (alias != nil && [alias length] != 0)
    {
        [_resourceFieldAlias setObject:field forKey:alias];
        [_aliasResourceField setObject:alias forKey:field];
    }
}

-(NSString *)getResourceFieldAlias:(ResourceField *)filed
{
    return (NSString *)[_resourceFieldAlias objectForKey:filed];
}

-(ResourceField *)getAliasResourceField:(NSString *)alias
{
    return (ResourceField *)[_aliasResourceField objectForKey:alias];
}

-(NSMutableDictionary *)getTaskFieldAliasMap
{
    return _taskFieldAlias;
}

-(NSMutableDictionary *)getResourceFieldAliasMap
{
    return _resourceFieldAlias;
}

-(void)unmapTaskUniqueID:(NSNumber *)identifier
{
    [_taskUniqueIDMap removeObjectForKey:identifier];
}

-(void)mapTaskUniqueID:(NSNumber *)identifier withTask:(Task *)task
{
    [_taskUniqueIDMap setObject:identifier forKey:task];
}

-(void)unmapTaskID:(NSNumber *)identifier
{
    [_taskIDMap removeObjectForKey:identifier];
}

-(void)mapTaskID:(NSNumber *)identifier withTask:(Task *)task
{
    [_taskIDMap setObject:identifier forKey:task];
}

-(void)unmapResourceUniqueID:(NSNumber *)identifier
{
    [_resourceUniqueIDMap removeObjectForKey:identifier];
}

-(void)mapResourceUniqueID:(NSNumber *)identifier withResource:(Resource *)resource
{
    [_resourceUniqueIDMap setObject:identifier forKey:resource];
}

-(void)unmapResourceID:(NSNumber *)identifier
{
    [_resourceIDMap removeObjectForKey:identifier];
}

-(void)mapResourceID:(NSNumber *)identifier withResource:(Resource *)resource
{
    [_resourceIDMap setObject:identifier forKey:resource];
}

-(void)unmapCalendarUniqueID:(NSNumber *)identifier
{
    [_calendarUniqueIDMap removeObjectForKey:identifier];
}

-(void)mapCalendarUniqueID:(NSNumber *)identifier withResource:(ProjectCalendar *)resource
{
    [_calendarUniqueIDMap setObject:identifier forKey:resource];
}

-(void)addView:(View *)view
{
    [_views addObject:view];
}

-(NSMutableArray *)getViews
{
    return _views;
}

-(void)addTable:(Table *)table
{
    [_tables addObject:table];
    if ([table resourceFlag] == false) 
    {
        [_taskTablesByName setObject:[table name] forKey:table];
    }
    else
    {
        [_resourceTablesByName setObject:[table name] forKey:table];
    }
}

-(NSMutableArray *)getTables
{
    return _tables;
}

-(void)addFilter:(Filter *)filter
{
    if ([filter isTaskFilter]) 
    {
        [_taskFilters addObject:filter];
    }
    
    if ([filter isResourceFilter]) 
    {
        [_resourceFilters addObject:filter];
    }
    
    [_filtersByName setObject:filter forKey:[filter name]];
    [_filtersByID setObject:filter forKey:[filter ID]]; 
}

-(void)removeFilter:(NSString *)filterName
{
    Filter *filter = [_filtersByName objectForKey:filterName];
    if(filter != nil)
    {
        if ([filter isTaskFilter]) 
        {
            [_taskFilters removeObject:filter];
        }
        
        if ([filter isResourceFilter]) 
        {
            [_resourceFilters removeObject:filter];
        }
        
        [_filtersByName removeObjectForKey:filterName];
        [_filtersByID removeObjectForKey:[filter ID]];
    }
}

-(NSMutableArray *)getAllResourceFilters
{
    return _resourceFilters;
}

-(NSMutableArray *)getAllTaskFilters
{
    return _taskFilters;
}

-(Filter *)getFilterByName:(NSString *)name
{
    return [_filtersByName objectForKey:name];
}

-(Filter *)getFilterByID:(NSNumber *)identifier
{
    return [_filtersByID objectForKey:identifier];
}

-(NSMutableArray *)getAllGroups
{
    return _groups;
}

-(Group *)getGroupByName:(NSString *)name{}

-(void)addGroup:(Group *)group{}

-(void)addGraphicalIndicator:(id<FieldType>)field withIndicator:(GraphicalIndicator *)indicator{}

-(GraphicalIndicator *)getGraphicalIndicator:(id<FieldType>)field{}

-(Table *)getTaskTableByName:(NSString *)name{}

-(Table *)getResourceTableByName:(NSString *)name{}

-(void)addSubProject:(SubProject *)project{}

-(NSMutableArray *)getAllSubProjects{}

-(void)setEncryptionCode:(Byte)encriptionKey{}

-(Byte)getEncryptionCode{}

-(void)addCustomFieldValue:(CustomFieldValueItem *)item{}

-(CustomFieldValueItem *)getCustomFieldValueItem:(NSNumber *)uniqueID{}

-(ProjectCalendar *)getCalendar{}

-(void)setCalendar:(ProjectCalendar *)calendar{}

-(ProjectCalendar *)getBaseCalendar{}

@end
