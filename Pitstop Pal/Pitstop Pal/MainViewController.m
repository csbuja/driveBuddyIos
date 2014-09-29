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

- (void)setvalues
{
    if (self != nil)
    {
        self.stopFrequency = 150;
        
        NSMutableDictionary *emptyDict = [[NSMutableDictionary alloc] init];
        
        
        self.cuisinePrefs = emptyDict;
    }
}

- (void) addItemViewController:(FlipsideViewController *)controller didFinishEnteringItem:(NSMutableDictionary *)item
{
    // Set properties
    
    NSNumber *stopFreq =[item objectForKey:@"stopFreq"];
    
    self.stopFrequency = [stopFreq intValue];
    self.cuisinePrefs = [item objectForKey:@"cuisineChoices"];
    
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.setvalues;
    
    
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