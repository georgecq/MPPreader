//
//  GroupClause.h
//  MppViewer
//
//  Created by Julián! on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FontStyle;
@class BackgroundPattern;
@protocol FieldType;

@interface GroupClause : NSObject

@property (nonatomic)Boolean ascending;

@property (strong, nonatomic)UIColor *cellBackgroundColor;

@property (strong, nonatomic)id<FieldType> field;

@property (strong, nonatomic)FontStyle *font;

@property (strong, nonatomic)NSObject *groupInterval;

@property (nonatomic)int groupOn;

@property (strong, nonatomic)BackgroundPattern *pattern;

@property (strong, nonatomic)NSObject * startAt;

-(NSString *)toString;

@end
