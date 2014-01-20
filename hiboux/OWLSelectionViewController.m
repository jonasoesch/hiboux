//
//  OWLSelectionViewController.m
//  hiboux
//
//  Created by Jonas Oesch on 25.12.13.
//  Copyright (c) 2013 Jonas Oesch. All rights reserved.
//

#import "OWLSelectionViewController.h"
#import "OWLHelpers.h"

@interface OWLSelectionViewController ()

@property NSArray *species;

@end

@implementation OWLSelectionViewController


// Initialize the tableView
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // No Custom initialization yet
    }
    return self;
}

// When the view is loaded we get all the the species from our canonical source
// they are then kept in an instance variable
- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *speciesInfo = [OWLHelpers speciesInfo];
    
    NSMutableArray *speciesArray = [[NSMutableArray alloc] initWithCapacity:[speciesInfo count]];
    for (int i = 0; i<[speciesInfo count]; i++) {
        [speciesArray addObject:speciesInfo[i][@"Species"]];
    }
    self.species = speciesArray;
}

// Apple template functions
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// We don't want sections in our tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// Can use the species array to tell the tableView how many rows to render
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.species count];
}

// Getting the name of the species from the species instance variable to show at a given row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SpeciesSelection";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.species objectAtIndex:indexPath.row];
    return cell;
}



// When the view is about to be dismissed, we set the species instance variable of
// the destination view (OWLAddView) to the selected species.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    OWLAddOwlViewController *addView = (OWLAddOwlViewController *) segue.destinationViewController;
    
    [addView setSpecies:[[(UITableViewCell *)sender textLabel] text]];
    // Pass the selected object to the new view controller.
}


@end
