//
//  NSAttributedString+StillWaitin.m
//  SimpleUIKit
//

#import "NSAttributedString+StillWaitin.h"

@implementation NSMutableAttributedString (StillWaitin)

- (void)setFont:(UIFont*)font color:(UIColor*)color forRangeOfString:(NSString*)stringOrNil
{
  [self _setAttributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName:font}
      forRangeOfString:stringOrNil];
}

- (void)_setAttributes:(NSDictionary*)attributes forRangeOfString:(NSString*)stringOrNil
{
  const NSRange range = (stringOrNil ?
                         [[self string] rangeOfString:stringOrNil] :
                         NSMakeRange(0, [self length]));

  if (range.location != NSNotFound) {
    [self setAttributes:attributes range:range];
  }
}

@end
