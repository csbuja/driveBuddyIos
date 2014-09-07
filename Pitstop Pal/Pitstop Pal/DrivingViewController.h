//
//  DrivingViewController.h
//  Pitstop Pal
//
//  Created by Colin Lockareff on 9/6/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "FoodPitstop.h"
#import "GasPitstop.h"
#import "PitStop.h"
#import "GoogMapsController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>
#import "addressToLatLon.h"



@interface DrivingViewController : UIViewController

@property NSString *destinationAddress;
@property NSMutableDictionary *cuisinePrefs;
@property int stopFreq;
@property (strong) CLLocationManager * locationManager;


@property (weak, nonatomic) IBOutlet UIButton *leftGasArrow;
@property (weak, nonatomic) IBOutlet UIButton *rightGasArrow;
@property (weak, nonatomic) IBOutlet UIButton *leftFoodArrow;
@property (weak, nonatomic) IBOutlet UIButton *rightFoodArrow;


- (IBAction)leftGas:(id)sender;

- (IBAction)rightGas:(id)sender;

- (IBAction)leftFood:(id)sender;

- (IBAction)rightFood:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *gasStationName;

@property (weak, nonatomic) IBOutlet UILabel *gasPrice;

@property (weak, nonatomic) IBOutlet UILabel *milesToGas;

@property (weak, nonatomic) IBOutlet UIImageView *gasIcon;



@property (weak, nonatomic) IBOutlet UILabel *foodName;

@property (weak, nonatomic) IBOutlet UIImageView *foodStars;

@property (weak, nonatomic) IBOutlet UILabel *milesToFood;

@property (weak, nonatomic) IBOutlet UIImageView *foodIcon;



- (IBAction)startGasDirections:(id)sender;

- (IBAction)startFoodDirections:(id)sender;


@property (weak, nonatomic) IBOutlet UIImageView *routeMap;



@end
