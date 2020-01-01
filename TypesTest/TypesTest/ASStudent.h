//
//  ASStudent.h
//  TypesTest
//
//  Created by Michael Sidoruk on 01.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum ASdasdasdasdasd{ // енумчик ASGender
    ASGenderMale,
    ASGenderFemale
} ASGender; // <- тип

typedef NS_ENUM(NSInteger, ASGender1) {
    ASGenderMale1,
    ASGenderFemale1
};

typedef enum ASGender2 : NSInteger {
   ASGenderMale2,
   ASGenderFemale2
} ASGender2;

typedef NSInteger MyInteger; // typeAliase

@interface ASStudent : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) ASGender gender;
@property (assign, nonatomic) ASGender1 gender1;
@property (assign, nonatomic) ASGender2 gender2;

@end

NS_ASSUME_NONNULL_END
