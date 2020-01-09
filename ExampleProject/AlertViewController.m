//
//  AlertViewController.m
//  SimpleUIKit ExampleProject
//

#import "AlertViewController.h"

#import "UIAlertController+SimpleUIKit.h"
#import "SimpleTableView.h"

NSString *const AlertReuseIdentifier = @"AlertReuseIdentifier";

@implementation AlertViewController {
  SimpleTableView *_simpleTableView;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    self.title = @"SimpleAlertController";
  }
  return self;
}

- (void)loadView {
  SimpleTableView *simpleTableView = [[SimpleTableView alloc] initWithTableViewStyle:UITableViewStyleGrouped];
  [simpleTableView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:AlertReuseIdentifier];
  simpleTableView.sectionModels = [self _createSections];
  _simpleTableView = simpleTableView;

  self.view = simpleTableView.tableView;
}

- (NSArray<STVSection *> *)_createSections {
  return @[[STVSection sectionWithTitle:@"Basic" rows:
            @[[STVRow
               rowWithCellReuseIdentifier:AlertReuseIdentifier
               title:@"Show a confirmation alert"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
              [UIAlertController presentAlertFromViewController:self
                                                      withTitle:@"Confirm"
                                                        message:@"This is a message for you."
                                        confirmationButtonTitle:@"Ok"];
            }],
              [STVRow
               rowWithCellReuseIdentifier:AlertReuseIdentifier
               title:@"Show an alert"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                [UIAlertController presentAlertFromViewController:self
                                                        withTitle:@"Title"
                                                          message:@"This is a message for you."
                                                          buttons:@[[SimpleAlertButton defaultButtonWithTitle:@"Ok"],
                                                                    [SimpleAlertButton cancelButtonWithTitle:@"Cancel"]]
                                                    buttonHandler:nil];
              }],
              [STVRow
               rowWithCellReuseIdentifier:AlertReuseIdentifier
               title:@"Show an ActionSheet"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                [UIAlertController presentActionSheetFromViewController:self
                                                             sourceView:cell
                                                              withTitle:nil
                                                                message:nil
                                                                buttons:@[[SimpleAlertButton defaultButtonWithTitle:@"Option 1"],
                                                                          [SimpleAlertButton defaultButtonWithTitle:@"Option 2"],
                                                                          [SimpleAlertButton defaultButtonWithTitle:@"Option 3"],
                                                                          [SimpleAlertButton cancelButtonWithTitle:@"Cancel"]]
                                                          buttonHandler:nil];
              }]]],
           [STVSection sectionWithTitle:@"Destructive options" rows:
            @[[STVRow
               rowWithCellReuseIdentifier:AlertReuseIdentifier
               title:@"Show a confirmation alert"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
              [UIAlertController presentAlertFromViewController:self
                                                      withTitle:@"Title"
                                                        message:@"This is a message for you."
                                                        buttons:@[[SimpleAlertButton destructiveButtonWithTitle:@"Remove"],
                                                                  [SimpleAlertButton cancelButtonWithTitle:@"Cancel"]]
                                                  buttonHandler:nil];
            }],
              [STVRow
               rowWithCellReuseIdentifier:AlertReuseIdentifier
               title:@"Show a confirmation ActionSheet"
               subtitle:nil
               configureCellBlock:nil
               didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
                [UIAlertController presentActionSheetFromViewController:self
                                                             sourceView:cell
                                                              withTitle:nil
                                                                message:nil
                                                                buttons:@[[SimpleAlertButton destructiveButtonWithTitle:@"Remove"],
                                                                          [SimpleAlertButton cancelButtonWithTitle:@"Cancel"]]
                                                          buttonHandler:nil];
              }]]]];
}

@end
