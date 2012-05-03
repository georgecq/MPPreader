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

+(int)getShort:(unsigned char[])data;

+(int)getShort:(unsigned char[])data withOffSet:(int)offSet;

+(NSString *)getUnicodeString:(unsigned char[])data withSize:(int)size;

+(NSString *)getUnicodeString:(unsigned char[])data withSize:(int)size withOffSet:(int)offSet;

@end
