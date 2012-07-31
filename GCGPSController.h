//
//  GCGPSController.h
//  Gaia Compass
//
//  Created by Nicole Hsieh on 7/10/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface GCGPSController : NSObject <CLLocationManagerDelegate> {
    
}

@property(strong,nonatomic) CLLocationManager *locationManager;


@end
