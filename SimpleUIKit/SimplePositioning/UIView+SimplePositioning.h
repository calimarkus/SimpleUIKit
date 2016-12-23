//
//  UIView+SimplePositioning.h
//

#import <UIKit/UIKit.h>

@interface UIView (SimplePositioning)

@property (nonatomic) CGPoint frameOrigin;
@property (nonatomic) CGSize frameSize;

@property (nonatomic) CGFloat frameX;
@property (nonatomic) CGFloat frameY;

@property (nonatomic) CGFloat frameRight; // modifies the origin, not the size
@property (nonatomic) CGFloat frameBottom; // modifies the origin, not the size

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@end
