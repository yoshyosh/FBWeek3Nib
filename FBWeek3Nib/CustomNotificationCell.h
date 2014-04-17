//
//  CustomNotificationCell.h
//  FBWeek3Nib
//
//  Created by Joseph Anderson on 4/11/14.
//  Copyright (c) 2014 yoshyosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNotificationCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *author;

@property (strong, nonatomic) IBOutlet UILabel *description;
@property (strong, nonatomic) IBOutlet UILabel *timestamp;
@property (strong, nonatomic) IBOutlet UIImageView *profilePic;

@end
