//
//  SimpleTableView.h
//  SimpleUIKit
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SimpleTableViewScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset;
@end

@class STVRow;

typedef void(^SimpleTableViewRowBlock)(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath);
typedef CGFloat(^SimpleTableViewRowHeightProvider)(STVRow *STVRow, UITableView *tableView, NSIndexPath *indexPath);

@interface STVSection : NSObject
@property (nonatomic, copy, readonly, nullable) NSString *title;
@property (nonatomic, copy, readonly, nullable) NSString *sectionIndexTitle;
@property (nonatomic, copy, readonly, nullable) NSArray<STVRow *> *rows;
+ (instancetype)sectionWithTitle:(nullable NSString *)title
               sectionIndexTitle:(nullable NSString *)sectionIndexTitle
                            rows:(nullable NSArray<STVRow *> *)rows;
@end

@interface STVRow : NSObject
@property (nonatomic, copy, readonly) NSString *cellReuseIdentifier;
@property (nonatomic, copy, readonly, nullable) NSString *title;
@property (nonatomic, copy, readonly, nullable) NSString *subtitle;
@property (nonatomic, copy, readonly, nullable) SimpleTableViewRowBlock configureCellBlock;
@property (nonatomic, copy, readonly, nullable) SimpleTableViewRowBlock didSelectBlock;
+ (instancetype)rowWithCellReuseIdentifier:(NSString *)cellReuseIdentifier
                                     title:(nullable NSString *)title
                                  subtitle:(nullable NSString *)subtitle
                        configureCellBlock:(nullable SimpleTableViewRowBlock)configureCellBlock
                            didSelectBlock:(nullable SimpleTableViewRowBlock)didSelectBlock;
@end

@interface SimpleTableView : UIView
@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic, copy, nullable) NSArray<STVSection *> *sectionModels;
@property (nonatomic, assign) BOOL shouldDeselectRowsAutomatically;
@property (nonatomic, copy, nullable) SimpleTableViewRowHeightProvider rowHeightProvider;
@property (nonatomic, weak, nullable) id<SimpleTableViewScrollViewDelegate> scrollDelegate;
- (instancetype)initWithTableViewStyle:(UITableViewStyle)tableViewStyle;
@end

NS_ASSUME_NONNULL_END
