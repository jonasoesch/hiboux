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

+ (NSArray *)getOwls;
+ (NSArray *)speciesInfo;
+ (Registration *)getLastOwl;
+ (NSArray *)weatherInfo;

@end
