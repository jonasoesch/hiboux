//
//  AppDelegate.h
//  hiboux
//
//  Created by Jonas Oesch on 28.10.13.
//  Copyright (c) 2013 Jonas Oesch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OWLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
