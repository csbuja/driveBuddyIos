//
//  DrivingViewController.m
//  Pitstop Pal
//
//  Created by Colin Lockareff on 9/6/14.
//  Copyright (c) 2014 MHACKS PV. All rights reserved.
//

#import "DrivingViewController.h"


@interface DrivingViewController ()

@end

@implementation DrivingViewController
@synthesize destinationAddress, stopFreq, cuisinePrefs, leftGasArrow, rightGasArrow, leftFoodArrow, rightFoodArrow, gasStationName, gasPrice, milesToFood, gasIcon, foodName, foodStars, foodIcon, milesToGas, routeMap, locationManager;

NSMutableArray *foodPrefs;
NSArray *gasOptions;
NSArray *foodOptions;
NSString *gName;
float gPrice;
int distToG;
NSString *gasAddress;
NSURL *gIconURL;
NSString *fName;
NSURL *fStarsURL;
int distToF;
NSString *foodAddress;
NSURL *fIconURL;
int gasIndex = 0;
int foodIndex = 0;
NSArray *currentPitstopLatLon;
NSArray *currentLatLon;
NSMutableDictionary *wayPoints;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.foodPrefs =
    
    [foodPrefs initWithObjects: nil];
        
        if ([cuisinePrefs objectForKey:@"american"])
        {[foodPrefs addObject:@"american"];}
        if ([cuisinePrefs objectForKey:@"asian"])
        {[foodPrefs addObject:@"asian"];}
        if ([cuisinePrefs objectForKey:@"bar"])
        {[foodPrefs addObject:@"bar"];}
        if ([cuisinePrefs objectForKey:@"barbeque"])
        {[foodPrefs addObject:@"barbeque"];}
        if ([cuisinePrefs objectForKey:@"breakfast"])
        {[foodPrefs addObject:@"breakfast"];}
        if ([cuisinePrefs objectForKey:@"chinese"])
        {[foodPrefs addObject:@"chinese"];}
        if ([cuisinePrefs objectForKey:@"coffee"])
        {[foodPrefs addObject:@"coffee"];}
        if ([cuisinePrefs objectForKey:@"diner"])
        {[foodPrefs addObject:@"diner"];}
        if ([cuisinePrefs objectForKey:@"european"])
        {[foodPrefs addObject:@"european"];}
        if ([cuisinePrefs objectForKey:@"fastFood"])
        {[foodPrefs addObject:@"fastFood"];}
        if ([cuisinePrefs objectForKey:@"indian"])
        {[foodPrefs addObject:@"indian"];}
        if ([cuisinePrefs objectForKey:@"korean"])
        {[foodPrefs addObject:@"korean"];}
        if ([cuisinePrefs objectForKey:@"mexican"])
        {[foodPrefs addObject:@"mexican"];}
        if ([cuisinePrefs objectForKey:@"pizza"])
        {[foodPrefs addObject:@"pizza"];}
        if ([cuisinePrefs objectForKey:@"seafood"])
        {[foodPrefs addObject:@"seafood"];}
        if ([cuisinePrefs objectForKey:@"steakhouse"])
        {[foodPrefs addObject:@"steakhouse"];}
        if ([cuisinePrefs objectForKey:@"sushi"])
        {[foodPrefs addObject:@"sushi"];}
        if ([cuisinePrefs objectForKey:@"thai"])
        {[foodPrefs addObject:@"thai"];}
        if ([cuisinePrefs objectForKey:@"vegetarian"])
        {[foodPrefs addObject:@"vegetarian"];}
        if ([cuisinePrefs objectForKey:@"vietnamese"])
        {[foodPrefs addObject:@"vietnamese"];}
    
    
    destinationAddress = [destinationAddress stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    addressToLatLon *address = [[addressToLatLon alloc] initWithAdress:destinationAddress];
    currentLatLon = [address getLatLon];
    
    [self initGmaps];
    
    [self getGasOptions];
    
    [self getFoodOptions: foodPrefs];
    
    [self getCurrentGasInfo: gasIndex];
     
    [self getCurrentFoodInfo: foodIndex];
    
    [self displayGasPitstop];
    
    [self displayFoodPitstop];
     
     
     
}

- (void) initGmaps
{
    GoogMapsController *gMaps = [[GoogMapsController alloc] initGoogMapsController:currentLatLon stopFreq:stopFreq];
    
    [gMaps getWaypoints:^(NSMutableDictionary *infos, NSError *error) {
        wayPoints = infos;
        
        
        if (!infos)
        {
            NSLog(@"%@", error);
            // present to the user the error (property on NSError called localizedDescription and localizedReason).
        }
    }];
    
    NSMutableDictionary *dict = [wayPoints objectForKey:@"body"];
    
    NSString *str = [dict objectForKey:@"routes.0.overview_polyline.points"];
    
    GMSPath *path = [GMSPath pathFromEncodedPath: str];
    
    GMSPolyline *polyLine = [GMSPolyline polylineWithPath:path];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:0 longitude:0 zoom:2];
    
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    polyLine.map = mapView;
    
    NSArray *pitstops = [wayPoints objectForKey:@"pitstops"];
    
    for (int i=0; i<pitstops.count; i++)
    {
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake([pitstops[i][0] doubleValue], [ pitstops[i][1]  doubleValue]);
        marker.appearAnimation = kGMSMarkerAnimationPop;
    }
    
    currentPitstopLatLon = [gMaps getCurrPitstop];
}
     
    
    

- (NSArray*)getGasOptions
{
    GasPitstop *gasStop = [[GasPitstop alloc] initWithLatLon: currentPitstopLatLon];

    [gasStop getInfo:^(NSArray *infos, NSError *error)
    {
        gasOptions = infos;
        if (!infos)
        {
            NSLog(@"%@", error);
                // present to the user the error (property on NSError called localizedDescription and localizedReason).
        }
    }];
    
    NSArray *array = [[NSArray alloc] init];

    return array;
}

     
- (NSArray*)getFoodOptions: (NSMutableArray*) prefs
{
    FoodPitstop *foodStop = [[FoodPitstop alloc] initWithLatLon: currentPitstopLatLon];
    
    [foodStop getInfoWithFoodPrefs:prefs withCompletionHandler:^(NSArray *infos, NSError *error) {
        foodOptions = infos;
        if (!infos)
        {
            NSLog(@"%@", error);
            // present to the user the error (property on NSError called localizedDescription and localizedReason).
        }
        
    }];
    
    NSArray *array = [NSArray init];
    return array;
    

}
     
- (void) getCurrentGasInfo: (int) index
{
    NSMutableDictionary *gasDict;
    gasDict = [gasOptions objectAtIndex:index];
    gName = [gasDict objectForKey:@"name"];
  //  gPrice = [gasDict objectForKey:@"price"];
    gasAddress = [gasDict objectForKey:@"address"];
    
    
    
    
  //  distToG
    
    
}
     
- (void) getCurrentFoodInfo: (int) index
{
    NSMutableDictionary *foodDict;
    foodDict = [foodOptions objectAtIndex:index];
    fName = [foodDict objectForKey:@"name"];
    foodAddress = [foodDict objectForKey:@"address"];
    
    
    
  //  distToF =;
         
}
     
- (void) displayGasPitstop
{
    gasStationName.text = gName;
    gasPrice.text = [NSString stringWithFormat:@"$%f/gal", gPrice];
    milesToGas.text = [NSString stringWithFormat:@"%i Miles", distToG];
   
    
 /*
    gIconURL = [NSURL URLWithString:@"http://d1mxp0yvealdwc.cloudfront.net/e92c939d-e83b-4592-b367-327fa67339fb/1001%20123.jpg"];
    NSData *gIconData = [NSData dataWithContentsOfURL:gIconURL];
    gasIcon.image = [UIImage imageWithData:gIconData];
   */
    
    
}


- (void) displayFoodPitstop
{
    foodName.text = fName;
    milesToFood.text = [NSString stringWithFormat:@"%i Miles", distToF];
   
    /*
    
    fStarsURL = [NSURL URLWithString:@"http://d1mxp0yvealdwc.cloudfront.net/e92c939d-e83b-4592-b367-327fa67339fb/1001%20123.jpg"];
    NSData *fStarsData = [NSData dataWithContentsOfURL:fStarsURL];
    foodStars.image = [UIImage imageWithData:fStarsData];
    
    
    fIconURL = [NSURL URLWithString:@"http://d1mxp0yvealdwc.cloudfront.net/e92c939d-e83b-4592-b367-327fa67339fb/1001%20123.jpg"];
    NSData *fIconData = [NSData dataWithContentsOfURL:fIconURL];
    foodIcon.image = [UIImage imageWithData:fIconData];
    */
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)leftGas:(id)sender
{
    if (gasIndex > 0)
    {
        gasIndex--;
        [self getCurrentGasInfo:gasIndex];
        [self displayGasPitstop];
        
    }
}

- (IBAction)rightGas:(id)sender {
    //create maxIndex constraint
        gasIndex++;
        [self getCurrentGasInfo:gasIndex];
        [self displayGasPitstop];
        
    }

- (IBAction)leftFood:(id)sender {
    if (foodIndex > 0)
    {
        foodIndex--;
        [self getCurrentFoodInfo:foodIndex];
        [self displayFoodPitstop];
        
    }
}

- (IBAction)rightFood:(id)sender {
    //create maxIndex constraint
    foodIndex++;
    [self getCurrentFoodInfo:foodIndex];
    [self displayFoodPitstop];
    

}
- (IBAction)startGasDirections:(id)sender {
}

- (IBAction)startFoodDirections:(id)sender {
}
@end
