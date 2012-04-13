//
//  FieldListener.h
//  MppViewer
//
//  Created by Fernando Araya on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FieldContainer;
@class FieldType;

@interface FieldListener : NSObject

-(void)fieldChange:(FieldContainer *)container withType: (FieldType *) type withOldValue:(NSObject *) oldValue withNewValue:(NSObject *) newValue;

@end
