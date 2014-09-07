//
//  FlipsideViewController.m
//  Pitstop Pal
//
//  Created by Colin Lockareff on 9/6/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import "FlipsideViewController.h"
#import "MainViewController.h"

@interface FlipsideViewController ()


@end

@implementation FlipsideViewController
@synthesize sliderValue,stopFreqLabel, americanButton, asianButton, barButton, barbequeButton, breakfastButton, chineseButton, coffeeButton, dinerButton, europeanButton, fastFoodButton, indianButton, koreanButton, mexicanButton, pizzaButton, seafoodButton, steakhouseButton, sushiButton, thaiButton, vegetarianButton, vietnameseButton;

int stopFreq;
NSMutableDictionary *cuisineChoices;
UIImage *check;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    cuisineChoices = [NSMutableDictionary dictionaryWithCapacity:20];
    
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"american"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"asian"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"bar"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"barbeque"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"breakfast"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"chinese"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"coffee"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"diner"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"european"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"fastFood"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"indian"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"korean"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"mexican"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"pizza"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"seafood"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"steakhouse"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"sushi"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"thai"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"vegetarian"];
    [cuisineChoices setObject:[NSNumber numberWithBool:NO] forKey:@"vietnamese"];
    
    check = [UIImage imageNamed:@"checkMark"];
    
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
    
    MainViewController *mainLayer = [self.storyboard instantiateViewControllerWithIdentifier:@"mainView"];
    mainLayer.stopFrequency = stopFreq;
    mainLayer.cuisinePrefs = cuisineChoices;
    [self.navigationController pushViewController:mainLayer animated:YES];
    
    
    
    
}

- (IBAction)sliderMoved:(id)sender {
    stopFreq = sliderValue.value;
    
    NSString *newFreqLabel = [NSString stringWithFormat:@"Every %i Miles", stopFreq];
    
    stopFreqLabel.text = newFreqLabel;
    
}



- (IBAction)american:(id)sender {
    if ([[cuisineChoices objectForKey:@"american"] isEqualToNumber:@0])
    {
        [americanButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"american"];
    }
  else
    {
        [americanButton setImage:[UIImage imageNamed:@"American.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"american"];
    }
    
    
}
- (IBAction)bar:(id)sender {
    if ([[cuisineChoices objectForKey:@"bar"] isEqualToNumber:@0])
    {
        [barButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"bar"];
    }
    else
    {
        [barButton setImage:[UIImage imageNamed:@"Bar.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"bar"];
    }
}
- (IBAction)asian:(id)sender {
    if ([[cuisineChoices objectForKey:@"asian"] isEqualToNumber:@0])
    {
        [asianButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"asian"];
    }
    else
    {
        [asianButton setImage:[UIImage imageNamed:@"Asian.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"asian"];
    }
}
- (IBAction)barbeque:(id)sender {
    if ([[cuisineChoices objectForKey:@"barbeque"] isEqualToNumber:@0])
    {
        [barbequeButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"barbeque"];
    }
    else
    {
        [barbequeButton setImage:[UIImage imageNamed:@"Barbeque.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"barbeque"];
    }
}
- (IBAction)breakfast:(id)sender {
    if ([[cuisineChoices objectForKey:@"breakfast"] isEqualToNumber:@0])
    {
        [breakfastButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"breakfast"];
    }
    else
    {
        [breakfastButton setImage:[UIImage imageNamed:@"Breakfast.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"breakfast"];
    }
}
- (IBAction)chinese:(id)sender {
    if ([[cuisineChoices objectForKey:@"chinese"] isEqualToNumber:@0])
    {
        [chineseButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"chinese"];
    }
    else
    {
        [chineseButton setImage:[UIImage imageNamed:@"Chinese.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"chinese"];
    }
}
- (IBAction)coffee:(id)sender {
    if ([[cuisineChoices objectForKey:@"coffee"] isEqualToNumber:@0])
    {
        [coffeeButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"coffee"];
    }
    else
    {
        [coffeeButton setImage:[UIImage imageNamed:@"Coffee.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"coffee"];
    }
}
- (IBAction)diner:(id)sender {
    if ([[cuisineChoices objectForKey:@"diner"] isEqualToNumber:@0])
    {
        [dinerButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"diner"];
    }
    else
    {
        [dinerButton setImage:[UIImage imageNamed:@"Diner.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"diner"];
    }
}
- (IBAction)european:(id)sender {
    if ([[cuisineChoices objectForKey:@"european"] isEqualToNumber:@0])
    {
        [europeanButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"european"];
    }
    else
    {
        [europeanButton setImage:[UIImage imageNamed:@"European.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"european"];
    }
}
- (IBAction)fastFood:(id)sender {
    if ([[cuisineChoices objectForKey:@"fastFood"] isEqualToNumber:@0])
    {
        [fastFoodButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"fastFood"];
    }
    else
    {
        [fastFoodButton setImage:[UIImage imageNamed:@"Fast Food.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"fastFood"];
    }
}
- (IBAction)indian:(id)sender {
    if ([[cuisineChoices objectForKey:@"indian"] isEqualToNumber:@0])
    {
        [indianButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"indian"];
    }
    else
    {
        [indianButton setImage:[UIImage imageNamed:@"Indian.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"indian"];
    }
}
- (IBAction)korean:(id)sender {
    if ([[cuisineChoices objectForKey:@"korean"] isEqualToNumber:@0])
    {
        [koreanButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"korean"];
    }
    else
    {
        [koreanButton setImage:[UIImage imageNamed:@"Korean.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"korean"];
    }
}
- (IBAction)mexican:(id)sender {
    if ([[cuisineChoices objectForKey:@"mexican"] isEqualToNumber:@0])
    {
        [mexicanButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"mexican"];
    }
    else
    {
        [mexicanButton setImage:[UIImage imageNamed:@"Mexican.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"mexican"];
    }
}
- (IBAction)pizza:(id)sender {
    if ([[cuisineChoices objectForKey:@"pizza"] isEqualToNumber:@0])
    {
        [pizzaButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"pizza"];
    }
    else
    {
        [pizzaButton setImage:[UIImage imageNamed:@"Pizza.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"pizza"];
    }
}
- (IBAction)seafood:(id)sender {
    if ([[cuisineChoices objectForKey:@"seafood"] isEqualToNumber:@0])
    {
        [seafoodButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"seafood"];
    }
    else
    {
        [seafoodButton setImage:[UIImage imageNamed:@"Seafood.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"seafood"];
    }
}
- (IBAction)steakhouse:(id)sender {
    if ([[cuisineChoices objectForKey:@"steakhouse"] isEqualToNumber:@0])
    {
        [steakhouseButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"steakhouse"];
    }
    else
    {
        [steakhouseButton setImage:[UIImage imageNamed:@"Steakhouse.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"steakhouse"];
    }
}
- (IBAction)sushi:(id)sender {
    if ([[cuisineChoices objectForKey:@"sushi"] isEqualToNumber:@0])
    {
        [sushiButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"sushi"];
    }
    else
    {
        [sushiButton setImage:[UIImage imageNamed:@"Sushi.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"sushi"];
    }
}
- (IBAction)thai:(id)sender {
    if ([[cuisineChoices objectForKey:@"thai"] isEqualToNumber:@0])
    {
        [thaiButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"thai"];
    }
    else
    {
        [thaiButton setImage:[UIImage imageNamed:@"Thai.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"thai"];
    }
}
- (IBAction)vietnamese:(id)sender {
    if ([[cuisineChoices objectForKey:@"vietnamese"] isEqualToNumber:@0])
    {
        [vietnameseButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"vietnamese"];
    }
    else
    {
        [vietnameseButton setImage:[UIImage imageNamed:@"Vietnamese.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"vietnamese"];
    }
}
- (IBAction)vegetarian:(id)sender {
    if ([[cuisineChoices objectForKey:@"vegetarian"] isEqualToNumber:@0])
    {
        [vegetarianButton setImage:check forState:normal];
        [cuisineChoices setObject:[NSNumber numberWithBool:YES] forKey:@"vegetarian"];
    }
    else
    {
        [vegetarianButton setImage:[UIImage imageNamed:@"Vegetarian.png"] forState:normal];
        [cuisineChoices setValue:[NSNumber numberWithBool:NO] forKey:@"vegetarian"];
    }
}


@end
