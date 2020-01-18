//
//  Students+CoreDataProperties.h
//  CoreDataTest
//
//  Created by Michael Sidoruk on 18.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//
//

#import "Students+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Students (CoreDataProperties)

+ (NSFetchRequest<Students *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *dateBirth;
@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nullable, nonatomic, copy) NSNumber *score;

@end

NS_ASSUME_NONNULL_END
