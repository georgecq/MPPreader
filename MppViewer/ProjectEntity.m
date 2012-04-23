//
//  ProjectEntity.m
//  MppViewer
//
//  Created by Fernando Araya on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProjectEntity.h"

@implementation ProjectEntity

/**
 * Constructor.
 *
 * @param mpx Parent MPX file
 */

-(id)init:(ProjectFile *)mpx
{
    self = [super init];
    if(self)
    {
        _mpx = mpx;
    }
    return self;
}

/**
 * Accessor method allowing retrieval of ProjectFile reference.
 *
 * @return reference to this the parent ProjectFile instance
 */

-(ProjectFile *)getParentFile
{
    return _mpx;
}

@end
