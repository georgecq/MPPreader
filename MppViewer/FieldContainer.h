//
//  FieldContainer.h
//  MppViewer
//
//  Created by Fernando Araya on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FieldType;
@class FieldListener;

@interface FieldContainer : NSObject

-(void)set:(FieldType *)field withValue:(NSObject *)value;

-(NSObject *)getCachedValue:(FieldType *) field;

-(NSObject *)getCurrentValue:(FieldType *) field;

-(void)addFieldListener:(FieldListener *)listener;

-(void)removeFieldListener:(FieldListener *)listener;

@end
