//
//  FieldContainer.h
//  MppViewer
//
//  Created by emilio1 on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FieldType.h"
#import "FieldListener.h"

@protocol FieldContainer <NSObject>

-(void)set:(id<FieldType>)field withObject:(NSObject *)value;

-(NSObject *)getCachedValue:(id<FieldType>)field;

-(NSObject *)getCurrentValue:(id<FieldType>)field;

-(void)addFieldListener:(id<FieldListener>)listener;

-(void)removeFieldListener:(id<FieldListener>)listener;

@end
