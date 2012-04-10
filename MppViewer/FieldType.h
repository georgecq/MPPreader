//
//  FieldType.h
//  MppViewer
//
//  Created by Fernando Araya on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DataType;

#warning FieldType is a protocol not a class ??? must be a class that adopts the FieldType protocol
@class FieldType; 

@protocol FieldType <NSObject>

-(NSString *) getName;
-(DataType *) getDataType;
-(FieldType *) getUnitsType;

@end
