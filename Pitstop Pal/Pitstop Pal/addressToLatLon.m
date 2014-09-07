//
//  addressToLatLon.m
//  Pitstop Pal
//
//  Created by CHRISTOPHER SPENCER BUJA on 9/7/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import "addressToLatLon.h"
//#import "AFNetworking.h"

@implementation addressToLatLon
- (id)initWithAdress:(NSString*) address
{
    if (self = [super init])
    {
        _address = address;
    }
    
    NSString * root = @"https://maps.googleapis.com/maps/api/geocode/json";
    NSString * API_KEY = @"AIzaSyDv_GaD1jG3T4iKWyxksqVnrFJ1f-Mphh8";
    
    NSString *urlString = [NSString stringWithFormat:@"%@?address=%@&key=%@", root,_address, API_KEY];
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        _latLon = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data) {
            _latLon = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        }
        else {
            NSLog(@"Error: %@", error);
        }
    }];

    [task resume];
    
    return self;
}


- (NSArray*)getLatLon
{
    return _latLon;
}

@end