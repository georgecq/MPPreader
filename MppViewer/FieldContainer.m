//
//  FieldContainer.m
//  MppViewer
//
//  Created by Fernando Araya on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FieldContainer.h"

@implementation FieldContainer

/**
 * Set a field value.
 * 
 * @param field field identifier
 * @param value field value
 */
-(void)set:(FieldType *)field withValue:(NSObject *)value { }

/**
 * Retrieve a field value. Use the cached value. Do not attempt to
 * calculate a value if the cached value is null.
 * 
 * @param field field identifier
 * @return field value
 */
-(NSObject *)getCachedValue:(FieldType *) field
{ 
    NSObject * object = nil;
    return object;
}

/**
 * Retrieve a field value. If the cached value is null, attempt to
 * calculate the current value.
 * 
 * @param field field identifier
 * @return field value
 */
-(NSObject *)getCurrentValue:(FieldType *) field
{ 
    NSObject * object = nil;
    return object;
}

/**
 * Add a listener to receive field events.
 * 
 * @param listener target listener
 */
-(void)addFieldListener:(FieldListener *)listener { }

/**
 * Remove a listener.
 * 
 * @param listener target listener
 */
-(void)removeFieldListener:(FieldListener *)listener { }

@end
