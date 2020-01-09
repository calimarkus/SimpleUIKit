//
//  UIAlertController+SimpleUIKit.m
//  SimpleUIKit ExampleProject
//
//

#import "UIAlertController+SimpleUIKit.h"

@implementation UIAlertController (SimpleAPI)

+ (UIAlertController *)presentAlertFromViewController:(UIViewController *)viewController
                                            withTitle:(NSString * _Nullable)title
                                              message:(NSString * _Nullable)message
                              confirmationButtonTitle:(NSString *)confirmationButtonTitle {
  return [self _presentFromViewController:viewController
                           preferredStyle:UIAlertControllerStyleAlert
                               sourceView:nil
                                withTitle:title
                                  message:message
                                  buttons:@[[SimpleAlertButton defaultButtonWithTitle:confirmationButtonTitle]]
                            buttonHandler:nil];
}

+ (UIAlertController *)presentAlertFromViewController:(UIViewController *)viewController
                                            withTitle:(NSString * _Nullable)title
                                              message:(NSString * _Nullable)message
                                              buttons:(NSArray<SimpleAlertButton *> *)buttons
                                        buttonHandler:(void (^ _Nullable)(UIAlertAction *))buttonHandler {
  return [self _presentFromViewController:viewController
                           preferredStyle:UIAlertControllerStyleAlert
                               sourceView:nil
                                withTitle:title
                                  message:message
                                  buttons:buttons
                            buttonHandler:buttonHandler];
}

+ (UIAlertController *)presentActionSheetFromViewController:(UIViewController *)viewController
                                                 sourceView:(UIView * _Nullable)sourceView
                                                  withTitle:(NSString *)title
                                                    message:(NSString *)message
                                                    buttons:(NSArray<SimpleAlertButton *> *)buttons
                                              buttonHandler:(void(^ _Nullable)(UIAlertAction *action))buttonHandler {
  return [self _presentFromViewController:viewController
                           preferredStyle:UIAlertControllerStyleActionSheet
                               sourceView:sourceView
                                withTitle:title
                                  message:message
                                  buttons:buttons
                            buttonHandler:buttonHandler];
}

+ (UIAlertController *)_presentFromViewController:(UIViewController *)viewController
                                   preferredStyle:(UIAlertControllerStyle)preferredStyle
                                       sourceView:(UIView * _Nullable)sourceView
                                        withTitle:(NSString *)title
                                          message:(NSString *)message
                                          buttons:(NSArray<SimpleAlertButton *> *)buttons
                                    buttonHandler:(void (^ _Nullable)(UIAlertAction *))buttonHandler
{
  UIAlertController *alertController = [UIAlertController
                                        alertControllerWithTitle:title
                                        message:message
                                        preferredStyle:preferredStyle];

  for (SimpleAlertButton *simpleButton in buttons) {
    [alertController addAction:ActionForButton(simpleButton, buttonHandler)];
  }

  // setup popover context for iPad presentations
  if (sourceView != nil) {
    UIPopoverPresentationController *popoverPresentationController = [alertController popoverPresentationController];
    popoverPresentationController.sourceView = sourceView;
    popoverPresentationController.sourceRect = sourceView.bounds;
  }

  [viewController presentViewController:alertController animated:YES completion:nil];
  return alertController;
}

static UIAlertAction *ActionForButton(SimpleAlertButton *button, void (^buttonHandler)(UIAlertAction *))
{
  __block UIAlertAction *action;
  [button matchDefaultButton:^(NSString *title) {
    action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:buttonHandler];
  } cancelButton:^(NSString *title) {
    action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleCancel handler:buttonHandler];
  } destructiveButton:^(NSString *title) {
    action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDestructive handler:buttonHandler];
  }];
  return action;
}

@end
