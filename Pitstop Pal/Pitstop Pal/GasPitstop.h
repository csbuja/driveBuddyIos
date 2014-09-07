//
//  GasPitstop.h
//  Pitstop Pal
//
//  Created by CHRISTOPHER SPENCER BUJA on 9/6/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import "PitStop.h"

@interface GasPitstop : Pitstop

- (void)getInfo:(void (^)(NSArray *infos, NSError *error))completionHandler;



@end
