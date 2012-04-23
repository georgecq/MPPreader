//
//  EnumUtility.h
//  MppViewer
//
//  Created by Fernando Araya on 4/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface EnumUtility : NSObject

+(NSMutableArray *)createTypeArray:(NSMutableArray *)originalArray withOffSet:(int)arraySizeOffset;

@end
