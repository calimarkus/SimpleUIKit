//
//  SimpleActivityView.h
//  SimpleUIKit

@class SimpleActivityView;

typedef void(^SimpleActivityViewDismissBlock)(void);
typedef void(^SimpleActivityViewActivityBlock)(SimpleActivityView *_Nonnull simpleActivityView, SimpleActivityViewDismissBlock _Nonnull dismissBlock);

@interface SimpleActivityView : UIView

@property (nonatomic, readonly) UILabel *_Nonnull label;
@property (nonatomic, readonly) UIActivityIndicatorView *_Nonnull activityIndicatorView;

+ (instancetype _Nonnull)activityViewWithTitle:(NSString *_Nullable)titleOrNil;

- (void)presentActivityViewOnView:(UIView *_Nonnull)view
                    activityBlock:(SimpleActivityViewActivityBlock _Nonnull)activityBlock;

@end
