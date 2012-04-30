//
//  AbstractProjectReader.m
//  MppViewer
//
//  Created by Julián! on 4/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AbstractProjectReader.h"
#import "ProjectFile.h"

@implementation AbstractProjectReader

-(ProjectFile *)read:(NSString *)fileName
{
    NSInputStream *fis = nil;
    
    @try {
        fis = [[NSInputStream alloc]initWithFileAtPath:fileName];
        #warning Incomplete
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        if(fis != nil)
        {
            @try {
                [fis close];
            }
            @catch (NSException *exception) {
                
            }
        }
    }
}

@end
