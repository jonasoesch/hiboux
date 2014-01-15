//
//  OWLHelpers.m
//  hiboux
//
//  Created by Yoann Gern on 15.01.14.
//  Copyright (c) 2014 Jonas Oesch. All rights reserved.
//

#import "OWLHelpers.h"

@implementation OWLHelpers


+ (NSArray *)getOwls {
    OWLAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Registration" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"timestamp" ascending:NO];
    [request setSortDescriptors:@[sortDescriptor]];
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    return objects;
}

@end
