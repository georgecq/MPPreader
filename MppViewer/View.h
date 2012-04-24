//
//  View.h
//  MppViewer
//
//  Created by emilio1 on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ViewType

@protocol View <NSObject>

-(NSInteger *)getID;

-(NSString *)getName;

-(ViewType *)getType;

@end
