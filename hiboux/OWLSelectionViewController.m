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

//  
- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *speciesInfo = [OWLHelpers speciesInfo];
    
    NSMutableArray *speciesArray = [[NSMutableArray alloc] initWithCapacity:[speciesInfo count]];
    for (int i = 0; i<[speciesInfo count]; i++) {
        [speciesArray addObject:speciesInfo[i][@"Species"]];
    }
    NSLog(@"%@", speciesArray);
    self.species =speciesArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.species count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SpeciesSelection";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.species objectAtIndex:indexPath.row];
    return cell;
}


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    OWLAddOwlViewController *addView = (OWLAddOwlViewController *) segue.destinationViewController;
    
    [addView setSpecies:[[(UITableViewCell *)sender textLabel] text]];
    // Pass the selected object to the new view controller.
}


@end
