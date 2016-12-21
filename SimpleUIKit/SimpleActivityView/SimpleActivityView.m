//
//  SimpleActivityView.m
//  SimpleUIKit

#import "SimpleActivityView.h"

@implementation SimpleActivityView

+ (instancetype)activityViewWithTitle:(NSString *_Nullable)titleOrNil
{
  SimpleActivityView *simpleActivityView = [SimpleActivityView new];
  [simpleActivityView setTitle:titleOrNil];
  return simpleActivityView;
}

- (void)presentActivityViewOnView:(UIView *)view
                    activityBlock:(SimpleActivityViewActivityBlock)activityBlock
{
  NSParameterAssert(activityBlock);

  self.frame = view.bounds;
  [view addSubview:self];

  // wait for runloop to display the added view
  __weak typeof(self) weakSelf = self;
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0), dispatch_get_main_queue(), ^{
    activityBlock(weakSelf, ^(){
      [weakSelf removeFromSuperview];
    });
  });
}

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self != nil) {
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.85];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addUI];
  }
  return self;
}

- (void)addUI
{
  _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
  _activityIndicatorView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
  [_activityIndicatorView startAnimating];
  [self addSubview:_activityIndicatorView];

  _label = [[UILabel alloc] init];
  _label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
  _label.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
  _label.backgroundColor = [UIColor clearColor];
  _label.textAlignment = NSTextAlignmentLeft;
  _label.textColor = [UIColor whiteColor];
  [self addSubview: _label];
}

- (NSString *)title
{
  return _label.text;
}

- (void)setTitle:(NSString *_Nullable)title
{
  _label.text = title;
  [self setNeedsLayout];
}

- (UIActivityIndicatorViewStyle)activityIndicatorViewStyle
{
  return _activityIndicatorView.activityIndicatorViewStyle;
}

- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle
{
  _activityIndicatorView.activityIndicatorViewStyle = activityIndicatorViewStyle;
  [self setNeedsLayout];
}

- (void)layoutSubviews;
{
  [super layoutSubviews];

  [_label sizeToFit];
  [_activityIndicatorView sizeToFit];

  // center vertically
  _label.center = CGPointMake(0, self.bounds.size.height/2.0);
  _activityIndicatorView.center = CGPointMake(0, self.bounds.size.height/2.0);

  // Center String and ActivityView
  const CGFloat margin = 15;
  const CGFloat totalWidth = _activityIndicatorView.frame.size.width + margin + _label.frame.size.width;

  CGRect newFrame = _activityIndicatorView.frame;
  newFrame.origin.x = (self.frame.size.width-totalWidth)/2;
  _activityIndicatorView.frame = newFrame;

  newFrame = _label.frame;
  newFrame.origin.x = _activityIndicatorView.frame.origin.x + _activityIndicatorView.frame.size.width + margin;
  _label.frame = newFrame;
}

@end

