# SimpleMotionEffects

This **UIView Category** provides a simpler API to create motion effects faster and in only a single line of code.

![Screenshot](https://raw.githubusercontent.com/calimarkus/SimpleUIKit/master/gfx/SimpleMotionEffects.png)

## Installation

**Cocoapods**

`pod 'SimpleMotionEffects'`

**Manually**

Add the `UIView+SimpleMotionEffects.{h,m}` files to your project.

## Usage

1. Import the header `#import "UIView+SimpleMotionEffects.h"`
2. Use any of the following methods on any UIView.

Just specify how much a view should move at maximum on both axes, when tilting:

```objective-c
- (void)addMotionEffectWithMovement:(CGPoint)movement;
```
	
Or specify, how much a view should move on both axes reacting to horizontalTilt oder verticalTilt only:
	
```objective-c
- (void)addMotionEffectOnHorizontalTilt:(CGPoint)horizontalMovement
	                     onVerticalTilt:(CGPoint)verticalMovement;
```

Or for more granular settings:

```objective-c
- (void)addMotionEffectWithType:(UIInterpolatingMotionEffectType)type
	                    keyPath:(NSString*)keyPath
	                      value:(CGFloat)value;
	
- (void)addMotionEffectWithType:(UIInterpolatingMotionEffectType)type
	                    keyPath:(NSString*)keyPath
	                   minValue:(CGFloat)minValue
	                   maxValue:(CGFloat)maxValue;
```
