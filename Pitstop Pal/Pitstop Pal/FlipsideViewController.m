//
//  FlipsideViewController.m
//  Pitstop Pal
//
//  Created by Colin Lockareff on 9/6/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController ()


@end

@implementation FlipsideViewController
@synthesize sliderValue,stopFreqLabel, americanButton, asianButton, barButton, barbequeButton, breakfastButton, chineseButton, coffeeButton, dinerButton, europeanButton, fastFoodButton, indianButton, koreanButton, mexicanButton, pizzaButton, seafoodButton, steakhouseButton, sushiButton, thaiButton, vegetarianButton, vietnameseButton;

int stopFreq;
NSMutableDictionary *cuisineChoices;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    cuisineChoices = [NSMutableDictionary dictionaryWithCapacity:20];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)returnToMainScreen:(id)sender {
}

- (IBAction)sliderMoved:(id)sender {
    stopFreq = sliderValue.value;
    
    NSString *newFreqLabel = [NSString stringWithFormat:@"Every %i Miles", stopFreq];
    
    stopFreqLabel.text = newFreqLabel;
    
}



- (IBAction)american:(id)sender {
    if (americanButton.isHighlighted)
        americanButton.highlighted = false;
    else
        americanButton.highlighted = true;
    
    
}
- (IBAction)bar:(id)sender {
}
- (IBAction)asian:(id)sender {
}
- (IBAction)barbeque:(id)sender {
}
- (IBAction)breakfast:(id)sender {
}
- (IBAction)chinese:(id)sender {
}
- (IBAction)coffee:(id)sender {
}
- (IBAction)diner:(id)sender {
}
- (IBAction)european:(id)sender {
}
- (IBAction)fastFood:(id)sender {
}
- (IBAction)indian:(id)sender {
}
- (IBAction)korean:(id)sender {
}
- (IBAction)mexican:(id)sender {
}
- (IBAction)pizza:(id)sender {
}
- (IBAction)seafood:(id)sender {
}
- (IBAction)steakhouse:(id)sender {
}
- (IBAction)sushi:(id)sender {
}
- (IBAction)thai:(id)sender {
}
- (IBAction)vietnamese:(id)sender {
    
}
- (IBAction)vegetarian:(id)sender {
}

- (void) buttonClicked: (NSString*) cuisine
{
    NSString * buttonLabel = [NSString stringWithFormat:@"%@Button", cuisine];
    
    
    
}


@end
