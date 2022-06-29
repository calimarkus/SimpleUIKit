//
//  ListViewController.m
//  SimpleUIKit ExampleProject
//

#import "ListViewController.h"

#import "ActivityViewController.h"
#import "AlertViewController.h"
#import "AttributedStringViewController.h"
#import "LocalNotificationViewController.h"
#import "MotionEffectsViewController.h"
#import "SimpleTableView.h"
#import "TableViewViewController.h"

NSString *const ListReuseIdentifier = @"ListReuseIdentifier";

@implementation ListViewController {
  SimpleTableView *_simpleTableView;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.title = @"SimpleUIKit";
  }
  return self;
}

- (void)loadView
{
  SimpleTableView *simpleTableView = [[SimpleTableView alloc] initWithTableViewStyle:UITableViewStyleInsetGrouped];
  [simpleTableView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ListReuseIdentifier];
  simpleTableView.sectionModels = [self _createSections];
  _simpleTableView = simpleTableView;

  self.view = simpleTableView.tableView;
}

- (NSArray<STVSection *> *)_createSections
{
  __weak typeof(self) weakSelf = self;
  return @[[STVSection sectionWithTitle:@"Projects" sectionIndexTitle:nil rows:
            @[[STVRow
               rowWithCellReuseIdentifier:ListReuseIdentifier
               title:@"SimpleActivityView"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                 [weakSelf.navigationController pushViewController:[ActivityViewController new] animated:YES];
               }],
              [STVRow
               rowWithCellReuseIdentifier:ListReuseIdentifier
               title:@"SimpleAlertController"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                 [weakSelf.navigationController pushViewController:[AlertViewController new] animated:YES];
               }],
              [STVRow
               rowWithCellReuseIdentifier:ListReuseIdentifier
               title:@"SimpleAttributedString"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                 [weakSelf.navigationController pushViewController:[AttributedStringViewController new] animated:YES];
               }],
              [STVRow
               rowWithCellReuseIdentifier:ListReuseIdentifier
               title:@"SimpleLocalNotification"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                 [weakSelf.navigationController pushViewController:[LocalNotificationViewController new] animated:YES];
              }],
              [STVRow
               rowWithCellReuseIdentifier:ListReuseIdentifier
               title:@"SimpleMotionEffects"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                [weakSelf.navigationController pushViewController:[MotionEffectsViewController new] animated:YES];
              }],
              [STVRow
               rowWithCellReuseIdentifier:ListReuseIdentifier
               title:@"SimpleTableView"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                [weakSelf.navigationController pushViewController:[TableViewViewController new] animated:YES];
              }]]]];
}

@end
