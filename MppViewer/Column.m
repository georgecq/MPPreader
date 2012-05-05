//
//  Column.m
//  MppViewer
//
//  Created by Julián! on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Column.h"
#import "FieldType.h"
#import "TaskField.h"
#import "ProjectFile.h"
#import "ResourceField.h"

@implementation Column

@synthesize fieldType;
@synthesize width;
@synthesize alignTitle;
@synthesize alignData;

-(id)init:(ProjectFile *)project
{
    self = [super init];
    if (self)
    {
        _project = project;
    }
    return self;
}

-(NSString *)getTitle
{
    NSString *result = nil;
    if(_title != nil)
    {
        result = _title;
    }
    else
    {
        if ([[self fieldType] isKindOfClass:[TaskField class]]) 
        {
            result = [_project getTaskFieldAlias:(TaskField *)[self fieldType]];
        }
        else
        {
            result = [_project getResourceFieldAlias:(ResourceField *)[self fieldType]];
        }
        
        if(result == nil && [self fieldType] != nil)
        {
            result = [[self fieldType]getName];
        }
    }
    
    return result;
}

-(void)setTitle:(NSString *)title
{
    _title = title;
}

-(NSString *)toString
{
    #warning Incomplete
}

+(int)ALIGN_LEFT { return 1; }
+(int)ALIGN_CENTER { return 2; }
+(int)ALIGN_RIGHT { return 3; }

@end
