//
//  addressToLatLon.m
//  Pitstop Pal
//
//  Created by CHRISTOPHER SPENCER BUJA on 9/7/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import "addressToLatLon.h"

@implementation addressToLatLon
- (id)initWithAdress:(NSString*) finishLatLon stopFreq:(NSUInteger)stopFreq
{
    if (self = [super init])
    {
        _destPos = finishLatLon;
        _currPitstop = 0;
        _root = @"http://quiet-refuge-4252.herokuapp.com";
    }
    
    NSTimeInterval periodOfLocationCheck = 120;
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [_locationManager startUpdatingLocation]; //in the future do a power optimization to keep this not
    
    [NSTimer scheduledTimerWithTimeInterval:periodOfLocationCheck
                                     target:self
                                   selector:@selector(setCurrentCarPosition)
                                   userInfo:nil
                                    repeats:YES];
    
    return self;
}

@end
