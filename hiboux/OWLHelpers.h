//
//  OWLHelpers.h
//  hiboux
//
//  Created by Yoann Gern on 15.01.14.
//  Copyright (c) 2014 Jonas Oesch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OWLAppDelegate.h"
#import "Registration.h"

@interface OWLHelpers : NSObject

// All methods are public and static
// because they are utility methods
+ (NSArray *)getOwls;
+ (NSArray *)speciesInfo;
+ (Registration *)getLastOwl;
+ (NSArray *)weatherInfo;
+ (void)deleteOwls;
+ (void)deleteOwlAtIndex:(int) index;

@end
