//
//  CompObj.h
//  MppViewer
//
//  Created by Julián! on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MPPComponent.h"
#import "pole.h"

@interface CompObj : MPPComponent
{
    NSString *_fileformat;
    NSString *_applicationID;
    NSString *_applicationName;
}

-(id)init:(POLE::Stream *)is;

-(NSString *)getApplicationName;

-(NSString *)getApplicationID;

-(NSString *)getFileFormat;

@end
