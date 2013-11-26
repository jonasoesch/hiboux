//
//  OWLRecensements.h
//  hiboux
//
//  Created by Jonas Oesch on 25.11.13.
//  Copyright (c) 2013 Jonas Oesch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OWLRecensement.h"

@interface OWLRecensementStore : NSObject

+ (OWLRecensementStore *) defaultStore;
- (NSArray *) getRecensements;

@end
