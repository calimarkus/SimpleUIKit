//
//  NSAttributedString+SimpleUIKit.m
//  SimpleUIKit
//

#import "NSAttributedString+SimpleUIKit.h"

@implementation NSMutableAttributedString (SimpleUIKit)

- (void)setFont:(UIFont*)font forRangeOfString:(NSString*)stringOrNil {
  [self setFont:font forRange:[self _rangeForStringOrNil:stringOrNil]];
}

- (void)setColor:(UIColor*)color forRangeOfString:(NSString*)stringOrNil {
  [self setColor:color forRange:[self _rangeForStringOrNil:stringOrNil]];
}

- (void)setFont:(UIFont*)font color:(UIColor*)color forRangeOfString:(NSString*)stringOrNil {
  [self setFont:font color:color forRange:[self _rangeForStringOrNil:stringOrNil]];
}

- (void)setFont:(UIFont*)font forRange:(NSRange)range {
  [self _setAttributes:@{NSFontAttributeName:font} forRange:range];
}

- (void)setColor:(UIColor*)color forRange:(NSRange)range {
  [self _setAttributes:@{NSForegroundColorAttributeName:color} forRange:range];
}

- (void)setFont:(UIFont*)font color:(UIColor*)color forRange:(NSRange)range {
  [self _setAttributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName:font} forRange:range];
}

#pragma mark - Internal

- (NSRange)_rangeForStringOrNil:(NSString *)stringOrNil
{
  return (stringOrNil ?
          [[self string] rangeOfString:stringOrNil] :
          NSMakeRange(0, [self length]));
}

- (void)_setAttributes:(NSDictionary*)attributes forRange:(NSRange)range
{
  if (range.location != NSNotFound) {
    [self setAttributes:attributes range:range];
  }
}

@end
