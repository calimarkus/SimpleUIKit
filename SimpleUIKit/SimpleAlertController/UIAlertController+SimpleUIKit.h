//
//  UIAlertController+SimpleUIKit.h
//  SimpleUIKit ExampleProject
//

#import <UIKit/UIKit.h>

#import "SimpleAlertButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (SimpleAPI)

+ (UIAlertController *)presentAlertFromViewController:(UIViewController *)viewController
                                            withTitle:(NSString * _Nullable)title
                                              message:(NSString * _Nullable)message
                              confirmationButtonTitle:(NSString *)confirmationButtonTitle;

+ (UIAlertController *)presentAlertFromViewController:(UIViewController *)viewController
                                            withTitle:(NSString * _Nullable)title
                                              message:(NSString * _Nullable)message
                                              buttons:(NSArray<SimpleAlertButton *> *)buttons
                                        buttonHandler:(void(^ _Nullable)(UIAlertAction *action))buttonHandler;

+ (UIAlertController *)presentActionSheetFromViewController:(UIViewController *)viewController
                                                 sourceView:(UIView * _Nullable)sourceView
                                                  withTitle:(NSString * _Nullable)title
                                                    message:(NSString * _Nullable)message
                                                    buttons:(NSArray<SimpleAlertButton *> *)buttons
                                              buttonHandler:(void(^ _Nullable)(UIAlertAction *action))buttonHandler;

@end

NS_ASSUME_NONNULL_END
