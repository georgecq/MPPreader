//
//  MPPReader.h
//  MppViewer
//
//  Created by Julián! on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractProjectReader.h"

@interface MPPReader : AbstractProjectReader
{
    NSMutableArray *_projectListener;
}

@property (nonatomic) Boolean preserveNoteFormatting;

@property (nonatomic) Boolean useRawTimphasedDate;

@property (nonatomic) Boolean readPresentationData;

@property (strong, nonatomic) NSString *readPassword;

@property (strong, nonatomic) NSString *writePassword;

@end
