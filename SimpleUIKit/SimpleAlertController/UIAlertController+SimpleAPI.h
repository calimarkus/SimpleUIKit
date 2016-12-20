//
//  UIAlertController+SimpleAPI.h
//  SimpleUIKit

#import <Foundation/Foundation.h>

@class UIAlertControllerSimpleAPIButton;

extern UIAlertControllerSimpleAPIButton *SAButtonWithTitle(NSString *title);
extern UIAlertControllerSimpleAPIButton *SAButtonWithTitleAndStyle(NSString *title, UIAlertActionStyle style);

@interface UIAlertController (SimpleAPI)

+ (void)presentFromViewController:(UIViewController *)viewController
                        withTitle:(NSString *)title
                          message:(NSString *)message
          confirmationButtonTitle:(NSString *)confirmationButtonTitle;

+ (void)presentFromViewController:(UIViewController *)viewController
                   preferredStyle:(UIAlertControllerStyle)preferredStyle
                        withTitle:(NSString *)title
                          message:(NSString *)message
                          buttons:(NSArray<UIAlertControllerSimpleAPIButton *> *)buttons
                    buttonHandler:(void(^)(UIAlertAction *action))buttonHandler;

@end
