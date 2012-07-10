//
//  GCViewController.m
//  Gaia Compass
//
//  Created by Nicole Hsieh on 7/10/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "GCViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreLocation/CoreLocation.h>

@interface GCViewController ()

@end

@implementation GCViewController
@synthesize headingLabel;

- (void) updateHeadingLabel:(NSNotification*)note {
    CLLocation *newLocation = note.object;
    self.headingLabel.text = [NSString stringWithFormat:@"%@", newLocation];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    int labelWidth = 300;
    int labelHeight = 25;
    CGRect headingLabelFrame = CGRectMake(self.view.frame.size.width/2-labelWidth/2,
                                          self.view.frame.size.height/2-labelHeight/2, 
                                          labelWidth, 
                                          labelHeight);
    self.headingLabel = [[UILabel alloc]initWithFrame:headingLabelFrame];
    headingLabel.textAlignment = UITextAlignmentCenter;
    self.headingLabel.layer.borderWidth = 1;
    self.headingLabel.layer.borderColor = [[UIColor blueColor]CGColor];
    headingLabel.text = @"No compass reading yet";
    [self.view addSubview:headingLabel];
    [[NSNotificationCenter defaultCenter]addObserver:self 
                                            selector:@selector(updateHeadingLabel:) 
                                                name:@"NEW_LOCATION" 
                                              object:nil];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
