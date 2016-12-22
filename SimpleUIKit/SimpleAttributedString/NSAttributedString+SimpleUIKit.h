//
//  NSAttributedString+SimpleUIKit.h
//  SimpleUIKit
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (SimpleUIKit)

- (void)setFont:(UIFont*)font forRangeOfString:(NSString*)stringOrNil;
- (void)setColor:(UIColor*)color forRangeOfString:(NSString*)stringOrNil;
- (void)setFont:(UIFont*)font color:(UIColor*)color forRangeOfString:(NSString*)stringOrNil;

- (void)setFont:(UIFont*)font forRange:(NSRange)range;
- (void)setColor:(UIColor*)color forRange:(NSRange)range;
- (void)setFont:(UIFont*)font color:(UIColor*)color forRange:(NSRange)range;

@end
