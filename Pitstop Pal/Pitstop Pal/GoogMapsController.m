//
//  GoogMapsController.m
//  Pitstop Pal
//
//  Created by CHRISTOPHER SPENCER BUJA on 9/6/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import "GoogMapsController.h"
#import <GoogleMaps/GoogleMaps.h>

@implementation GoogMapsController

- (id)initGoogMapsController:(NSArray*) finishLatLon stopFreq:(NSUInteger)stopFreq
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
    
    //_manager = [AFHTTPRequestOperationManager manager];
    return self;
}

- (void) getWaypoints :(void (^)(NSMutableDictionary *infos, NSError *error))completionHandler
{
    NSString * urlString = [NSString stringWithFormat:@"%@/googlemaps/%@/%@/%@/%@/%d", self.root,self.initialPos[0], self.initialPos[1],self.destPos[0],self.destPos[1],(int)self.stopFreq];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession *sesson = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *downloadDataTask = [sesson downloadTaskWithURL:url completionHandler:^(NSURL *localURL, NSURLResponse *response, NSError *error) {
        if (localURL) {
            NSData *data = [NSData dataWithContentsOfURL:localURL];
            NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            if (!result) {
                completionHandler(nil, error);
            }
            else {
                completionHandler(result, nil);
            }
        }
        else {
            completionHandler(nil, error);
        }
    }];
    
    [downloadDataTask resume];
}

- (void) setCurrentCarPosition
{
    
    NSNumber * latitude = [NSNumber numberWithFloat:_locationManager.location.coordinate.latitude ];
    NSNumber * longitude = [NSNumber numberWithFloat:_locationManager.location.coordinate.longitude ];
    _currentPos = [NSArray arrayWithObjects:latitude, longitude, nil];
    if(!_initialPos) _initialPos = _currentPos;
    //if your next pitstop is the last one, then check below for _destPos
    //if the car is closer to the i+1 pitstop than current position then your next stop should be set as i+1
    [self checkAndSetNextPitstop];
}

- (double) getDistanceToLoc:(NSArray*)latLon1 latLon2:(NSArray*)latLon2
{ //assuming nsarray is of a bunch of NSNumbers
    CLLocation *locA = [[CLLocation alloc] initWithLatitude:[latLon1[0] doubleValue] longitude:[ latLon1[1] doubleValue]];
    CLLocation *locB = [[CLLocation alloc] initWithLatitude:[latLon2[0] doubleValue] longitude:[latLon2[1] doubleValue]];
    CLLocationDistance distance = [locA distanceFromLocation:locB];
    return distance;
}

-(void)checkAndSetNextPitstop
{
    // next stop is the finish
    NSArray * nextPitstop;
    
    if ( self.currPitstop == [self.pitStops count]) {
        return;
    }
    else if(self.currPitstop == ([self.pitStops count]- 1 )){
        nextPitstop = self.destPos;
    }
    else {
        nextPitstop = self.pitStops[ self.currPitstop +1 ];
    }
    
    double d1 = [self getDistanceToLoc:self.currentPos latLon2:[self getCurrPitstop ]];
    double d2 = [self getDistanceToLoc:[self getCurrPitstop ] latLon2:nextPitstop];
    
    if(d1 > d2){
        self.currPitstop++;  //destinationStop is indexed as the number of PitStops
    }
}


- (NSArray*) getCurrPitstop
{
    return self.pitStops[ self.currPitstop];
}

@end