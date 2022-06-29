//
//  LocalNotificationViewController.m
//  SimpleUIKit ExampleProject
//

#import "LocalNotificationViewController.h"

#import "SimpleLocalNotification.h"
#import "SimpleTableView.h"
#import "UIAlertController+SimpleUIKit.h"

NSString *const LocalNotifReuseIdentifier = @"LocalNotifReuseIdentifier";

@implementation LocalNotificationViewController {
  SimpleTableView *_simpleTableView;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.title = @"SimpleLocalNotification";
  }
  return self;
}

- (void)loadView
{
  SimpleTableView *simpleTableView = [[SimpleTableView alloc] initWithTableViewStyle:UITableViewStyleInsetGrouped];
  [simpleTableView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:LocalNotifReuseIdentifier];
  simpleTableView.sectionModels = [self _createSections];
  _simpleTableView = simpleTableView;

  self.view = simpleTableView.tableView;
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];

  [SimpleLocalNotification isRegisteredForLocalNotificationsWithCompletion:^(BOOL userDidAllowAlerts, UNNotificationSettings *settings) {
    if (!userDidAllowAlerts) {
      [SimpleLocalNotification registerForLocalNotificationsIfNeededWithCompletion:^(BOOL granted, UNNotificationSettings *settings, NSError *error) {
        [UIAlertController presentAlertFromViewController:self
                                                withTitle:@"Status"
                                                  message:(granted ?
                                                           @"Notifications granted!" :
                                                           @"Notifications not granted.")
                                  confirmationButtonTitle:@"OK"];
      }];
    }
  }];
}

- (NSArray<STVSection *> *)_createSections
{
  return @[[STVSection sectionWithTitle:nil sectionIndexTitle:nil rows:
            @[[STVRow
               rowWithCellReuseIdentifier:LocalNotifReuseIdentifier
               title:@"Schedule now"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
              [SimpleLocalNotification scheduleLocalNotificationWithAlertBody:@"This is the text"
                                                          timeIntervalFromNow:0.01
                                                             uniqueIdentifier:@"0"
                                                                   completion:nil];
            }],[STVRow
                rowWithCellReuseIdentifier:LocalNotifReuseIdentifier
                title:@"Schedule in 1s"
                subtitle:nil
                configureCellBlock:nil
                didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
              [SimpleLocalNotification scheduleLocalNotificationWithAlertBody:@"This is the text"
                                                          timeIntervalFromNow:1
                                                             uniqueIdentifier:@"1"
                                                                   completion:nil];
            }],
              [STVRow
               rowWithCellReuseIdentifier:LocalNotifReuseIdentifier
               title:@"Schedule in 2s"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                [SimpleLocalNotification scheduleLocalNotificationWithAlertBody:@"This is the text"
                                                            timeIntervalFromNow:2
                                                               uniqueIdentifier:@"2"
                                                                     completion:nil];
              }],
              [STVRow
               rowWithCellReuseIdentifier:LocalNotifReuseIdentifier
               title:@"Schedule in 5s"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                [SimpleLocalNotification scheduleLocalNotificationWithAlertBody:@"This is the text"
                                                            timeIntervalFromNow:5
                                                               uniqueIdentifier:@"5"
                                                                     completion:nil];
              }]]]];
}

@end
