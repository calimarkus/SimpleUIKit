//
//  SimpleActivityView.h
//  SimpleUIKit

typedef void(^SimpleActivityViewDismissBlock)(void);
typedef void(^SimpleActivityViewActivityBlock)(__nonnull SimpleActivityViewDismissBlock dismissBlock);

@interface SimpleActivityView : UIView

@property (nonatomic, readonly) UILabel *_Nonnull label;

+ (void)presentActivityViewOnView:(UIView *_Nonnull)view
                       titleOrNil:(NSString *_Nullable)titleOrNil
                    activityBlock:(SimpleActivityViewActivityBlock _Nonnull)activityBlock;

@end
