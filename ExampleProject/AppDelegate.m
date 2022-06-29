//
//  AppDelegate.m
//  SimpleUIKit ExampleProject
//

#import "AppDelegate.h"

#import "ListViewController.h"
#import "UIAlertController+SimpleUIKit.h"
#import <UserNotifications/UserNotifications.h>

@interface UserNotificationDelegate : NSObject <UNUserNotificationCenterDelegate>
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController;
@end

@implementation AppDelegate  {
  UserNotificationDelegate *_userNotificationDelegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ListViewController new]];
  [self.window makeKeyAndVisible];

  _userNotificationDelegate = [[UserNotificationDelegate alloc] initWithRootViewController:self.window.rootViewController];
  [[UNUserNotificationCenter currentNotificationCenter] setDelegate:_userNotificationDelegate];

  return YES;
}

@end

@implementation UserNotificationDelegate {
  UIViewController *_rootViewController;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
  self = [super init];
  if (self) {
    _rootViewController = rootViewController;
  }
  return self;
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
  completionHandler(UNNotificationPresentationOptionAlert);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler
{
  [UIAlertController presentAlertFromViewController:_rootViewController
                                          withTitle:@"Received Local Notifcation"
                                            message:nil
                            confirmationButtonTitle:@"OK"];
  completionHandler();
}

@end
