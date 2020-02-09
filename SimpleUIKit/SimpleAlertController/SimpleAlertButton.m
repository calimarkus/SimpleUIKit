/**
 * This file is generated using the remodel generation script.
 * The name of the input file is SimpleAlertButton.adtValue
 */

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "SimpleAlertButton.h"

typedef NS_ENUM(NSUInteger, SimpleAlertButtonSubtypes) {
  SimpleAlertButtonSubtypesDefaultButton,
  SimpleAlertButtonSubtypesCancelButton,
  SimpleAlertButtonSubtypesDestructiveButton
};

@implementation SimpleAlertButton
{
  SimpleAlertButtonSubtypes _subtype;
  NSString *_defaultButton_title;
  NSString *_cancelButton_title;
  NSString *_destructiveButton_title;
}

+ (instancetype)cancelButtonWithTitle:(NSString *)title
{
  SimpleAlertButton *object = [(id)self new];
  object->_subtype = SimpleAlertButtonSubtypesCancelButton;
  object->_cancelButton_title = title;
  return object;
}

+ (instancetype)defaultButtonWithTitle:(NSString *)title
{
  SimpleAlertButton *object = [(id)self new];
  object->_subtype = SimpleAlertButtonSubtypesDefaultButton;
  object->_defaultButton_title = title;
  return object;
}

+ (instancetype)destructiveButtonWithTitle:(NSString *)title
{
  SimpleAlertButton *object = [(id)self new];
  object->_subtype = SimpleAlertButtonSubtypesDestructiveButton;
  object->_destructiveButton_title = title;
  return object;
}

- (id)copyWithZone:(nullable NSZone *)zone
{
  return self;
}

- (NSString *)description
{
  switch (_subtype) {
    case SimpleAlertButtonSubtypesDefaultButton: {
      return [NSString stringWithFormat:@"%@ - defaultButton \n\t title: %@; \n", [super description], _defaultButton_title];
      break;
    }
    case SimpleAlertButtonSubtypesCancelButton: {
      return [NSString stringWithFormat:@"%@ - cancelButton \n\t title: %@; \n", [super description], _cancelButton_title];
      break;
    }
    case SimpleAlertButtonSubtypesDestructiveButton: {
      return [NSString stringWithFormat:@"%@ - destructiveButton \n\t title: %@; \n", [super description], _destructiveButton_title];
      break;
    }
  }
}

- (NSUInteger)hash
{
  NSUInteger subhashes[] = {_subtype, [_defaultButton_title hash], [_cancelButton_title hash], [_destructiveButton_title hash]};
  NSUInteger result = subhashes[0];
  for (int ii = 1; ii < 4; ++ii) {
    unsigned long long base = (((unsigned long long)result) << 32 | subhashes[ii]);
    base = (~base) + (base << 18);
    base ^= (base >> 31);
    base *=  21;
    base ^= (base >> 11);
    base += (base << 6);
    base ^= (base >> 22);
    result = base;
  }
  return result;
}

- (BOOL)isEqual:(SimpleAlertButton *)object
{
  if (self == object) {
    return YES;
  } else if (object == nil || ![object isKindOfClass:[self class]]) {
    return NO;
  }
  return
    _subtype == object->_subtype &&
    (_defaultButton_title == object->_defaultButton_title ? YES : [_defaultButton_title isEqual:object->_defaultButton_title]) &&
    (_cancelButton_title == object->_cancelButton_title ? YES : [_cancelButton_title isEqual:object->_cancelButton_title]) &&
    (_destructiveButton_title == object->_destructiveButton_title ? YES : [_destructiveButton_title isEqual:object->_destructiveButton_title]);
}

- (void)matchDefaultButton:(NS_NOESCAPE __unsafe_unretained SimpleAlertButtonDefaultButtonMatchHandler)defaultButtonMatchHandler cancelButton:(NS_NOESCAPE __unsafe_unretained SimpleAlertButtonCancelButtonMatchHandler)cancelButtonMatchHandler destructiveButton:(NS_NOESCAPE __unsafe_unretained SimpleAlertButtonDestructiveButtonMatchHandler)destructiveButtonMatchHandler
{
  switch (_subtype) {
    case SimpleAlertButtonSubtypesDefaultButton: {
      if (defaultButtonMatchHandler) {
        defaultButtonMatchHandler(_defaultButton_title);
      }
      break;
    }
    case SimpleAlertButtonSubtypesCancelButton: {
      if (cancelButtonMatchHandler) {
        cancelButtonMatchHandler(_cancelButton_title);
      }
      break;
    }
    case SimpleAlertButtonSubtypesDestructiveButton: {
      if (destructiveButtonMatchHandler) {
        destructiveButtonMatchHandler(_destructiveButton_title);
      }
      break;
    }
  }
}

@end
