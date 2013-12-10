//
//  OWLAddOwlViewController.m
//  hiboux
//
//  Created by Jonas Oesch on 25.11.13.
//  Copyright (c) 2013 Jonas Oesch. All rights reserved.
//

#import "OWLAddOwlViewController.h"
#import "OWLAppDelegate.h"

@interface OWLAddOwlViewController ()
@property NSDate *timestamp;
@property (weak, nonatomic) IBOutlet UISegmentedControl *age;
@property (weak, nonatomic) IBOutlet UISegmentedControl *temps;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sexeControl;


- (IBAction)done:(id)sender;

@end

@implementation OWLAddOwlViewController

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
	// Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender {
    
    OWLAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *newRegistration;
    newRegistration = [NSEntityDescription insertNewObjectForEntityForName:@"Registration" inManagedObjectContext:context];
    
    // coorX (NSNumber)
    NSNumber *coorX = [NSNumber numberWithInt:37.30411079];
    [newRegistration setValue: coorX forKey:@"coorX"];
    
    
    // coorY (NSNumber)
    NSNumber *coorY = [NSNumber numberWithInt:-121.97536127];
    [newRegistration setValue: coorY forKey:@"coorY"];
    
    
    // timestamp (NSDate)
    NSDate *today = [NSDate date];
    [newRegistration setValue: today forKey:@"timestamp"];
    
    
    // altitude (NSNumber)
    NSNumber *altitude = [NSNumber numberWithInt:500.23];
    [newRegistration setValue: altitude forKey:@"altitude"];
    
    
    // age (NSNumber)
    int age = [[self age] selectedSegmentIndex];
    age += 1;
    NSNumber *ageCorrect = [NSNumber numberWithInt:age];
    [newRegistration setValue: ageCorrect forKey:@"age"];
    
    
    // sexe (NSString)
    NSArray *sexes = [NSArray arrayWithObjects:@"Male", @"Femelle", nil];
    int selectedSex = [[self sexeControl] selectedSegmentIndex];
    self.sexe = sexes[selectedSex];
    [newRegistration setValue: self.sexe forKey:@"sexe"];
    
    
    // no_ring (NSNumber)
    NSNumber *no_ring = [NSNumber numberWithInt:1234];
    [newRegistration setValue: no_ring forKey:@"no_ring"];
    
    
    // weight (NSNumber)
    NSNumber *weight = [NSNumber numberWithInt:900];
    [newRegistration setValue: weight forKey:@"weight"];
    
    
    // wing_size (NSNumber)
    NSNumber *wing_size = [NSNumber numberWithInt:20];
    [newRegistration setValue: wing_size forKey:@"wing_size"];
    
    
    // tarse (NSNumber)
    NSNumber *tarse = [NSNumber numberWithInt:55];
    [newRegistration setValue: tarse forKey:@"tarse"];
    
    
    // comments (NSString)
    NSString *comments = @"Ceci est un commentaire";
    [newRegistration setValue: comments forKey:@"comments"];
    
    
    // spieces (NSString)
    NSString *spieces = @"B. lacteus";
    [newRegistration setValue: spieces forKey:@"spieces"];
    
    
    // classe (NSString)
    NSString *classe = @"Aves";
    [newRegistration setValue: classe forKey:@"classe"];
    
    
    // family (NSString)
    NSString *family = @"Strigidae";
    [newRegistration setValue: family forKey:@"family"];
    
    
    // locationName (NSString)
    NSString *locationName = @"Mt Hibou";
    [newRegistration setValue: locationName forKey:@"locationName"];
    
    
    // statusWeather (NSString)
    int temps = [[self temps] selectedSegmentIndex];
    NSArray *arrayTemps = [NSArray arrayWithObjects:@"sun", @"rain", @"cloudy", @"fog", @"period of sunshine", @"snow", nil];
    NSString *statusWeather = arrayTemps[temps];
    [newRegistration setValue: statusWeather forKey:@"statusWeather"];
    
    
    // temperature (NSNumber)
    NSNumber *temperature = [NSNumber numberWithInt:20];
    [newRegistration setValue: temperature forKey:@"temperature"];
    
    
    NSError *error;
    [context save:&error];
    
    
    OWLAppDelegate *myAppDelegate = (OWLAppDelegate *)[[UIApplication sharedApplication] delegate];
    CLLocation *position = myAppDelegate.locationManager.location;
    double latitude = position.coordinate.latitude;
    double longitude = position.coordinate.longitude;
    altitude = [NSNumber numberWithInt:position.altitude];
    
    NSLog(@"Lat: %f / Long: %f / Alt: %@", latitude, longitude, altitude);
    
    NSLog(@"Age: %i", age);
    NSLog(@"Sexe: %@", self.sexe);
    NSLog(@"Timestamp: %@", [self timestamp]);

    NSLog(@"coorX: %@",         [newRegistration valueForKey:@"coorX"] );
    NSLog(@"coorY: %@",         [newRegistration valueForKey:@"coorY"] );
    NSLog(@"timestamp: %@",     [newRegistration valueForKey:@"timestamp"] );
    NSLog(@"altitude: %@",      [newRegistration valueForKey:@"altitude"] );
    NSLog(@"age: %@",           [newRegistration valueForKey:@"age"] );
    NSLog(@"sexe: %@",          [newRegistration valueForKey:@"sexe"] );
    NSLog(@"no_ring: %@",       [newRegistration valueForKey:@"no_ring"] );
    NSLog(@"weight: %@",        [newRegistration valueForKey:@"weight"] );
    NSLog(@"wing_size: %@",     [newRegistration valueForKey:@"wing_size"] );
    NSLog(@"tarse: %@",         [newRegistration valueForKey:@"tarse"] );
    NSLog(@"comments: %@",      [newRegistration valueForKey:@"comments"] );
    NSLog(@"spieces: %@",       [newRegistration valueForKey:@"spieces"] );
    NSLog(@"family: %@",        [newRegistration valueForKey:@"family"] );
    NSLog(@"locationName: %@",  [newRegistration valueForKey:@"locationName"] );
    NSLog(@"statusWeather: %@", [newRegistration valueForKey:@"statusWeather"] );
    NSLog(@"temperature: %@",   [newRegistration valueForKey:@"temperature"] );
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
@end
