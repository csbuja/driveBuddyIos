//
//  PitStop.m
//  Pitstop Pal
//
//  Created by CHRISTOPHER SPENCER BUJA on 9/6/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import "Pitstop.h"

@implementation Pitstop
- (id)initWithLatLon:(NSArray*)latLon;

{
    if ([latLon count] != 2 ) {
        [NSException raise:@"Invalid Latitude and Longitude Tuple" format:@"%@ is not a valid latLon", latLon];
    }
    if (self = [super init])
    {
        _latLon = latLon;
        _root = @"http://quiet-refuge-4252.herokuapp.com";
    }
    return self;
}

-(void) getInfo
{

}
@end
