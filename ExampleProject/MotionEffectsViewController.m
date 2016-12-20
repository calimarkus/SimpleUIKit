//
//  MotionEffectsViewController.m
//  SimpleUIKit ExampleProject
//

#import "UIView+SimpleMotionEffects.h"

#import "MotionEffectsViewController.h"

@implementation MotionEffectsViewController

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (IBAction)goBack:(id)sender
{
  [self.navigationController popViewControllerAnimated:YES];
}

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
