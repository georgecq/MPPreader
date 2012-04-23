//
//  ViewController.m
//  MppViewer
//
//  Created by George on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "RecurrenceType.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *values = [RecurrenceType TYPE_VALUES];
    for (NSObject *rec in values) 
    {
        if([rec isKindOfClass:[RecurrenceType class]])
        {
            RecurrenceType *type = (RecurrenceType *)rec;
            NSLog(@"%@", [type getValue]);
        }
        else
        {
            NSLog(@"NULL");
        }
    }
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
