//
//  SimpleLocalNotification.m
//  Still Waitin
//

#import "SimpleLocalNotification.h"

#import <UserNotifications/UserNotifications.h>

@implementation SimpleLocalNotification

+ (void)isRegisteredForLocalNotificationsWithCompletion:(void(^)(BOOL userDidAllowAlerts, UNNotificationSettings *settings))completion {
  if (completion) {
    [[UNUserNotificationCenter currentNotificationCenter] getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings *settings) {
      dispatch_async(dispatch_get_main_queue(), ^{
        completion(settings.authorizationStatus == UNAuthorizationStatusAuthorized &&
                   settings.alertSetting == UNNotificationSettingEnabled,
                   settings);
      });
    }];
  }

}

+ (void)registerForLocalNotificationsIfNeededWithCompletion:(void(^)(BOOL granted, UNNotificationSettings *settings, NSError *error))completion {
  [self isRegisteredForLocalNotificationsWithCompletion:^(BOOL userDidAllowAlerts, UNNotificationSettings *settings) {
    if (!userDidAllowAlerts) {
      [[UNUserNotificationCenter currentNotificationCenter]
       requestAuthorizationWithOptions:UNAuthorizationOptionAlert
       completionHandler:^(BOOL granted, NSError *error) {
         if (completion) {
           dispatch_async(dispatch_get_main_queue(), ^{
             completion(granted, settings, error);
           });
         }
       }];
    } else {
      if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
          completion(YES, settings, nil);
        });
      }
    }
  }];

}

+ (void)scheduleLocalNotificationWithAlertBody:(NSString*)alertBody
                           timeIntervalFromNow:(NSTimeInterval)timeIntervalFromNow
                              uniqueIdentifier:(NSString *)uniqueIdentifier
                                    completion:(void (^)(NSError *))completion {
  NSParameterAssert(timeIntervalFromNow > 0);

  [self registerForLocalNotificationsIfNeededWithCompletion:^(BOOL granted, UNNotificationSettings *settings, NSError *registerError) {
    if (granted) {
      UNMutableNotificationContent *content = [UNMutableNotificationContent new];
      content.body = alertBody;

      UNNotificationRequest *request = [UNNotificationRequest
                                        requestWithIdentifier:uniqueIdentifier
                                        content:content
                                        trigger:[UNTimeIntervalNotificationTrigger
                                                 triggerWithTimeInterval:timeIntervalFromNow
                                                 repeats:NO]];

      [[UNUserNotificationCenter currentNotificationCenter]
       addNotificationRequest:request
       withCompletionHandler:^(NSError *addError) {
         if (completion) {
           dispatch_async(dispatch_get_main_queue(), ^{
             completion(addError);
           });
         }
      }];
    } else {
      if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
          completion(registerError);
        });
      }
    }
  }];
}

+ (void)cancelScheduledLocalNotificationsMatchingUniqueIdentifier:(NSString *)uniqueIdentifier {
  [[UNUserNotificationCenter currentNotificationCenter]
   removePendingNotificationRequestsWithIdentifiers:@[uniqueIdentifier]];
}

@end
