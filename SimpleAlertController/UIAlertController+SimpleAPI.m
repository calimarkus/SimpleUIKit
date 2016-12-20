//
//  UIAlertController+SimpleAPI.m
//  SimpleUIKit
//

#import "UIAlertController+SimpleAPI.h"

@interface UIAlertControllerSimpleAPIButton : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) UIAlertActionStyle style;
@end
@implementation UIAlertControllerSimpleAPIButton
@end

UIAlertControllerSimpleAPIButton *SAButtonWithTitle(NSString *title)
{
  return SAButtonWithTitleAndStyle(title, UIAlertActionStyleDefault);
}

UIAlertControllerSimpleAPIButton *SAButtonWithTitleAndStyle(NSString *title, UIAlertActionStyle style)
{
  UIAlertControllerSimpleAPIButton *simpleButton = [[UIAlertControllerSimpleAPIButton alloc] init];
  simpleButton.title = title;
  simpleButton.style = style;
  return simpleButton;
}

@implementation UIAlertController (SimpleAPI)

+ (void)presentFromViewController:(UIViewController *)viewController
                        withTitle:(NSString *)title
                          message:(NSString *)message
          confirmationButtonTitle:(NSString *)confirmationButtonTitle
{
  [self presentFromViewController:viewController
                   preferredStyle:UIAlertControllerStyleAlert
                        withTitle:title
                          message:message
                          buttons:@[SAButtonWithTitle(confirmationButtonTitle)]
                    buttonHandler:nil];
}

+ (void)presentFromViewController:(UIViewController *)viewController
                   preferredStyle:(UIAlertControllerStyle)preferredStyle
                        withTitle:(NSString *)title
                          message:(NSString *)message
                          buttons:(NSArray<UIAlertControllerSimpleAPIButton *> *)buttons
                    buttonHandler:(void (^)(UIAlertAction *))buttonHandler
{
  UIAlertController *alertController = [UIAlertController
                                        alertControllerWithTitle:title
                                        message:message
                                        preferredStyle:preferredStyle];

  for (UIAlertControllerSimpleAPIButton *simpleButton in buttons) {
    [alertController addAction:[UIAlertAction
                                actionWithTitle:simpleButton.title
                                style:simpleButton.style
                                handler:buttonHandler]];
  }

  [viewController presentViewController:alertController animated:YES completion:nil];
}

@end
