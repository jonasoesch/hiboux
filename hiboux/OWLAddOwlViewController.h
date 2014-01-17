//
//  OWLAddOwlViewController.h
//  hiboux
//
//  Created by Jonas Oesch on 25.11.13.
//  Copyright (c) 2013 Jonas Oesch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWLAppDelegate.h"
#import "OWLSelectionViewController.h"

@interface OWLAddOwlViewController : UIViewController

@property NSString *species;
@property NSString *sexe;
@property NSManagedObject *currentRegistration;
@property NSManagedObjectContext *context;


@end
