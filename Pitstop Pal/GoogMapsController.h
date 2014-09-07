//
//  GoogMapsController.h
//  Pitstop Pal
//
//  Created by CHRISTOPHER SPENCER BUJA on 9/6/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface GoogMapsController : NSObject

@property (strong) CLLocationManager * locationManager;
@property (nonatomic,strong) NSArray *pitStops;
@property (nonatomic, strong) NSArray *currentPos;
@property (nonatomic,strong) NSArray *initialPos;
@property (nonatomic, strong) NSArray *destPos;
@property (nonatomic, assign) NSUInteger stopFreq;
@property (nonatomic, assign) NSUInteger currPitstop;  //destinationStop is indexed as the number of PitStops
@property (strong) NSString * root;


- (id)initGoogMapsController:(NSArray*) finishLatLon stopFreq:(NSUInteger)stopFreq;
- (void) getWaypoints :(void (^)(NSArray *infos, NSError *error))completionHandler;
- (void) setCurrentCarPosition;
- (double) getDistanceToLoc:(NSArray*) latLon1 latLon2:(NSArray*)latLon2;
- (NSArray*) getCurrPitstop;


@end
