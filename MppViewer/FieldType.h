//
//  FieldType.h
//  MppViewer
//
//  Created by emilio1 on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"
#import "DataType.h"

@protocol FieldType <MpxjEnum>

-(NSString *)getName;

-(DataType *)getDataType;

-(id<FieldType>)getUnitsType;

@end
