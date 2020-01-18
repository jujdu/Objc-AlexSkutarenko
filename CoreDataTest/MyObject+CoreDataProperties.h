//
//  MyObject+CoreDataProperties.h
//  CoreDataTest
//
//  Created by Michael Sidoruk on 18.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//
//

#import "MyObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MyObject (CoreDataProperties)

+ (NSFetchRequest<MyObject *> *)fetchRequest;


@end

NS_ASSUME_NONNULL_END
