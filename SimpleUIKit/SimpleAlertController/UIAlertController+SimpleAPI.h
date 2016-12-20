//
//  UIAlertController+SimpleAPI.h
//  StillWaitin
//

#import <UIKit/UIKit.h>

#import "SimpleAlertButton.h"

@interface UIAlertController (SimpleAPI)

+ (void)presentFromViewController:(UIViewController *)viewController
                        withTitle:(NSString *)title
                          message:(NSString *)message
          confirmationButtonTitle:(NSString *)confirmationButtonTitle;

+ (void)presentFromViewController:(UIViewController *)viewController
                   preferredStyle:(UIAlertControllerStyle)preferredStyle
                        withTitle:(NSString *)title
                          message:(NSString *)message
                          buttons:(NSArray<SimpleAlertButton *> *)buttons
                    buttonHandler:(void(^)(UIAlertAction *action))buttonHandler;

@end
