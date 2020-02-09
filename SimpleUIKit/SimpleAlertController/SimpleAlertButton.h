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

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

- (void)matchDefaultButton:(NS_NOESCAPE __unsafe_unretained SimpleAlertButtonDefaultButtonMatchHandler)defaultButtonMatchHandler cancelButton:(NS_NOESCAPE __unsafe_unretained SimpleAlertButtonCancelButtonMatchHandler)cancelButtonMatchHandler destructiveButton:(NS_NOESCAPE __unsafe_unretained SimpleAlertButtonDestructiveButtonMatchHandler)destructiveButtonMatchHandler NS_SWIFT_NAME(match(defaultButton:cancelButton:destructiveButton:));

@end
