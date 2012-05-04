//
//  GenericCriteriaPrompt.h
//  MppViewer
//
//  Created by Julián! on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DataType;

@interface GenericCriteriaPrompt : NSObject
{
    DataType *_dataType;
    NSString *_prompt;
}

-(id)init:(DataType *)type withPrompt:(NSString *)prompt;

-(DataType *)getType;

-(NSString *)getPrompt;

-(NSString *)toString;

@end
