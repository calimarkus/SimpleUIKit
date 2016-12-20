//
//  SimpleActivityView.h
//  SimpleUIKit

@interface SimpleActivityView : UIView

@property (nonatomic, readonly) UILabel *label;

+ (void)presentSimpleActivityViewOnView:(UIView *)view
                             titleOrNil:(NSString *)titleOrNil
                   untilBlockIsExecuted:(void(^)(void))block;

@end
