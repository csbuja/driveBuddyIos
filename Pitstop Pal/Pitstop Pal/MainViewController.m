
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
        self.stopFrequency = 150; //measured in miles
        
        NSMutableDictionary *emptyDict = [[NSMutableDictionary alloc] init];
        
        self.cuisinePrefs = emptyDict;
    }
}

- (void) setvaluesWithFrequency:(int) frequency foodPrefs:(NSMutableDictionary *) foodPrefs{
    self.cuisinePrefs = foodPrefs;
    self.stopFrequency = frequency;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //[self  setvalues ];
    if(self.stopFrequency == 0)
        self.stopFrequency = 150;
        self.cuisinePrefs = [NSMutableDictionary dictionaryWithCapacity:20];
        
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"american"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"asian"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"bar"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"barbeque"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"breakfast"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"chinese"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"coffee"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"diner"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"european"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"fastFood"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"indian"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"korean"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"mexican"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"pizza"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"seafood"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"steakhouse"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"sushi"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"thai"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"vegetarian"];
        [self.cuisinePrefs setObject:[NSNumber numberWithBool:NO] forKey:@"vietnamese"];
    
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