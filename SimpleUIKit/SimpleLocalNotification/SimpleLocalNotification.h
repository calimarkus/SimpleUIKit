//
//  SimpleLocalNotification.h
//  Still Waitin
//

#import <UIKit/UIKit.h>

@class UNNotificationSettings;

@interface SimpleLocalNotification : NSObject

+ (void)isRegisteredForLocalNotificationsWithCompletion:(void(^)(BOOL userDidAllowAlerts, UNNotificationSettings *settings))completion;
+ (void)registerForLocalNotificationsIfNeededWithCompletion:(void(^)(BOOL granted, UNNotificationSettings *settings, NSError *error))completion;

+ (void)scheduleLocalNotificationWithAlertBody:(NSString*)alertBody
                           timeIntervalFromNow:(NSTimeInterval)timeIntervalFromNow
                              uniqueIdentifier:(NSString *)uniqueIdentifier
                                    completion:(void(^)(NSError *error))completion;

+ (void)cancelScheduledLocalNotificationsMatchingUniqueIdentifier:(NSString *)uniqueIdentifier;

@end
