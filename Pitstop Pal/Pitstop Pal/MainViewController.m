//
//  MainViewController.m
//  Pitstop Pal
//
//  Created by Colin Lockareff on 9/6/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import "DrivingViewController.h"
#import "MainViewController.h"
#import "FlipsideViewController.h"


@implementation MainViewController
@synthesize destinationField, cuisinePrefs, stopFrequency;

NSString *dest;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    }


- (IBAction)ExitText:(id)sender {
    dest = destinationField.text;
    
}
- (IBAction)PITSToptions:(id)sender {
}

- (IBAction)startTrip:(id)sender {
    
    DrivingViewController *drivingLayer = [self.storyboard instantiateViewControllerWithIdentifier:@"drivingLayer"];
    drivingLayer.destinationAddress = dest;
    drivingLayer.cuisinePrefs = cuisinePrefs;
    drivingLayer.stopFreq = stopFrequency;
    [self.navigationController pushViewController:drivingLayer animated:YES];
    
    
}
@end