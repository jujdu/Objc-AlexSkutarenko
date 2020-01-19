//
//  DataManager.h
//  CoreDataTest
//
//  Created by Michael Sidoruk on 19.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)generateUniversity;
- (void)saveContext;

+ (DataManager *)sharedManager;

@end

NS_ASSUME_NONNULL_END
