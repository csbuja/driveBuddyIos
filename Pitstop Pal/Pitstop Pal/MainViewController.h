//
//  MainViewController.h
//  Pitstop Pal
//
//  Created by Colin Lockareff on 9/6/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property NSMutableDictionary *cuisinePrefs;
@property int stopFrequency;


- (IBAction)PITSToptions:(id)sender;

- (IBAction)startTrip:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *destinationField;

- (IBAction)ExitText:(id)sender;




@end
