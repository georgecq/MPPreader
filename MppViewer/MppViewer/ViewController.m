//
//  ViewController.m
//  MppViewer
//
//  Created by George on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "RecurrenceType.h"
#import "CoreFoundation/CoreFoundation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *guid = [self stringWithUUID];
    
    NSMutableArray *values = [RecurrenceType TYPE_VALUES];
    for (NSObject *rec in values) 
    {
        if([rec isKindOfClass:[RecurrenceType class]])
        {
            ////RecurrenceType *type = (RecurrenceType *)rec;
            NSLog(@"%d", (int)[rec performSelector:@selector(getValue)]);
        }
        else
        {
            NSLog(@"NULL");
        }
    }
}

-(NSString*) stringWithUUID {
    CFUUIDRef uuidObj = CFUUIDCreate(kCFAllocatorDefault);//create a new UUID
    //get the string representation of the UUID
    
    NSString *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuidObj);
    CFRelease(uuidObj);
    return uuidString;
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
