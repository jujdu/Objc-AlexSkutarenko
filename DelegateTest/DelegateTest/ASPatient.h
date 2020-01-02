//
//  ASPatient.h
//  DelegateTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ASPatientDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface ASPatient : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat temperature;
@property (weak, nonatomic) id <ASPatientDelegate> delegate;

- (void) takePill;
- (void) makeShot;
- (BOOL) howAreU;

@end

NS_ASSUME_NONNULL_END

@protocol ASPatientDelegate <NSObject>
@required
- (void) patientFeelsBad:(ASPatient*_Nonnull) patient;
- (void) patient:(ASPatient*_Nonnull) patient hasQuestion:(NSString*_Nullable) question;

@end
