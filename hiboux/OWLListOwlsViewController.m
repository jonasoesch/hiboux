//
//  OWLListOwlsViewController.m
//  hiboux
//
//  Created by Jonas Oesch on 25.11.13.
//  Copyright (c) 2013 Jonas Oesch. All rights reserved.
//

#import "OWLListOwlsViewController.h"
#import "OWLAddOwlViewController.h"
#import "OWLHelpers.h"


@interface OWLListOwlsViewController ()

@property NSArray *owls;

@end

@implementation OWLListOwlsViewController

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
	
    [self updateOwls];


}


-(void)updateOwls
{
    NSArray *objects = [OWLHelpers getOwls];
    
    self.owls = objects;
    NSLog(@"%i", [self.owls count]);
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToListOwls:(UIStoryboardSegue *)unwindSegue
{
    OWLAddOwlViewController *source = unwindSegue.sourceViewController;
    NSLog(@"Returned form segue: %@", source.sexe);
    
    [self updateOwls];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.owls count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"OWLEntry";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSManagedObject *owl = [self.owls objectAtIndex:indexPath.row];
    cell.textLabel.text = [owl valueForKey:@"species"];
    cell.detailTextLabel.text = [[owl valueForKey:@"timestamp"] description];
    return cell;
}




 


- (IBAction)send:(id)sender {

    NSLog(@"Send");
    
    [self saveJSON];
    
}


- (void)saveJSON {
    
    NSArray *objects = [OWLHelpers getOwls];
    
    //NSLog(@"%@", objects);
    
    //NSData *dataJSON = [NSJSONSerialization dataWithJSONObject:objects options:NSJSONWritingPrettyPrinted error:NULL];
    
    //NSLog(@"%@", dataJSON);
    
}

@end
