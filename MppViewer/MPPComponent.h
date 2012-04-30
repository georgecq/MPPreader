//
//  MPPComponent.h
//  MppViewer
//
//  Created by Julián! on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pole.h"

@interface MPPComponent : NSObject

-(int)readInt:(POLE::Stream *)is;

-(unsigned char*)readByteArray:(POLE::Stream *)is withSize:(int)size;

@end
