//
//  FieldType.h
//  MppViewer
//
//  Created by emilio1 on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DataType;

@interface FieldType : NSObject

-(NSString *)getName;
-(DataType *)getDataType;
-(FieldType *) getUnitsType;

@end
