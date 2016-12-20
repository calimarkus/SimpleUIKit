/**
 * This file is generated using the remodel generation script.
 * The name of the input file is SimpleAlertButton.adtValue
 */

#import <Foundation/Foundation.h>

typedef void (^SimpleAlertButtonDefaultButtonMatchHandler)(NSString *title);
typedef void (^SimpleAlertButtonCancelButtonMatchHandler)(NSString *title);
typedef void (^SimpleAlertButtonDestructiveButtonMatchHandler)(NSString *title);

@interface SimpleAlertButton : NSObject <NSCopying>

+ (instancetype)cancelButtonWithTitle:(NSString *)title;

+ (instancetype)defaultButtonWithTitle:(NSString *)title;

+ (instancetype)destructiveButtonWithTitle:(NSString *)title;

- (void)matchDefaultButton:(SimpleAlertButtonDefaultButtonMatchHandler)defaultButtonMatchHandler cancelButton:(SimpleAlertButtonCancelButtonMatchHandler)cancelButtonMatchHandler destructiveButton:(SimpleAlertButtonDestructiveButtonMatchHandler)destructiveButtonMatchHandler;

@end

