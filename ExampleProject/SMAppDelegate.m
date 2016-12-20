//
//  SMAppDelegate.m
//  ExampleProject
//

#import "SMViewController.h"

#import "SMAppDelegate.h"

@implementation SMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.rootViewController = [[SMViewController alloc] init];
  [self.window makeKeyAndVisible];
  return YES;
}

@end
