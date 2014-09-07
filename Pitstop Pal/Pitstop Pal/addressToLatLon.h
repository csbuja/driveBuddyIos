//
//  addressToLatLon.h
//  Pitstop Pal
//
//  Created by CHRISTOPHER SPENCER BUJA on 9/7/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface addressToLatLon : NSObject

@property (strong) NSString * address;
@property (strong) NSArray * latLon;
- (id)initWithAdress:(NSString*) address;

- (NSArray*)getLatLon;

@end