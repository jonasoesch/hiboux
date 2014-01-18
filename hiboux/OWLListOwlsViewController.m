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
    NSLog(@"%@", [[OWLHelpers getLastOwl] valueForKey:@"age"]);

}


-(void)updateOwls
{
    NSArray *objects = [OWLHelpers getOwls];
    
    self.owls = objects;
    
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
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.LL.yyyy 'à' H:m"];
    cell.detailTextLabel.text = [[formatter stringFromDate:[owl valueForKey:@"timestamp"]] description];
    return cell;
}




 


- (IBAction)send:(id)sender {

    NSLog(@"Send");
    
    [self saveJSON];
    
}

// Send Owls to hibou.yoanngern.ch
- (void)saveJSON {
    
    // Define a date formatter
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-LL-d H:m:s Z"];
    
    // get Owls in the internal DB
    NSArray *owls = [OWLHelpers getOwls];
    
    // Define key for JSON Array
    NSMutableArray *keyArray = [[NSMutableArray alloc] init];
    [keyArray addObject:@"coorX"];
    [keyArray addObject:@"coorY"];
    [keyArray addObject:@"timestamp"];
    [keyArray addObject:@"altitude"];
    [keyArray addObject:@"age"];
    [keyArray addObject:@"sexe"];
    [keyArray addObject:@"no_ring"];
    [keyArray addObject:@"weight"];
    [keyArray addObject:@"wing_size"];
    [keyArray addObject:@"tarse"];
    [keyArray addObject:@"comments"];
    [keyArray addObject:@"species"];
    [keyArray addObject:@"class"];
    [keyArray addObject:@"family"];
    [keyArray addObject:@"locationName"];
    [keyArray addObject:@"statusWeather"];
    [keyArray addObject:@"temperature"];
    
    NSMutableArray *arrayOfDicts = [[NSMutableArray alloc] init];
    
    // Check all elements one by one to control what we send in the JSON Array
    for (NSObject *owl in owls) {
        
        NSMutableArray *valueArray = [[NSMutableArray alloc] init];
        if ([owl valueForKey:@"coorX"] != nil) {
            [valueArray addObject:[owl valueForKey:@"coorX"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"coorY"] != nil) {
            [valueArray addObject:[owl valueForKey:@"coorY"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"timestamp"] != nil) {
            // Format the date to String
            NSString *time = [formatter stringFromDate:[owl valueForKey:@"timestamp"]];
            [valueArray addObject:time];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"altitude"] != nil) {
            [valueArray addObject:[owl valueForKey:@"altitude"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"age"] != nil) {
            [valueArray addObject:[owl valueForKey:@"age"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"sexe"] != nil) {
            [valueArray addObject:[owl valueForKey:@"sexe"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"no_ring"] != nil) {
            [valueArray addObject:[owl valueForKey:@"no_ring"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"weight"] != nil) {
            [valueArray addObject:[owl valueForKey:@"weight"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"wing_size"] != nil) {
            [valueArray addObject:[owl valueForKey:@"wing_size"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"tarse"] != nil) {
            [valueArray addObject:[owl valueForKey:@"tarse"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"comments"] != nil) {
            [valueArray addObject:[owl valueForKey:@"comments"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"species"] != nil) {
            [valueArray addObject:[owl valueForKey:@"species"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"classe"] != nil) {
            [valueArray addObject:[owl valueForKey:@"classe"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"family"] != nil) {
            [valueArray addObject:[owl valueForKey:@"family"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"locationName"] != nil) {
            [valueArray addObject:[owl valueForKey:@"locationName"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"statusWeather"] != nil) {
            [valueArray addObject:[owl valueForKey:@"statusWeather"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        if ([owl valueForKey:@"temperature"] != nil) {
            [valueArray addObject:[owl valueForKey:@"temperature"]];
        } else {
            [valueArray addObject:[NSNull null]];
        }
        
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:valueArray forKeys:keyArray];
        [arrayOfDicts addObject:dict];
        
    }
    
    NSArray *info = [NSArray arrayWithArray:arrayOfDicts];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:info options:NSJSONWritingPrettyPrinted error:NULL];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    // Create the POST parameter
    NSString *post = [[NSString alloc] initWithFormat:@"owls=%@",jsonString];

    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    // Create the request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://hibou.yoanngern.ch/test.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    
    // Send JSON to hibou.yoanngern.ch
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    // If there is no problem, delete internal data
    if ([response statusCode] == 200) {
        [OWLHelpers deleteOwls];
        [self updateOwls];
    } else {
        NSLog(@"error");
    }
}


// Override to support editing the table view.
// for swipe to delete
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"%ld", (long)indexPath.row);
        [OWLHelpers deleteOwlatIndex:(int)indexPath.row];
        [self updateOwls];
    }
}

@end
