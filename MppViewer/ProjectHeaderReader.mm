//
//  ProjectHeaderReader.m
//  MppViewer
//
//  Created by Julián! on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProjectHeaderReader.h"
#import "Props.h"
#import "ProjectHeader.h"
#import "ScheduleFrom.h"
#import "MPPUtility.h"
#import "Rate.h"
#import "ProjectFile.h"

@implementation ProjectHeaderReader

-(void)process:(ProjectFile *)file withProps:(Props *)props withStorage:(POLE::Storage*) storage
{
    ProjectHeader *ph = [file getProjectHeader];
    #warning incomplete
}

@end
