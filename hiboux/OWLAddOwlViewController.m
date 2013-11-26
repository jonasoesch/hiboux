//
//  OWLAddOwlViewController.m
//  hiboux
//
//  Created by Jonas Oesch on 25.11.13.
//  Copyright (c) 2013 Jonas Oesch. All rights reserved.
//

#import "OWLAddOwlViewController.h"

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
    
    NSArray *sexes = [NSArray arrayWithObjects:@"Male", @"Femelle", nil];
    
    int age = [[self age] selectedSegmentIndex];
    age += 1;
    
    int selectedSex = [[self sexeControl] selectedSegmentIndex];
    self.sexe = sexes[selectedSex];
    
    [self setTimestamp:[NSDate date]];
    
    NSLog(@"Age: %i", age);
    NSLog(@"Sexe: %@", self.sexe);
    NSLog(@"Timestamp: %@", [self timestamp]);
    
}
@end
