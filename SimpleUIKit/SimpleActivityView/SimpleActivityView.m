//
//  SimpleActivityView.m
//  SimpleUIKit

#import "SimpleActivityView.h"

@implementation SimpleActivityView {
  UIActivityIndicatorView *_activityIndicator;
}

+ (void)presentActivityViewOnView:(UIView *)view
                       titleOrNil:(NSString *)titleOrNil
                    activityBlock:(SimpleActivityViewActivityBlock)activityBlock
{
  SimpleActivityView *simpleActivityView = [[SimpleActivityView alloc] initWithFrame:view.bounds];
  simpleActivityView->_label.text = titleOrNil;
  [view addSubview:simpleActivityView];

  // wait for runloop to display SimpleActivityView
  if (activityBlock) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      activityBlock(^(){
        [simpleActivityView removeFromSuperview];
      });
    });
  }
}

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self != nil) {
    self.backgroundColor = [UIColor colorWithWhite: 0 alpha: 0.8];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addUI];
  }
  return self;
}

- (void)addUI
{
  _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhite];
  _activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
  _activityIndicator.frame = CGRectMake(0, 0, 20, 20);
  _activityIndicator.center = CGPointMake(0, self.frame.size.height/2.0);
  [_activityIndicator startAnimating];
  [self addSubview:_activityIndicator];

  _label = [[UILabel alloc] init];
  _label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
  _label.center = CGPointMake(0, self.frame.size.height/2.0);
  _label.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
  _label.backgroundColor = [UIColor clearColor];
  _label.textAlignment = NSTextAlignmentLeft;
  _label.textColor = [UIColor whiteColor];
  _label.shadowColor = [UIColor blackColor];
  _label.shadowOffset = CGSizeMake(-1, -1);
  [self addSubview: _label];
}

- (void)layoutSubviews;
{
  [super layoutSubviews];

  // Center String and ActivityView
  CGSize size = [_label.text sizeWithAttributes:@{NSFontAttributeName:_label.font}];
  int totalwidth = _activityIndicator.frame.size.width + 15 + size.width;

  CGRect newframe = _activityIndicator.frame;
  newframe.origin.x = (self.frame.size.width-totalwidth)/2;
  _activityIndicator.frame = newframe;

  newframe = _label.frame;
  newframe.size.width = size.width;
  newframe.size.height = size.height;
  newframe.origin.x = _activityIndicator.frame.origin.x + _activityIndicator.frame.size.width + 15;
  newframe.origin.y -= newframe.size.height/2 + 1;
  _label.frame = newframe;
}

@end

