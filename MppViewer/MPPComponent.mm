//
//  MPPComponent.m
//  MppViewer
//
//  Created by Julián! on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MPPComponent.h"
#import "MPPUtility.h"
#import "pole.h"

@implementation MPPComponent

-(int)readInt:(POLE::Stream *)is
{
    unsigned char data[4];
    if(is->read(data, sizeof(data)) != 4)
    {
        #warning Throw Exception
    }
    
    return [MPPUtility getInt:data];
}

-(unsigned char*)readByteArray:(POLE::Stream *)is withSize:(int)size
{
    unsigned char *buffer = new unsigned char[size];
    if(is->read(buffer, size) != size)
    {
        #warning Throw Exception
    }
    
    return buffer;
}

@end
