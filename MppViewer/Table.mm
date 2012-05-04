//
//  Table.m
//  MppViewer
//
//  Created by Julián! on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Table.h"

@implementation Table

@synthesize ID;
@synthesize name;
@synthesize resourceFlag;

-(id)init
{
    self = [super init];
    if(self)
    {
        _columns = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)addColumn:(Column *)column
{
    [_columns addObject:column];
}

-(NSMutableArray *)getColumns
{
    return _columns;
}

-(NSString *)toString
{
    #warning  incomplete
    return nil;
}

@end
