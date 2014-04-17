//
//  NotificationViewController.h
//  FBWeek3Nib
//
//  Created by Joseph Anderson on 4/10/14.
//  Copyright (c) 2014 yoshyosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) NSArray *notificationArray;
@end
