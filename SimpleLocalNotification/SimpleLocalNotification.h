//
//  SimpleLocalNotification.h
//  Still Waitin
//

#import <UIKit/UIKit.h>

@class SimpleLocalNotification;

@protocol SimpleLocalNotificationDelegate <NSObject>
- (void)simpleLocalNotificationAccessWasDenied:(SimpleLocalNotification *)simpleLocalNotification;
@end

@interface SimpleLocalNotification : NSObject

@property (nonatomic, weak) id<SimpleLocalNotificationDelegate> delegate;

+ (instancetype)sharedInstance;

- (void)registerForLocalNotificationsIfNeededWithCompletion:(void(^)(BOOL granted))completion;

- (void)scheduleLocalNotificationWithAlertBody:(NSString*)alertBody
                                 timerInterval:(NSTimeInterval)timeInterval
                              uniqueIdentifier:(NSString *)uniqueIdentifier;

- (void)cancelScheduledLocalNotificationsMatchingUniqueIdentifier:(NSString *)uniqueIdentifier;

@end
