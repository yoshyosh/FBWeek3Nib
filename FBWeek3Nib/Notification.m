//
//  Notification.m
//  FBWeek3Nib
//
//  Created by Joseph Anderson on 4/11/14.
//  Copyright (c) 2014 yoshyosh. All rights reserved.
//

#import "Notification.h"

@implementation Notification

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self){
        self.profilePicUrl = dictionary[@"profilePicUrl"];
        self.text = dictionary[@"text"];
        self.iconUrl = dictionary[@"iconUrl"];
        self.timestamp = dictionary[@"timestamp"];
    }
    return self;
}

+ (NSArray *)notificationsWithArray:(NSArray *)array {
    NSMutableArray *notifications = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in array) {
        Notification *notification = [[Notification alloc] initWithDictionary:dictionary];
        [notifications addObject:notification];
    }
    return notifications;
    
}

+ (NSArray *)fakeNotifications {
    NSArray *fakeDictionaries = @[
                                  @{@"id": @(142),
                                    @"profilePicUrl": @"Picture Here",
                                    @"text": @"This is some descriptive text",
                                    @"iconUrl": @"Like",
                                    @"timestamp":@"3/14/2014"
                                    },
                                  @{@"id": @(142),
                                    @"profilePicUrl": @"Picture Here",
                                    @"text": @"This is some descriptive text",
                                    @"iconUrl": @"Like",
                                    @"timestamp":@"3/14/2014"
                                    },
                                  @{@"id": @(142),
                                    @"profilePicUrl": @"Picture Here",
                                    @"text": @"This is some descriptive text",
                                    @"iconUrl": @"Like",
                                    @"timestamp":@"3/14/2014"
                                    }
                                  ];
    return [Notification notificationsWithArray:fakeDictionaries];
}

@end
