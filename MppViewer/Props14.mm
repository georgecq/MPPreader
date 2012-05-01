//
//  Props14.m
//  MppViewer
//
//  Created by Julián! on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Props14.h"
#import "MPPUtility.h"

@implementation Props14

/**
 * Constructor, reads the property data from an input stream.
 *
 * @param is input stream for reading props data
 */
-(id)init:(POLE::Stream *)is
{
    self = [super init];
    if(self)
    {
        unsigned char *data;
        unsigned char header[16];
        is->read(header, sizeof( header ));
        int headerCount = [MPPUtility getShort:header withOffSet:12];
        int foundCount = 0;
        int availableBytes = is->size() - 16;
        
        while (foundCount < headerCount) 
        {
            int attrib1 = [self readInt:is];
            int attrib2 = [self readInt:is];
            [self readInt:is];
            availableBytes -= 12;
            
            if(availableBytes < attrib1 || attrib1 < 1)
            {
                break;
            }
            
            data = new unsigned char[attrib1];
            is->read(data, attrib1);
            availableBytes -= attrib1;
            
            NSNumber *num = [NSNumber numberWithInt:attrib2];
            NSData *dataObject = [NSData dataWithBytes:data length:attrib1];
            
            [_map setObject:dataObject forKey:num];
            ++foundCount;
            
            if(attrib1 % 2 != 0)
            {
                unsigned char skip[1];
                is->read(skip, sizeof(skip));

            }
        }
    }
    
    return self;
}

@end
