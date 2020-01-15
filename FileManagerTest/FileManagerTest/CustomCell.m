//
//  CustomCell.m
//  FileManagerTest
//
//  Created by Michael Sidoruk on 15.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setForPath:(NSString *)path image:(UIImage *)image {
    self.myTextLabel.text = path;
    self.myImageView.image = image;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
