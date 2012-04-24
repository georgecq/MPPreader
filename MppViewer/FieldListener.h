//
//  FieldListener.h
//  MppViewer
//
//  Created by emilio1 on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FieldContainer.h"
#import "FieldType.h"

@protocol FieldListener <NSObject>

/**
 * Called when a field value is changed.
 * 
 * @param container field container
 * @param type field type
 * @param oldValue old value
 * @param newValue new value
 */
-(void)fieldChange:(id<FieldContainer>)container withType:(id<FieldType>)type withOldValue:(NSObject *)oldValue withNewValue:(NSObject *)newValue;

@end
