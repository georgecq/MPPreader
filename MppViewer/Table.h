//
//  Table.h
//  MppViewer
//
//  Created by Julián! on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Column;

@interface Table : NSObject
{
    NSMutableArray *_columns;
}

@property (strong, nonatomic) NSNumber *ID;

@property (strong, nonatomic) NSString *name;

@property (nonatomic) Boolean resourceFlag; 

-(void)addColumn:(Column *)column;

-(NSMutableArray *)getColumns;

-(NSString *)toString;

@end
