//
//  ASStudent.m
//  BitsTest
//
//  Created by Michael Sidoruk on 05.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ASStudent.h"

@implementation ASStudent

- (NSString *) answerByType:(ASStudentSubjectType) type {
    return self.subjectType & type ? @"yes" : @"no";
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Student studies: \n"
            "biology = %@ \n"
            "math = %@ \n"
            "development = %@ \n"
            "engineering = %@ \n"
            "art = %@ \n"
            "phycology = %@ \n"
            "anatomy = %@ \n",
            [self answerByType:ASStudentSubjectTypeBiology],
            [self answerByType:ASStudentSubjectTypeMath],
            [self answerByType:ASStudentSubjectTypeDevelopment],
            [self answerByType:ASStudentSubjectTypeEngineering],
            [self answerByType:ASStudentSubjectTypeArt],
            [self answerByType:ASStudentSubjectTypePhycology],
            [self answerByType:ASStudentSubjectTypeAnatomy]];
}
@end
