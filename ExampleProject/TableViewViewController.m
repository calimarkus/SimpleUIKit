//
//  TableViewViewController.m
//  SimpleUIKit ExampleProject
//

#import "TableViewViewController.h"

#import "SimpleTableView.h"

NSString *const TVVCListReuseIdentifier = @"ListReuseIdentifier";

@implementation TableViewViewController {
  SimpleTableView *_simpleTableView;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    self.title = @"SimpleTableView";
  }
  return self;
}

- (void)loadView {
  SimpleTableView *simpleTableView = [[SimpleTableView alloc] initWithTableViewStyle:UITableViewStyleGrouped];
  [simpleTableView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TVVCListReuseIdentifier];
  simpleTableView.sectionModels = [self _createSections];
  _simpleTableView = simpleTableView;

  self.view = simpleTableView.tableView;
}

- (NSArray<STVSection *> *)_createSections {
  NSMutableArray<STVSection *> *sections = [NSMutableArray array];
  NSMutableArray<STVRow *> *rows = [NSMutableArray array];

  for (char i=65; i<=90; i++) {
    NSString *sectionLetter = [NSString stringWithFormat:@"%c", i];
    [rows removeAllObjects];
    for (NSInteger j=0; j<7; j++) {
      [rows addObject:[STVRow
                       rowWithCellReuseIdentifier:TVVCListReuseIdentifier
                       title:[NSString stringWithFormat:@"%@-%@", sectionLetter, @(j)]
                       subtitle:nil
                       configureCellBlock:nil
                       didSelectBlock:nil]];
    }
    [sections addObject:[STVSection sectionWithTitle:[NSString stringWithFormat:@"Some %@'s", sectionLetter]
                                   sectionIndexTitle:sectionLetter
                                                rows:rows]];
  }

  return sections;
}

@end
