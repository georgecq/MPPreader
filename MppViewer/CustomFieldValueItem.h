//
//  CustomFieldValueItem.h
//  MppViewer
//
//  Created by Julián! on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomFieldValueItem : NSObject
{
    NSNumber *_uniqueID;
}

@property (nonatomic) unsigned char* value;

@property (strong, nonatomic) NSString* description;

@property (nonatomic) unsigned char* unknown;

-(id)init:(NSNumber *)uniqueID;

-(NSNumber *)getUniqueID;

@end
