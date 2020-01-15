//
//  CustomCell.h
//  FileManagerTest
//
//  Created by Michael Sidoruk on 15.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *myTextLabel;

- (void)setForPath:(NSString *)path image:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
