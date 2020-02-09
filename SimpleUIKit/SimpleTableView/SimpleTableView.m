//
//  SimpleTableView.m
//
//

#import "SimpleTableView.h"

@implementation STVSection
+ (instancetype)sectionWithTitle:(nullable NSString *)title
               sectionIndexTitle:(nullable NSString *)sectionIndexTitle
                            rows:(nullable NSArray<STVRow *> *)rows
{
  STVSection *section = [STVSection new];
  section->_title = [title copy];
  section->_sectionIndexTitle = [sectionIndexTitle copy];
  section->_rows = [rows copy];
  return section;
}
@end

@implementation STVRow
+ (instancetype)rowWithCellReuseIdentifier:(NSString *)cellReuseIdentifier
                                     title:(NSString *)title
                                  subtitle:(NSString *)subtitle
                        configureCellBlock:(SimpleTableViewRowBlock)configureCellBlock
                            didSelectBlock:(SimpleTableViewRowBlock)didSelectBlock
{
  STVRow *row = [STVRow new];
  row->_cellReuseIdentifier = [cellReuseIdentifier copy];
  row->_title = [title copy];
  row->_subtitle = [subtitle copy];
  row->_configureCellBlock = [configureCellBlock copy];
  row->_didSelectBlock = [didSelectBlock copy];
  return row;
}
@end

@interface SimpleTableView () <UITableViewDelegate, UITableViewDataSource>
@end

@implementation SimpleTableView {
  NSArray<NSString *> *_sortedSectionTitles;
  NSDictionary<NSString *, NSNumber *> *_sectionTitleToIndexMap;
}

- (instancetype)initWithTableViewStyle:(UITableViewStyle)tableViewStyle
{
  self = [super initWithFrame:CGRectMake(0, 0, 320, 480)];
  if (self) {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:tableViewStyle];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.dataSource = self;
    tableView.delegate = self;
    _tableView = tableView;
    _shouldDeselectRowsAutomatically = YES;
    [self addSubview:_tableView];
  }
  return self;
}

- (void)setSectionModels:(NSArray<STVSection *> *)sectionModels
{
  _sectionModels = sectionModels;

  // setup index map
  NSMutableArray<NSString *> *sortedSectionTitles = [NSMutableArray array];
  NSMutableDictionary<NSString *, NSNumber *> *sectionTitleToIndexMap = [NSMutableDictionary dictionary];
  [sectionModels enumerateObjectsUsingBlock:^(STVSection *section, NSUInteger idx, BOOL *stop) {
    if (section.sectionIndexTitle.length > 0) {
      [sortedSectionTitles addObject:section.sectionIndexTitle];
      sectionTitleToIndexMap[section.sectionIndexTitle] = @(idx);
    }
  }];
  _sortedSectionTitles = sortedSectionTitles;
  _sectionTitleToIndexMap = [sectionTitleToIndexMap copy];

  [_tableView reloadData];
}

#pragma mark UITableViewDelegate / UITableViewDatasource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
{
  return tableView.rowHeight;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return _sectionModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return _sectionModels[section].rows.count;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
  return _sectionModels[section].title;
}

#pragma mark - Cell configuration

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
  STVRow *const row = _sectionModels[indexPath.section].rows[indexPath.row];
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.cellReuseIdentifier];
  cell.textLabel.text = row.title;
  cell.detailTextLabel.text = row.subtitle;
  if (row.configureCellBlock) {
    row.configureCellBlock(row, cell, tableView, indexPath);
  }
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (_rowHeightProvider) {
    return _rowHeightProvider(_sectionModels[indexPath.section].rows[indexPath.row], tableView, indexPath);
  } else {
    return tableView.rowHeight;
  }
}

#pragma mark - Selection

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  STVRow *const row = _sectionModels[indexPath.section].rows[indexPath.row];
  if (row.didSelectBlock) {
    row.didSelectBlock(row, [tableView cellForRowAtIndexPath:indexPath], tableView, indexPath);
  }
  if (_shouldDeselectRowsAutomatically) {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
  }
}

#pragma mark - Section Indexes

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
  return _sortedSectionTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
  return _sectionTitleToIndexMap[title].integerValue;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  [_scrollDelegate scrollViewDidScroll:scrollView];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
  [_scrollDelegate scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
}

@end
