//
//  OWLAddOwlViewController.m
//  hiboux
//
//  Created by Jonas Oesch on 25.11.13.
//  Copyright (c) 2013 Jonas Oesch. All rights reserved.
//

#import "OWLAddOwlViewController.h"
#import "OWLAppDelegate.h"
#import "NYSliderPopover.h"

@interface OWLAddOwlViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrolly;
@property NSDate *timestamp;
@property (weak, nonatomic) IBOutlet UISegmentedControl *age;
@property (weak, nonatomic) IBOutlet UISegmentedControl *temps;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sexeControl;
@property (weak, nonatomic) IBOutlet UIButton *species;
@property (weak, nonatomic) IBOutlet NYSliderPopover *tempSlider;
@property (weak, nonatomic) IBOutlet UITextField *no_ring;
@property (weak, nonatomic) IBOutlet UITextField *weight;
@property (weak, nonatomic) IBOutlet UITextField *wing_size;
@property (weak, nonatomic) IBOutlet UITextField *tarse;


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
    
    OWLAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.context = [appDelegate managedObjectContext];
    self.currentRegistration = [NSEntityDescription insertNewObjectForEntityForName:@"Registration" inManagedObjectContext:self.context];
    
    [self.scrolly setScrollEnabled:YES];
    [self.scrolly setContentSize:CGSizeMake(250, 800)];
    


}

- (IBAction)unwindToAddOwls:(UIStoryboardSegue *)unwindSegue
{
    OWLSelectionViewController *source = unwindSegue.sourceViewController;
    
    [self.species setTitle: [self.currentRegistration valueForKey:@"species"] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender {
    
    OWLAppDelegate *myAppDelegate = (OWLAppDelegate *)[[UIApplication sharedApplication] delegate];
    CLLocation *position = myAppDelegate.locationManager.location;
    
    // coorX (NSNumber)
    double latitude = position.coordinate.latitude;
    NSNumber *coorX = [NSNumber numberWithDouble:latitude];
    [self.currentRegistration setValue: coorX forKey:@"coorX"];
    
    
    // coorY (NSNumber)
    double longitude = position.coordinate.longitude;
    NSNumber *coorY = [NSNumber numberWithDouble:longitude];
    [self.currentRegistration setValue: coorY forKey:@"coorY"];
    
    
    // timestamp (NSDate)
    NSDate *today = [NSDate date];
    [self.currentRegistration setValue: today forKey:@"timestamp"];
    
    
    // altitude (NSNumber)
    NSNumber *altitude = [NSNumber numberWithInt:position.altitude];
    [self.currentRegistration setValue: altitude forKey:@"altitude"];
    
    
    // age (NSNumber)
    int age = [[self age] selectedSegmentIndex];
    age += 1;
    NSNumber *ageCorrect = [NSNumber numberWithInt:age];
    [self.currentRegistration setValue: ageCorrect forKey:@"age"];
    
    
    // sexe (NSString)
    NSArray *sexes = [NSArray arrayWithObjects:@"Male", @"Femelle", nil];
    int selectedSex = [[self sexeControl] selectedSegmentIndex];
    self.sexe = sexes[selectedSex];
    [self.currentRegistration setValue: self.sexe forKey:@"sexe"];
    
    
    // no_ring (NSString)
    [self.currentRegistration setValue: self.no_ring forKey:@"no_ring"];
    
    
    // weight (NSNumber)
    NSNumber *weight = [NSNumber numberWithInt:900];
    [self.currentRegistration setValue: weight forKey:@"weight"];
    
    
    // wing_size (NSNumber)
    NSNumber *wing_size = [NSNumber numberWithInt:20];
    [self.currentRegistration setValue: wing_size forKey:@"wing_size"];
    
    
    // tarse (NSNumber)
    NSNumber *tarse = [NSNumber numberWithInt:55];
    [self.currentRegistration setValue: tarse forKey:@"tarse"];
    
    
    // comments (NSString)
    NSString *comments = @"Ceci est un commentaire";
    [self.currentRegistration setValue: comments forKey:@"comments"];
    
    
    
    // classe (NSString)
    NSString *classe = @"Aves";
    [self.currentRegistration setValue: classe forKey:@"classe"];
    
    
    // family (NSString)
    NSString *family = @"Strigidae";
    [self.currentRegistration setValue: family forKey:@"family"];
    
    
    // locationName (NSString)
    NSString *locationName = @"Mt Hibou";
    [self.currentRegistration setValue: locationName forKey:@"locationName"];
    
    
    // statusWeather (NSString)
    int temps = [[self temps] selectedSegmentIndex];
    NSArray *arrayTemps = [NSArray arrayWithObjects:@"sun", @"rain", @"cloudy", @"fog", @"period of sunshine", @"snow", nil];
    NSString *statusWeather = arrayTemps[temps];
    [self.currentRegistration setValue: statusWeather forKey:@"statusWeather"];
    
    
    // temperature (NSNumber)
    NSNumber *temperature = [NSNumber numberWithInt:20];
    [self.currentRegistration setValue: temperature forKey:@"temperature"];
    
    
    NSError *error;
    [self.context save:&error];
    
    
    
    //NSLog(@"Lat: %f / Long: %f / Alt: %@", latitude, longitude, altitude);
    
    //NSLog(@"Age: %i", age);
    //NSLog(@"Sexe: %@", self.sexe);

    NSLog(@"coorX: %@",         [self.currentRegistration valueForKey:@"coorX"] );
    NSLog(@"coorY: %@",         [self.currentRegistration valueForKey:@"coorY"] );
    NSLog(@"timestamp: %@",     [self.currentRegistration valueForKey:@"timestamp"] );
    NSLog(@"altitude: %@",      [self.currentRegistration valueForKey:@"altitude"] );
    NSLog(@"age: %@",           [self.currentRegistration valueForKey:@"age"] );
    NSLog(@"sexe: %@",          [self.currentRegistration valueForKey:@"sexe"] );
    NSLog(@"no_ring: %@",       [self.currentRegistration valueForKey:@"no_ring"] );
    NSLog(@"weight: %@",        [self.currentRegistration valueForKey:@"weight"] );
    NSLog(@"wing_size: %@",     [self.currentRegistration valueForKey:@"wing_size"] );
    NSLog(@"tarse: %@",         [self.currentRegistration valueForKey:@"tarse"] );
    NSLog(@"comments: %@",      [self.currentRegistration valueForKey:@"comments"] );
    NSLog(@"species: %@",       [self.currentRegistration valueForKey:@"species"] );
    NSLog(@"family: %@",        [self.currentRegistration valueForKey:@"family"] );
    NSLog(@"locationName: %@",  [self.currentRegistration valueForKey:@"locationName"] );
    NSLog(@"statusWeather: %@", [self.currentRegistration valueForKey:@"statusWeather"] );
    NSLog(@"temperature: %@",   [self.currentRegistration valueForKey:@"temperature"] );
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (IBAction)sliderValueChanged:(id)sender
{
    [self updateSliderPopoverText];
}

- (void)updateSliderPopoverText
{
    self.tempSlider.popover.textLabel.text = [NSString stringWithFormat:@"%.2f", self.tempSlider.value];
}


@end
