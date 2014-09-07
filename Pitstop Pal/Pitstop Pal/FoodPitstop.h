//
//  FoodPitstop.h
//  Pitstop Pal
//
//  Created by CHRISTOPHER SPENCER BUJA on 9/6/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import "Pitstop.h"

@interface FoodPitstop : Pitstop

- (void)getInfoWithFoodPrefs:(NSArray *)foodPrefs withCompletionHandler:(void (^)(NSArray *infos, NSError *error))completionHandler;

@end
