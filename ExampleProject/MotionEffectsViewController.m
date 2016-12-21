//
//  MotionEffectsViewController.m
//  SimpleUIKit ExampleProject
//

#import "UIView+SimpleMotionEffects.h"

#import "MotionEffectsViewController.h"
#import "UIView+position.h"

@implementation MotionEffectsViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  self.view.clipsToBounds = YES;

  // background image
  UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wallpaper"]];
  imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  imageView.frame = CGRectMake(0, 0, 900, 900);
  imageView.frameOrigin = CGPointMake(-250, -100);
  [imageView addMotionEffectWithMovement:CGPointMake(100, 100)];
  [self.view addSubview:imageView];

  UIView *dimmingView = [[UIView alloc] initWithFrame:self.view.bounds];
  dimmingView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  dimmingView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.25];
  [self.view addSubview:dimmingView];

  // labels
  const NSUInteger labelCount = 6;
  const NSUInteger labelHeight = 30;
  const NSUInteger labelMargin = 15;
  const CGFloat startY = floor((self.view.frameHeight - ((labelHeight + labelMargin) * labelCount)) / 2.0);
  const CGPoint baseStrenght = CGPointMake(self.view.frameWidth / (labelCount * 2),
                                           self.view.frameHeight / (labelCount * 4));
  for (NSInteger i=0; i<labelCount; i++) {
    const CGFloat yPosition = (startY + (labelHeight+labelMargin) * i);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, yPosition, self.view.frameWidth, labelHeight)];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"Label%02zd", i+1];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:17 + 2*i];
    [label addMotionEffectWithMovement:CGPointMake(baseStrenght.x * i,
                                                   baseStrenght.y * i)];
    [self.view addSubview:label];
  }

  // back button
  UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
  button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
  [button setTitle:@"Back" forState:UIControlStateNormal];
  button.tintColor = [UIColor whiteColor];
  button.titleLabel.font = [UIFont systemFontOfSize:18];
  [button sizeToFit];
  button.frameOrigin = CGPointMake(20, 40);
  [button addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

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

- (UIStatusBarStyle)preferredStatusBarStyle
{
  return UIStatusBarStyleLightContent;
}

#pragma mark - Actions

- (void)goBack:(id)sender
{
  [self.navigationController popViewControllerAnimated:YES];
}

@end
