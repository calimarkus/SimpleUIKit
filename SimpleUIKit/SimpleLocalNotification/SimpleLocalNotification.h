//
//  SimpleLocalNotification.h
//  Still Waitin
//

#import <UIKit/UIKit.h>

@class SimpleLocalNotification;
@class UNNotificationSettings;

@protocol SimpleLocalNotificationDelegate <NSObject>
- (void)simpleLocalNotificationAccessWasDenied:(SimpleLocalNotification *)simpleLocalNotification;
@end

@interface SimpleLocalNotification : NSObject

@property (nonatomic, weak) id<SimpleLocalNotificationDelegate> delegate;

+ (instancetype)sharedInstance;

- (void)isRegisteredForLocalNotificationsWithCompletion:(void(^)(BOOL userDidAllowAlerts, UNNotificationSettings *settings))completion;
- (void)registerForLocalNotificationsIfNeededWithCompletion:(void(^)(BOOL granted, NSError *error))completion;

- (void)scheduleLocalNotificationWithAlertBody:(NSString*)alertBody
                           timeIntervalFromNow:(NSTimeInterval)timeIntervalFromNow
                              uniqueIdentifier:(NSString *)uniqueIdentifier
                                    completion:(void(^)(NSError *error))completion;

- (void)cancelScheduledLocalNotificationsMatchingUniqueIdentifier:(NSString *)uniqueIdentifier;

@end
