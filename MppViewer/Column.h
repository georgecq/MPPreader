//
//  Column.h
//  MppViewer
//
//  Created by Julián! on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FieldType;
@class ProjectFile;

@interface Column : NSObject
{
    NSString *_title;
    ProjectFile *_project;
}

@property (strong, nonatomic)id<FieldType> fieldType;

@property (nonatomic)int width;

@property (nonatomic)int alignTitle;

@property (nonatomic)int alignData;

-(id)init:(ProjectFile *)project;

-(NSString *)getTitle;

-(void)setTitle:(NSString *)title;

-(NSString *)toString;

+(int)ALIGN_LEFT;
+(int)ALIGN_CENTER;
+(int)ALIGN_RIGHT;

@end
