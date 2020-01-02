//
//  ASDoctor.m
//  DelegateTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ASDoctor.h"
#import "ASPatient.h"

@implementation ASDoctor

#pragma mark - ASPatientDelegate

- (void) patientFeelsBad:(ASPatient*) patient {
    NSLog(@"Patient %@ feels bad", patient.name);
    if (patient.temperature > 37.f && patient.temperature <= 39.f) {
        [patient takePill];
    } else if (patient.temperature > 39.f) {
        [patient makeShot];
    } else {
        NSLog(@"Patient %@ shold left", patient.name);
    }
}
- (void) patient:(ASPatient*) patient hasQuestion:(NSString*) question {
    NSLog(@"patient %@ has a question: %@", patient.name, question);
}

@end
