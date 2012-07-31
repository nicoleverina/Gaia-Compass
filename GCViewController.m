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
@synthesize headingLabel, textHeadingLabel;

- (void) updateHeadingLabel:(NSNotification*)note {
    CLLocation *newLocation = note.object;
    double lat = newLocation.coordinate.latitude;
    double lon = newLocation.coordinate.longitude;
    
    
    self.headingLabel.text = [NSString stringWithFormat:@"%f %f", lat,lon];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    int labelWidth = 300;
    int labelHeight = 25;
    CGRect headingLabelFrame = CGRectMake(self.view.frame.size.width/2-labelWidth/2,
                                          self.view.frame.size.height/4-labelHeight/4, 
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
    
    CGRect textHeadingLabelFrame = CGRectMake(headingLabelFrame.origin.x, headingLabelFrame.origin.y-headingLabelFrame.size.height-5, headingLabelFrame.size.width, headingLabelFrame.size.height);
    
    self.textHeadingLabel = [[UILabel alloc] initWithFrame:textHeadingLabelFrame];
    self.textHeadingLabel.layer.borderWidth = 1;
    self.textHeadingLabel.layer.borderColor = [[UIColor blueColor] CGColor];
    self.textHeadingLabel.textAlignment = UITextAlignmentCenter;
    self.textHeadingLabel.text = [NSString stringWithFormat:@"Your Current Location"];
    
    [self.view addSubview:textHeadingLabel];
    
    
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
