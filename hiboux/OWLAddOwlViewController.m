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
#import "OWLHelpers.h"

@interface OWLAddOwlViewController ()

@property NSDate *timestamp;

// References to the different UI Elements in the Storyboard
@property (strong, nonatomic) IBOutlet UIScrollView *scrolly;
@property (weak, nonatomic) IBOutlet UISegmentedControl *ageControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *weatherControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sexeControl;
@property (weak, nonatomic) IBOutlet UIButton *speciesButton;
@property (weak, nonatomic) IBOutlet NYSliderPopover *tempSlider;
@property (weak, nonatomic) IBOutlet UITextField *noRingField;
@property (weak, nonatomic) IBOutlet UITextField *weightField;
@property (weak, nonatomic) IBOutlet UITextField *wingSizeField;
@property (weak, nonatomic) IBOutlet UITextField *tarseField;
@property (weak, nonatomic) IBOutlet UITextField *commentField;

@property UITextField *activeField;


@end

@implementation OWLAddOwlViewController

// This method is called when creating a new instance
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // No custom init code yet
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Setup of the scroll view
    // This is needed so it can scroll up when the keyboard is shown
    // For now, it's the height of the 4 inch screen
    // 3.5 inch works but is not properly supported
    [self.scrolly setScrollEnabled:YES];
    [self.scrolly setContentSize:CGSizeMake(320, 540)];
    

    // Re-Setting species, weather and temperature to the value they were for the last record
    // Temperature and weather will probably not change during a session
    // When an owl inhabits an area, it likely that there are more from the same species
    
    NSString *lastOwlSpecies = [[OWLHelpers getLastOwl] valueForKey:@"Species"];
    lastOwlSpecies = (lastOwlSpecies != NULL) ? lastOwlSpecies : [OWLHelpers speciesInfo][0][@"Species"];
    [self.speciesButton setTitle: lastOwlSpecies forState:UIControlStateNormal];

    
    NSString *lastOwlWeather = [[OWLHelpers getLastOwl] valueForKey:@"statusWeather"];
    NSUInteger lastOwlWeatherIndex = [[OWLHelpers weatherInfo] indexOfObject:lastOwlWeather];
    [self.weatherControl setSelectedSegmentIndex:lastOwlWeatherIndex];
    
    NSNumber *lastOwlTemperature =[[OWLHelpers getLastOwl] valueForKey:@"temperature"];
    [self.tempSlider setValue:[lastOwlTemperature floatValue] animated:YES];
    
    [self registerForKeyboardNotifications];
    
}

- (IBAction)unwindToAddOwls:(UIStoryboardSegue *)unwindSegue
{
    [self.speciesButton setTitle: self.species forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Add an Owl
- (IBAction)done:(id)sender {
    
    // Creating a new object in persistence
    OWLAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    [self saveCurrentViewToPersistenceWithContext:context];
    
}

// Writes the state of UI elements to persistence
- (void)saveCurrentViewToPersistenceWithContext:(NSManagedObjectContext *) context
{
    
    NSManagedObject *currentRegistration = [NSEntityDescription insertNewObjectForEntityForName:@"Registration" inManagedObjectContext:context];
    
    OWLAppDelegate *myAppDelegate = (OWLAppDelegate *)[[UIApplication sharedApplication] delegate];
    CLLocation *position = myAppDelegate.locationManager.location;
    
    // Define a formatter
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    
    // timestamp (NSDate)
    NSDate *today = [NSDate date];
    [currentRegistration setValue: today forKey:@"timestamp"];
    
    
    // coorX (NSNumber)
    double latitude = position.coordinate.latitude;
    NSNumber *coorX = [NSNumber numberWithDouble:latitude];
    [currentRegistration setValue: coorX forKey:@"coorX"];
    
    
    // coorY (NSNumber)
    double longitude = position.coordinate.longitude;
    NSNumber *coorY = [NSNumber numberWithDouble:longitude];
    [currentRegistration setValue:coorY forKey:@"coorY"];
    
    
    // Species
    // Family
    // Class
    NSString *species = [[self.speciesButton titleLabel] text];
    NSArray *speciesInfo = [OWLHelpers speciesInfo];
    [currentRegistration setValue:species forKey:@"Species"];
    
    for (NSArray *currSpecies in speciesInfo) {
        if([[currSpecies valueForKey:@"Species" ] isEqualToString:species]) {
            [currentRegistration setValue:[currSpecies valueForKey:@"Family" ] forKey:@"family"];
            [currentRegistration setValue:[currSpecies valueForKey:@"Class" ] forKey:@"classe"];
        }
    }
    
    
    // altitude (NSNumber)
    // Not implemented. Because iOS doesn't handle altitude consistently
    /* 
    if (position.verticalAccuracy > 0) {
        NSNumber *altitude = [NSNumber numberWithInt:position.altitude];
    }
    */
    [currentRegistration setValue:[NSNumber numberWithInt:0] forKey:@"altitude"];
    
    
    // sexe (NSString)
    NSArray *sexes = [NSArray arrayWithObjects:@"Male", @"Femelle", nil];
    int selectedSex = [[self sexeControl] selectedSegmentIndex];
    NSString *sexe = sexes[selectedSex];
    [currentRegistration setValue: sexe forKey:@"sexe"];
    
    
    // age (NSNumber)
    int age = [[self ageControl] selectedSegmentIndex];
    age += 1;
    NSNumber *ageCorrect = [NSNumber numberWithInt:age];
    [currentRegistration setValue: ageCorrect forKey:@"age"];
    
    
    // statusWeather (NSString)
    int temps = [self.weatherControl selectedSegmentIndex];
    NSString *statusWeather = [OWLHelpers weatherInfo][temps];
    [currentRegistration setValue: statusWeather forKey:@"statusWeather"];
    
    
    // temperature (NSNumber)
    NSNumber *temperature = [NSNumber numberWithFloat:self.tempSlider.value];
    [currentRegistration setValue: temperature forKey:@"temperature"];
    
    
    // no_ring (NSString)
    NSString *no_ring = self.noRingField.text;
    [currentRegistration setValue: no_ring forKey:@"no_ring"];
    
    
    // weight (NSNumber)
    NSNumber *weight = [formatter numberFromString:self.weightField.text];
    [currentRegistration setValue: weight forKey:@"weight"];
    
    
    // wing_size (NSNumber)
    NSNumber *wing_size = [formatter numberFromString:self.wingSizeField.text];
    [currentRegistration setValue: wing_size forKey:@"wing_size"];
    
    
    // tarse (NSNumber)
    NSNumber *tarse = [formatter numberFromString:self.tarseField.text];
    [currentRegistration setValue: tarse forKey:@"tarse"];
    
    
    // comments (NSString)
    NSString *comments = self.commentField.text;
    [currentRegistration setValue:comments forKey:@"comments"];
    
    
    // locationName (NSString)
    // Not implemented. Not feasible without user input or internet.
    NSString *locationName = NULL;
    [currentRegistration setValue: locationName forKey:@"locationName"];
    
    
    NSLog(@"Save record: %@", currentRegistration);
    
    NSError *error;
    [context save:&error];

    
}


// called when another view is about to be shown.
// events shouldn't be handled by this view anymore
-(void)viewWillDisappear:(BOOL)animated {
    
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                          name:UIKeyboardWillShowNotification
                                          object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                          name:UIKeyboardWillHideNotification
                                          object:nil];
    
    [super viewWillDisappear:animated];
}


// Show a label with the current value whenever the slider is moved
- (IBAction)tempSliderValueChanged:(id)sender {
    [self updateSliderPopoverText];
}

// Define what is shown in the slider label
- (void)updateSliderPopoverText
{
    self.tempSlider.popover.textLabel.text = [NSString stringWithFormat:@"%0.0f °C", self.tempSlider.value];
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // Define the view area when keyboard is shown
    // 40 is a value that has been found by trial and works well with the height of the text fields
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height+40, 0.0);
    self.scrolly.contentInset = contentInsets;
    self.scrolly.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    CGRect aRect = self.view.frame;
    aRect.size.height -= keyboardSize.height+40;
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
        [self.scrolly scrollRectToVisible:self.activeField.frame animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrolly.contentInset = contentInsets;
    self.scrolly.scrollIndicatorInsets = contentInsets;
}


// Save the text field we're editing for later use
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeField = textField;
}

// Reset the instance variable
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeField = nil;
}

// Called in viewDidLoad
// Tells the viewController to call keyboardWasShown and keyboardWillBeHidden for the respective events
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}


// To dismis the keyboard when the user taps the background
// there is one giant button behind everything which receives touch events
- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    self.scrolly.contentInset = contentInsets;
    self.scrolly.scrollIndicatorInsets = contentInsets;
    
    [self.scrolly setScrollEnabled:YES];
    [self.scrolly setContentSize:CGSizeMake(320, 540)];
}

@end
