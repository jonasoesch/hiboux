//
//  OWLHelpers.m
//  hiboux
//
//  Created by Yoann Gern on 15.01.14.
//  Copyright (c) 2014 Jonas Oesch. All rights reserved.
//

#import "OWLHelpers.h"

@implementation OWLHelpers


// Re-usable function to get an array of all the owls from persistence.
+ (NSArray *)getOwls {
    OWLAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Registration" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    // Sort by timestamp descending
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"timestamp" ascending:NO];
    [request setSortDescriptors:@[sortDescriptor]];
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    return objects;
    
}

// To avoid duplication the canonical mapping between species, families and classes
// is always loaded from this function
+ (NSArray *)speciesInfo {
    return
    @[
     @{
         @"Species": @"Chouette hulotte",
         @"Family": @"Strigidae",
         @"Class": @"Aves"
         },
     @{
         @"Species": @"Nyctale de Tengmalm",
         @"Family": @"Strigidae",
         @"Class": @"Aves"
         },
     @{
         @"Species": @"Chevêchette d'Europe",
         @"Family": @"Strigidae",
         @"Class": @"Aves"
         },
     @{
         @"Species": @"Chouette effraie",
         @"Family": @"Tytonidae",
         @"Class": @"Aves"
         },
     @{
         @"Species": @"Chevêche d'Athéna",
         @"Family": @"Strigidae",
         @"Class": @"Aves"
         },
     @{
         @"Species": @"Petit-duc scops",
         @"Family": @"Strigidae",
         @"Class": @"Aves"
         },
     @{
         @"Species": @"Hibou moyen-duc",
         @"Family": @"Strigidae",
         @"Class": @"Aves"
         },
     @{
         @"Species": @"Hibou grand-duc",
         @"Family": @"Strigidae",
         @"Class": @"Aves"
         }
     
     ];
}

// get the last owl recorded
+ (Registration *)getLastOwl
{
    NSArray *theOwls = [OWLHelpers getOwls];
    if ([theOwls count] > 0) {
        return [OWLHelpers getOwls][0];
    } else
    {
        return NULL;
    }
    
}

// The canonical weather states
+ (NSArray *)weatherInfo
{
    return @[@"sun", @"rain", @"cloudy", @"fog", @"period of sunshine", @"snow"];
}

// Utility function to remove all records from persistence
+ (void)deleteOwls
{
    OWLAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Registration" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSArray *allData = [context executeFetchRequest:request error:NULL];
    
    for (NSManagedObject *obj in allData) {
        [context deleteObject:obj];
    }
    
    NSError *error;
    [context save:&error];
}

// Utility function to remove a record at a given index from persistence
+ (void)deleteOwlAtIndex:(int) index
{
    OWLAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Registration" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSArray *allData = [context executeFetchRequest:request error:NULL];
    
    [context deleteObject: [allData objectAtIndex:index]];
    
    NSError *error;
    [context save:&error];
}
@end
