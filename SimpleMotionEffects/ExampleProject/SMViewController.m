//
//  SMViewController.m
//  ExampleProject
//

#import "UIView+SimpleMotionEffects.h"

#import "SMViewController.h"

@interface SMViewController ()

@end

@implementation SMViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  // labels
  CGFloat strenghtX = self.view.frame.size.width / (self.labels.count * 2);
  CGFloat strenghtY = self.view.frame.size.height / (self.labels.count * 4);
  [self.labels enumerateObjectsUsingBlock:^(UILabel *label, NSUInteger idx, BOOL *stop) {
    [label addMotionEffectWithMovement:CGPointMake(strenghtX*idx, strenghtY*idx)];
  }];

  // image
  [self.imageView addMotionEffectWithMovement:CGPointMake(150, 150)];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
  return UIStatusBarStyleLightContent;
}

@end
