//
// CurrencySymbolPosition.h
// MppViewer
//
// Created by Fernando Araya on 4/23/2012.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MpxjEnum.h"

@interface CurrencySymbolPosition : NSObject <MpxjEnum>
{
    int _value;
}

+(CurrencySymbolPosition *)getInstance:(int)value;

-(NSString *)toString;

+(CurrencySymbolPosition *)AFTER;
+(CurrencySymbolPosition *)BEFORE;
+(CurrencySymbolPosition *)AFTER_WITH_SPACE;
+(CurrencySymbolPosition *)BEFORE_WITH_SPACE;

@end
