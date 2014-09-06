//
//  PitStop.h
//  Pitstop Pal
//
//  Created by CHRISTOPHER SPENCER BUJA on 9/6/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pitstop : NSObject
- (id)initWithLatLon:(NSArray*)latLon;
-(void) getInfo;
@property (strong) NSArray * latLon;
@property (strong) NSString * root;

@end
