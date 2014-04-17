//
//  NotificationViewController.m
//  FBWeek3Nib
//
//  Created by Joseph Anderson on 4/10/14.
//  Copyright (c) 2014 yoshyosh. All rights reserved.
//

#import "NotificationViewController.h"
#import "CustomNotificationCell.h"
#import "Notification.h"
#import "UIImageView+AFNetworking.h"

@interface NotificationViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation NotificationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Notifications";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    //Not sure how to globally set left and right nav buttonns
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftButton;
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"messages"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.notificationArray = [Notification fakeNotifications];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view methods

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Dont fully understand this block of code
    CustomNotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"notificationCell"];
    if(!cell){
        [tableView registerNib:[UINib nibWithNibName:@"CustomNotificationCell" bundle:nil] forCellReuseIdentifier:@"notificationCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"notificationCell"];
    }
    Notification *singleNotification = [self.notificationArray objectAtIndex:indexPath.row];
    NSString *html = @"This is some <b>HTML</b>";
    NSString *styledHtml = [self styledHTMLwithHTML:html];
    NSAttributedString *attributedText = [self attributedStringWithHTML:styledHtml];
    [cell.profilePic setImageWithURL:[NSURL URLWithString:@"https://pbs.twimg.com/profile_images/421403454104297472/zgjnoNmf.jpeg"] placeholderImage:[UIImage imageNamed:@"normalLike"]];
    cell.author.text = singleNotification.text;
    cell.description.attributedText = attributedText;
    cell.timestamp.text = singleNotification.timestamp;
    
    return cell;
}

- (NSString *)styledHTMLwithHTML:(NSString *)HTML {
    NSString *style = @"<meta charset=\"UTF-8\"><style> body {font-family: 'Helvetica-Neue'; font-size: 20px;} b {font-weight: bold; }</style>";
    return [NSString stringWithFormat:@"%@%@", style, HTML];
}

- (NSAttributedString *)attributedStringWithHTML:(NSString *)HTML {
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType };
    return [[NSAttributedString alloc] initWithData:[HTML dataUsingEncoding:NSUTF8StringEncoding] options:options documentAttributes:NULL error:NULL];
}

@end
