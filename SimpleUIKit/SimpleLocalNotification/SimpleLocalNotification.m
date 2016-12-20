//
//  SimpleLocalNotification.m
//  Still Waitin
//

#import "SimpleLocalNotification.h"

#import <UserNotifications/UserNotifications.h>

@implementation SimpleLocalNotification

+ (instancetype)sharedInstance
{
  static id _sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedInstance = [[self alloc] init];
  });
  return _sharedInstance;
}

- (void)_didUserAllowLocalNotificationsWithCompletion:(void(^)(BOOL userDidAllowLocalNotifications))completion
{
  if (completion) {
    [[UNUserNotificationCenter currentNotificationCenter] getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings *settings) {
      completion(settings.authorizationStatus == UNAuthorizationStatusAuthorized &&
                 settings.alertSetting == UNNotificationSettingEnabled);
    }];
  }
}

- (void)registerForLocalNotificationsIfNeededWithCompletion:(void(^)(BOOL granted))completion
{
  [self _didUserAllowLocalNotificationsWithCompletion:^(BOOL userDidAllowLocalNotifications) {
    if (!userDidAllowLocalNotifications) {
      [[UNUserNotificationCenter currentNotificationCenter]
       requestAuthorizationWithOptions:UNAuthorizationOptionAlert
       completionHandler:^(BOOL granted, NSError * _Nullable error) {
         NSLog(@"Local Notification request granted: %@, error: %@", @(granted), error);
         if (completion) {
           dispatch_async(dispatch_get_main_queue(), ^{
             completion(granted);
           });
         }
         if (!granted) {
           [self.delegate simpleLocalNotificationAccessWasDenied:self];
         }
       }];
    } else {
      if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
          completion(YES);
        });
      }
    }
  }];
}

- (void)scheduleLocalNotificationWithAlertBody:(NSString*)alertBody
                                 timerInterval:(NSTimeInterval)timeInterval
                              uniqueIdentifier:(NSString *)uniqueIdentifier
{
  if (timeInterval < 0) {
    return;
  }

  [self registerForLocalNotificationsIfNeededWithCompletion:^(BOOL granted) {
    if (granted) {
      UNMutableNotificationContent *content = [UNMutableNotificationContent new];
      content.body = alertBody;

      UNNotificationRequest *request = [UNNotificationRequest
                                        requestWithIdentifier:uniqueIdentifier
                                        content:content
                                        trigger:[UNTimeIntervalNotificationTrigger
                                                 triggerWithTimeInterval:timeInterval
                                                 repeats:NO]];

      [[UNUserNotificationCenter currentNotificationCenter]
       addNotificationRequest:request
       withCompletionHandler:^(NSError * _Nullable error) {
         if (error) {
           NSLog(@"Error scheduling local notification: %@", error);
         } else {
           NSLog(@"Local notification scheduled: '%@'", alertBody);
         }
       }];
    }
  }];
}

- (void)cancelScheduledLocalNotificationsMatchingUniqueIdentifier:(NSString *)uniqueIdentifier
{
  [[UNUserNotificationCenter currentNotificationCenter]
   removePendingNotificationRequestsWithIdentifiers:@[uniqueIdentifier]];
}

@end
