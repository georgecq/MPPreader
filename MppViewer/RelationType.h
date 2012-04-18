//
//  RelationType.h
//  MppViewer
//
//  Created by Fernando Araya on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RelationType : NSObject
{
    int _value;
    NSString *_name;
}

+(RelationType *)getInstance:(int)type;

+(RelationType *)getInstanceWithNumber:(NSNumber *)type;

-(int)getValue;

-(NSString *)toString;

+(RelationType *)FINISH_FINISH;
+(RelationType *)FINISH_START;
+(RelationType *)START_FINISH;
+(RelationType *)START_START;

@end