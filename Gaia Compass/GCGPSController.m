//
//  GCGPSController.m
//  Gaia Compass
//
//  Created by Nicole Hsieh on 7/10/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "GCGPSController.h"

@implementation GCGPSController 
@synthesize locationManager;


- (id) init {
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self; 
        [locationManager startUpdatingLocation];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager 
    didUpdateToLocation:(CLLocation *)newLocation 
           fromLocation:(CLLocation *)oldLocation {
    
    // post a notification that we got a location
    
    NSLog(@"didUpdateToLocation: %@", newLocation);
    [[NSNotificationCenter defaultCenter]postNotificationName:@"NEW_LOCATION" object:newLocation];
    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {

    // post a notification that we got a heading
    NSLog(@"didUpdateHeading: %@", newHeading);
    // put the notification line in here
}

@end
