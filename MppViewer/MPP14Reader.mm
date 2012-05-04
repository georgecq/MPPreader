//
//  MPP14Reader.m
//  MppViewer
//
//  Created by Julián! on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MPP14Reader.h"

#import "ProjectFile.h"
#import "CustomFieldValueItem.h"
#import "Props14.h"
#import "VarMeta12.h"
#import "Var2Data.h"
#import "StreamHelper.h"
#import "pole.h"

@implementation MPP14Reader

// Signals that the previous value was for the subproject task unique id
static int SUBPROJECT_TASKUNIQUEID0 = 0x00000000;
static int SUBPROJECT_TASKUNIQUEID1 = 0x0B340000;
static int SUBPROJECT_TASKUNIQUEID2 = 0x0ABB0000;
static int SUBPROJECT_TASKUNIQUEID3 = 0x05A10000;
static int SUBPROJECT_TASKUNIQUEID4 = 0x0BD50000;
static int SUBPROJECT_TASKUNIQUEID5 = 0x03D60000;
static int SUBPROJECT_TASKUNIQUEID6 = 0x067F0000;
static int SUBPROJECT_TASKUNIQUEID7 = 0x067D0000;

/**
 * Calendar data types.
 */
static NSNumber *CALENDAR_NAME = [NSNumber numberWithInt:1];
static NSNumber *CALENDAR_DATA = [NSNumber numberWithInt:8];

/**
 * Resource data types.
 */
static NSNumber *TABLE_COLUMN_DATA_STANDARD = [NSNumber numberWithInt:6];
static NSNumber *TABLE_COLUMN_DATA_ENTERPRISE = [NSNumber numberWithInt:7];
static NSNumber *TABLE_COLUMN_DATA_BASELINE = [NSNumber numberWithInt:8];
static NSNumber *OUTLINECODE_DATA = [NSNumber numberWithInt:22];

// Custom value list types
static NSNumber *VALUE_LIST_VALUE = [NSNumber numberWithInt:22];
static NSNumber *VALUE_LIST_DESCRIPTION = [NSNumber numberWithInt:8];
static NSNumber *VALUE_LIST_UNKNOWN = [NSNumber numberWithInt:23];

static int VALUE_LIST_MASK = 0x0700;

/**
 * Mask used to isolate confirmed flag from the duration units field.
 */
static int DURATION_CONFIRMED_MASK = 0x20;

static NSNumber *RESOURCE_FIELD_NAME_ALIASES = [NSNumber numberWithInt:71303169];
static NSNumber *TASK_FIELD_NAME_ALIASES = [NSNumber numberWithInt:71303169];

/**
 * Default working week.
 */
static NSMutableArray *DEFAULT_WORKING_WEEK = [[NSMutableArray alloc]initWithObjects:[NSNumber numberWithBool:false], [NSNumber numberWithBool:true], [NSNumber numberWithBool:true], [NSNumber numberWithBool:true], [NSNumber numberWithBool:true], [NSNumber numberWithBool:true], [NSNumber numberWithBool:false], nil];

-(void )process:(MPPReader *)reader withProjectFile:(ProjectFile *)file withStorage:(POLE::Storage *)storage
{
    @try 
    {
        Props14 *props14 = [[Props14 alloc]init:(StreamHelper::getStream(storage, (char *)"Props14"))];

        [file setProjectFilePath:[props14 getUnicodeString:[Props PROJECT_FILE_PATH]]];
        [file setEncoded:([props14 getByte:[Props PASSWORD_FLAG]] != 0)];
        [file setEncryptionCode:[props14 getByte:[Props ENCRYPTION_CODE]]];
        
        if (([props14 getByte:[Props PASSWORD_FLAG]] & 0x01) != 0) 
        {
            #warning throw exception
        }
        
        _reader = reader;
        _file = file;
        _storage = storage;
        _resourceMap = [[NSMutableDictionary alloc]init];
        POLE::Stream *streamVarMeta = StreamHelper::getStream(storage, (char *)"/   114/TBkndOutlCode/VarMeta");
        if(!streamVarMeta)
        {
            #warning throw exception
        } 
        _outlineCodeVarMeta = [[VarMeta12 alloc]init:streamVarMeta];
        POLE::Stream *streamVarData = StreamHelper::getStream(storage, (char *)"/   114/TBkndOutlCode/Var2Data");
        if(!streamVarData)
        {
            #warning throw exception
        } 
        _outlineCodeVarData = [[Var2Data alloc]init:_outlineCodeVarMeta withStream:streamVarData];
        POLE::Stream *streamProps = StreamHelper::getStream(storage, (char *)"Props14" );
        if(!streamProps)
        {
             #warning throw exception
        }
        _projectProps = [[Props14 alloc]init:streamProps];
        
        _fontBases = [[NSMutableDictionary alloc]init];
        _taskSubProjects = [[NSMutableDictionary alloc]init];
        _parentTasks = [[NSMutableDictionary alloc]init];
        _taskOrder = [[NSMutableDictionary alloc]init];
        _nullTaskOrder = [[NSMutableDictionary alloc]init];
        
        [_file setMppFileType:14];
        
        [self processCustomValueLists];
        
        #warning Incomplete
    }
    @finally 
    {
        _reader = nil;
        _file = nil;
        _storage = nil;
        _resourceMap = nil;
        _outlineCodeVarData = nil;
        _outlineCodeVarMeta = nil;
        _projectProps = nil;
        _fontBases = nil;
        _taskSubProjects = nil;
        _parentTasks = nil;
        _taskOrder = nil;
        _nullTaskOrder = nil;
    }
}

-(void)processCustomValueLists
{
    NSMutableArray *uniqueid = [_outlineCodeVarMeta getUniqueIdentifierArray];
    NSNumber *identifier;
    CustomFieldValueItem *item;
    
    for(int loop = 0; loop < [uniqueid count]; loop++)
    {
        identifier = [uniqueid objectAtIndex:loop];
        
        item = [[CustomFieldValueItem alloc]init:identifier];

        [item setValue:[_outlineCodeVarData getByteArray:identifier withType:VALUE_LIST_VALUE]];
        [item setDescription:[_outlineCodeVarData getUnicodeString:identifier withType:VALUE_LIST_DESCRIPTION]];
        [item setUnknown:[_outlineCodeVarData getByteArray:identifier withType:VALUE_LIST_UNKNOWN]];

        [_file addCustomFieldValue:item];
    }
}



@end
