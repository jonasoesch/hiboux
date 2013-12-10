//
//  Registration.h
//  hiboux
//
//  Created by Yoann Gern on 28.11.13.
//  Copyright (c) 2013 Jonas Oesch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Registration : NSManagedObject

@property (nonatomic, retain) NSNumber * coorX;
@property (nonatomic, retain) NSNumber * coorY;
@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) NSNumber * altitude;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * sexe;
@property (nonatomic, retain) NSString * no_ring;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) NSNumber * wing_size;
@property (nonatomic, retain) NSNumber * tarse;
@property (nonatomic, retain) NSString * comments;
@property (nonatomic, retain) NSString * spieces;
@property (nonatomic, retain) NSString * family;
@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) NSString * statusWeather;
@property (nonatomic, retain) NSNumber * temperature;
@property (nonatomic, retain) NSString * classe;

@end
