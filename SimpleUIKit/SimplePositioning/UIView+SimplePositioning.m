//
//  UIView+SimplePositioning.m
//

#import "UIView+SimplePositioning.h"

@implementation UIView (SimplePositioning)

- (CGPoint)frameOrigin {
  return self.frame.origin;
}

- (void)setFrameOrigin:(CGPoint)newOrigin {
  self.frame = CGRectMake(newOrigin.x, newOrigin.y, self.frame.size.width, self.frame.size.height);
}

- (CGSize)frameSize {
  return self.frame.size;
}

- (void)setFrameSize:(CGSize)newSize {
  self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,
                          newSize.width, newSize.height);
}

- (CGFloat)frameX {
  return self.frame.origin.x;
}

- (void)setFrameX:(CGFloat)newX {
  self.frame = CGRectMake(newX, self.frame.origin.y,
                          self.frame.size.width, self.frame.size.height);
}

- (CGFloat)frameY {
  return self.frame.origin.y;
}

- (void)setFrameY:(CGFloat)newY {
  self.frame = CGRectMake(self.frame.origin.x, newY,
                          self.frame.size.width, self.frame.size.height);
}

- (CGFloat)frameRight {
  return self.frame.origin.x + self.frame.size.width;
}

- (void)setFrameRight:(CGFloat)newRight {
  self.frame = CGRectMake(newRight - self.frame.size.width, self.frame.origin.y,
                          self.frame.size.width, self.frame.size.height);
}

- (CGFloat)frameBottom {
  return self.frame.origin.y + self.frame.size.height;
}

- (void)setFrameBottom:(CGFloat)newBottom {
  self.frame = CGRectMake(self.frame.origin.x, newBottom - self.frame.size.height,
                          self.frame.size.width, self.frame.size.height);
}

- (CGFloat)frameWidth {
  return self.frame.size.width;
}

- (void)setFrameWidth:(CGFloat)newWidth {
  self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,
                          newWidth, self.frame.size.height);
}

- (CGFloat)frameHeight {
  return self.frame.size.height;
}

- (void)setFrameHeight:(CGFloat)newHeight {
  self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,
                          self.frame.size.width, newHeight);
}

- (CGFloat)centerX {
  return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
  self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
  return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
  self.center = CGPointMake(self.center.x, centerY);
}

@end
