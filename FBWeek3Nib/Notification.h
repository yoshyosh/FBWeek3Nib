//
//  Notification.h
//  FBWeek3Nib
//
//  Created by Joseph Anderson on 4/11/14.
//  Copyright (c) 2014 yoshyosh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notification : NSObject

@property (nonatomic) NSURL *profilePicUrl;
@property (nonatomic) NSString *text;
@property (nonatomic) NSURL *iconUrl;
@property (nonatomic) NSString *timestamp;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)notificationsWithArray:(NSArray *)array;
+ (NSArray *)fakeNotifications;

@end
