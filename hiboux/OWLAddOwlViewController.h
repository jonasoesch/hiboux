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

// Is public so the OWLlSelectionView can pass the name of the selected owl
@property NSString *species;


@end
