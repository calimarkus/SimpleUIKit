//
//  ActivityViewController.m
//  ExampleProject
//

#import "ActivityViewController.h"

#import "SimpleActivityView.h"
#import "SimpleTableView.h"

NSString *const ActivityReuseIdentifier = @"ActivityReuseIdentifier";
NSString *const NoSelectionIndicatorIdentifier = @"NoSelectionIndicatorIdentifier";

@implementation ActivityViewController {
  SimpleTableView *_simpleTableView;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.title = @"SimpleActivityView";
  }
  return self;
}

- (void)loadView
{
  SimpleTableView *simpleTableView = [[SimpleTableView alloc] initWithTableViewStyle:UITableViewStyleGrouped];
  [simpleTableView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ActivityReuseIdentifier];
  [simpleTableView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NoSelectionIndicatorIdentifier];
  simpleTableView.sectionModels = [self _createSections];
  self.view = simpleTableView.tableView;
  _simpleTableView = simpleTableView;
}

- (NSArray<STVSection *> *)_createSections
{
  __weak typeof(self) weakSelf = self;
  return @[[STVSection sectionWithTitle:@"On NavigationController.view" sectionIndexTitle:nil rows:
            @[[STVRow
               rowWithCellReuseIdentifier:ActivityReuseIdentifier
               title:@"Show \"Loading\" for 2s"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                 [[SimpleActivityView activityViewWithTitle:@"Loading (2s)"]
                  presentActivityViewOnView:weakSelf.navigationController.view
                  activityBlock:^(SimpleActivityView *activityView, SimpleActivityViewDismissBlock dismissBlock) {
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                      dismissBlock();
                    });
                  }];
               }],
              [STVRow
               rowWithCellReuseIdentifier:ActivityReuseIdentifier
               title:@"Show \"Loading\" for 5s"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                 [[SimpleActivityView activityViewWithTitle:@"Loading (5s)"]
                  presentActivityViewOnView:weakSelf.navigationController.view
                  activityBlock:^(SimpleActivityView *activityView, SimpleActivityViewDismissBlock dismissBlock) {
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                      dismissBlock();
                    });
                  }];
               }],
              [STVRow
               rowWithCellReuseIdentifier:ActivityReuseIdentifier
               title:@"Show Countdown"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                 [[SimpleActivityView  activityViewWithTitle:@"5"]
                  presentActivityViewOnView:weakSelf.navigationController.view
                  activityBlock:^(SimpleActivityView *activityView, SimpleActivityViewDismissBlock dismissBlock) {
                    for (NSInteger i=5; i>=0; i--) {
                      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((5-i) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        if (i == 0) {
                          dismissBlock();
                        } else {
                          activityView.label.text =[NSString stringWithFormat:@"%@ seconds…", @(i)];
                        }
                      });
                    }
                  }];
               }]]],
           [STVSection sectionWithTitle:@"On TableViewCell" sectionIndexTitle:nil rows:
            @[[STVRow
               rowWithCellReuseIdentifier:NoSelectionIndicatorIdentifier
               title:@"Show for 2s"
               subtitle:nil
               configureCellBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                 cell.selectionStyle = UITableViewCellSelectionStyleNone;
               }
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                 SimpleActivityView *activityView = [SimpleActivityView new];
                 activityView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1.0];
                 activityView.activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
                 [activityView
                  presentActivityViewOnView:cell.contentView
                  activityBlock:^(SimpleActivityView *activityView, SimpleActivityViewDismissBlock dismissBlock) {
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                      dismissBlock();
                    });
                  }];
               }]]],
           [STVSection sectionWithTitle:@"Custom Presentation" sectionIndexTitle:nil rows:
            @[[STVRow
               rowWithCellReuseIdentifier:NoSelectionIndicatorIdentifier
               title:@"Show for 2s"
               subtitle:nil
               configureCellBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                 cell.selectionStyle = UITableViewCellSelectionStyleNone;
               }
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                 SimpleActivityView *activityView = [SimpleActivityView activityViewWithTitle:@"Loading"];
                 activityView.frame = CGRectMake(40, (weakSelf.navigationController.view.bounds.size.height-80)/2.0,
                                                 weakSelf.navigationController.view.bounds.size.width - 80,
                                                 80);
                 activityView.layer.cornerRadius = 8.0;
                 activityView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.75];
                 [weakSelf.navigationController.view addSubview:activityView];
                 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                   [activityView removeFromSuperview];
                 });
               }]]]];
}

@end
