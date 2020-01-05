//
//  ASStudent.h
//  BitsTest
//
//  Created by Michael Sidoruk on 05.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ASStudentSubjectTypeBiology         = 1 << 0,
    ASStudentSubjectTypeMath            = 1 << 1,
    ASStudentSubjectTypeDevelopment     = 1 << 2,
    ASStudentSubjectTypeEngineering     = 1 << 3,
    ASStudentSubjectTypeArt             = 1 << 4,
    ASStudentSubjectTypePhycology       = 1 << 5,
    ASStudentSubjectTypeAnatomy         = 1 << 6
} ASStudentSubjectType;

NS_ASSUME_NONNULL_BEGIN

@interface ASStudent : NSObject

@property (assign, nonatomic) ASStudentSubjectType subjectType;

//
//@property (assign, nonatomic) BOOL studiesBiology;
//@property (assign, nonatomic) BOOL studiesMath;
//@property (assign, nonatomic) BOOL studiesDevelopment;
//@property (assign, nonatomic) BOOL studiesEngineering;
//@property (assign, nonatomic) BOOL studiesArt;
//@property (assign, nonatomic) BOOL studiesPhyclogy;
//@property (assign, nonatomic) BOOL studiesAnatomy;

@end

NS_ASSUME_NONNULL_END
