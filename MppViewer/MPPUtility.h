//
//  MPPUtility.h
//  MppViewer
//
//  Created by Julián! on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPPUtility : NSObject


+(int)getInt:(unsigned char[])data;

+(int)getInt:(unsigned char[])data withOffSet:(int)offSet;

@end
