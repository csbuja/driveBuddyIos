//
//  FlipsideViewController.h
//  Pitstop Pal
//
//  Created by Colin Lockareff on 9/6/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *sliderValue;

- (IBAction)sliderMoved:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *stopFreqLabel;

- (IBAction)returnToMainScreen:(id)sender;

@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;




@property (weak, nonatomic) IBOutlet UIButton *americanButton;
- (IBAction)american:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *asianButton;
- (IBAction)asian:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *barButton;
- (IBAction)bar:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *barbequeButton;
- (IBAction)barbeque:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *breakfastButton;
- (IBAction)breakfast:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *chineseButton;
- (IBAction)chinese:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *coffeeButton;
- (IBAction)coffee:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *dinerButton;
- (IBAction)diner:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *europeanButton;
- (IBAction)european:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *fastFoodButton;
- (IBAction)fastFood:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *indianButton;
- (IBAction)indian:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *koreanButton;
- (IBAction)korean:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *mexicanButton;
- (IBAction)mexican:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *pizzaButton;
- (IBAction)pizza:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *seafoodButton;
- (IBAction)seafood:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *steakhouseButton;
- (IBAction)steakhouse:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *sushiButton;
- (IBAction)sushi:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *thaiButton;
- (IBAction)thai:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *vegetarianButton;
- (IBAction)vegetarian:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *vietnameseButton;
- (IBAction)vietnamese:(id)sender;















@end
