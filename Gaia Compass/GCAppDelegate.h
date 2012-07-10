//
//  GCAppDelegate.h
//  Gaia Compass
//
//  Created by Nicole Hsieh on 7/10/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GCViewController, GCGPSController;

@interface GCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) GCViewController *viewController;
@property (strong, nonatomic) GCGPSController *gpsController;


@end
