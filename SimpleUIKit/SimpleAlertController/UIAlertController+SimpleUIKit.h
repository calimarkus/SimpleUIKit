//
//  UIAlertController+SimpleUIKit.h
//  SimpleUIKit ExampleProject
//

#import <UIKit/UIKit.h>

#import "SimpleAlertButton.h"

@interface UIAlertController (SimpleAPI)

+ (UIAlertController *)presentFromViewController:(UIViewController *)viewController
                                       withTitle:(NSString *)title
                                         message:(NSString *)message
                         confirmationButtonTitle:(NSString *)confirmationButtonTitle;

+ (UIAlertController *)presentFromViewController:(UIViewController *)viewController
                                  preferredStyle:(UIAlertControllerStyle)preferredStyle
                                       withTitle:(NSString *)title
                                         message:(NSString *)message
                                         buttons:(NSArray<SimpleAlertButton *> *)buttons
                                   buttonHandler:(void(^)(UIAlertAction *action))buttonHandler;

@end
