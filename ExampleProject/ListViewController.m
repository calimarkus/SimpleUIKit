//
//  ListViewController.m
//  SimpleUIKit ExampleProject
//

#import "ListViewController.h"

#import "ActivityViewController.h"
#import "AttributedStringViewController.h"
#import "MotionEffectsViewController.h"
#import "SimpleTableView.h"

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
  SimpleTableView *simpleTableView = [[SimpleTableView alloc] initWithTableViewStyle:UITableViewStyleGrouped];
  [simpleTableView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ListReuseIdentifier];
  simpleTableView.sectionModels = [self _createSections];
  _simpleTableView = simpleTableView;

  self.view = simpleTableView.tableView;
}

- (NSArray<STVSection *> *)_createSections
{
  __weak typeof(self) weakSelf = self;
  return @[[STVSection sectionWithTitle:@"Projects" rows:
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
                 //
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
                 //
               }],
              [STVRow
               rowWithCellReuseIdentifier:ListReuseIdentifier
               title:@"SimpleMotionEffects"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                 [weakSelf.navigationController pushViewController:[MotionEffectsViewController new] animated:YES];
               }]]]];
}

@end
