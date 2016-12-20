//
//  AppDelegate.m
//  SimpleUIKit ExampleProject
//

#import "AppDelegate.h"

#import "ListViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ListViewController new]];
  [self.window makeKeyAndVisible];
  return YES;
}

@end
