//
//  OWLRecensements.m
//  hiboux
//
//  Created by Jonas Oesch on 25.11.13.
//  Copyright (c) 2013 Jonas Oesch. All rights reserved.
//

#import "OWLRecensementStore.h"

static OWLRecensementStore *defaultStore = nil;

@implementation OWLRecensementStore


+ (OWLRecensementStore *)defaultStore {
    if(!defaultStore) {
        defaultStore = [[super allocWithZone:NULL] init];
    }
    return defaultStore;
}

+ (id) allocWithZone:(NSZone *)zone {
    return [self defaultStore];
}

- (id) init {
    if(defaultStore) {
        return defaultStore;
    }
    
    self = [super init];
    return self;
}



-(NSArray *)getRecensements {
    return [NSArray arrayWithObjects:nil];
}

@end
