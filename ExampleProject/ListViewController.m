//
//  ListViewController.m
//  SimpleUIKit ExampleProject
//

#import "ListViewController.h"

#import "MotionEffectsViewController.h"
#import "SimpleTableView.h"

NSString *const ReuseIdentifier = @"ReuseIdentifier";

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
  [simpleTableView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ReuseIdentifier];
  simpleTableView.sectionModels = [self _createSections];
  _simpleTableView = simpleTableView;

  self.view = simpleTableView.tableView;
}

- (NSArray<STVSection *> *)_createSections
{
  __weak typeof(self) weakSelf = self;
  return @[[STVSection sectionWithTitle:@"Projects" rows:
            @[[STVRow
               rowWithCellReuseIdentifier:ReuseIdentifier
               title:@"SimpleMotionEffects"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                 [weakSelf.navigationController pushViewController:[MotionEffectsViewController new] animated:YES];
               }]]]];
}

@end
