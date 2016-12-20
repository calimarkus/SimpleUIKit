//
//  SimpleTableView.h
//  SimpleUIKit
//

#import <UIKit/UIKit.h>

@class STVRow;

typedef void(^SimpleTableViewRowBlock)(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath);
typedef CGFloat(^SimpleTableViewRowHeightProvider)(STVRow *STVRow, UITableView *tableView, NSIndexPath *indexPath);

@interface STVSection : NSObject
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSArray<STVRow *> *rows;
+ (instancetype)sectionWithTitle:(NSString *)title
                            rows:(NSArray<STVRow *> *)rows;
@end

@interface STVRow : NSObject
@property (nonatomic, copy, readonly) NSString *cellReuseIdentifier;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *subtitle;
@property (nonatomic, copy, readonly) SimpleTableViewRowBlock configureCellBlock;
@property (nonatomic, copy, readonly) SimpleTableViewRowBlock didSelectBlock;
+ (instancetype)rowWithCellReuseIdentifier:(NSString *)cellReuseIdentifier
                                     title:(NSString *)title
                                  subtitle:(NSString *)subtitle
                        configureCellBlock:(SimpleTableViewRowBlock)configureCellBlock
                            didSelectBlock:(SimpleTableViewRowBlock)didSelectBlock;
@end

@interface SimpleTableView : UIView
@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic, copy) NSArray<STVSection *> *sectionModels;
@property (nonatomic, assign) BOOL shouldDeselectRowsAutomatically;
@property (nonatomic, copy) SimpleTableViewRowHeightProvider rowHeightProvider;
- (instancetype)initWithTableViewStyle:(UITableViewStyle)tableViewStyle;
@end
