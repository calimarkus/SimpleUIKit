//
//  AppDelegate.m
//  SimpleUIKit ExampleProject
//

#import "AppDelegate.h"

#import "ListViewController.h"
#import "UIAlertController+SimpleUIKit.h"
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate () <UNUserNotificationCenterDelegate>
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [[UNUserNotificationCenter currentNotificationCenter] setDelegate:self];

  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ListViewController new]];
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
  completionHandler(UNNotificationPresentationOptionAlert);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler
{
  [UIAlertController presentFromViewController:self.window.rootViewController
                                     withTitle:@"Received Local Notifcation"
                                       message:nil
                       confirmationButtonTitle:@"OK"];
  completionHandler();
}

@end
