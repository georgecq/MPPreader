//
//  CustomFieldValueItem.m
//  MppViewer
//
//  Created by Julián! on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomFieldValueItem.h"

@implementation CustomFieldValueItem

@synthesize value;
@synthesize description;
@synthesize unknown;

-(id)init:(NSNumber *)uniqueID
{
    self = [super init];
    if(self)
    {
        _uniqueID = uniqueID;
    }
    return self;
}

-(NSNumber *)getUniqueID
{
    return _uniqueID;
}

@end
