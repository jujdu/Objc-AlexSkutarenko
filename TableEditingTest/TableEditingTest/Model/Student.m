//
//  Student.m
//  TableEditingTest
//
//  Created by Michael Sidoruk on 14.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "Student.h"

@implementation Student

static NSString* firstNames[] =  { @"Adam", @"Alex", @"Aaron", @"Ben", @"Carl", @"Dan", @"David", @"Edward", @"Fred", @"Frank", @"George", @"Hal", @"Hank", @"Ike", @"John", @"Jack", @"Joe", @"Larry", @"Monte", @"Matthew", @"Mark", @"Nathan", @"Otto", @"Paul", @"Peter", @"Roger", @"Roger", @"Steve", @"Thomas", @"Tim"};
static NSString* lastNames[] =  { @"Anderson", @"Ashwoon", @"Aikin", @"Bateman", @"Bongard", @"Bowers", @"Boyd", @"Cannon", @"Cast", @"Deitz", @"Dewalt", @"Ebner", @"Frick", @"Hancock", @"Haworth", @"Hesch", @"Hoffman", @"Kassing", @"Knutson", @"Lawless", @"Lawicki", @"Mccord", @"McCormack", @"Miller", @"Myers", @"Nugent", @"Ortiz", @"Orwig", @"Ory", @"Holms"};

static int namesCount = 29;

+ (Student *)randomStudent {
    Student *student = [[Student alloc]init];
    
    student.firstName = firstNames[arc4random() % namesCount];
    student.lastName = lastNames[arc4random() % namesCount];
    student.averageGrade = ((CGFloat)(arc4random() % 301 + 200)) / 100;
    return student;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
