//
//  GasPitstop.m
//  Pitstop Pal
//
//  Created by CHRISTOPHER SPENCER BUJA on 9/6/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import "GasPitstop.h"


@implementation GasPitstop

//example of using getinfowithfoodprefs
//- (void)foo {
//    [self getInfoWithFoodPrefs:@[] withCompletionHandler:^(NSArray *infos, NSError *error) {
//        // use infos here
//        // self.infos = infos;
//        
//        if (!infos) {
//            NSLog(@"%@", error);
//            // present to the user the error (property on NSError called localizedDescription and localizedReason).
//        }
//    }];
//}

- (void)getInfoWithFoodPrefs:(NSArray *)foodPrefs withCompletionHandler:(void (^)(NSArray *infos, NSError *error))completionHandler {
    NSString *foodParamsString = [foodPrefs componentsJoinedByString:@","];
    
    NSString *urlString = [NSString stringWithFormat:@"%@/gas/%@/%@/%@", self.root,self.latLon[0], self.latLon[1], foodParamsString];
    NSURL *url = [NSURL URLWithString:urlString];

    NSURLSession *sesson = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *downloadDataTask = [sesson downloadTaskWithURL:url completionHandler:^(NSURL *localURL, NSURLResponse *response, NSError *error) {
        if (localURL) {
            NSData *data = [NSData dataWithContentsOfURL:localURL];
            NSArray *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

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

@end
