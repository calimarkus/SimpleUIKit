/**
 * This file is generated using the remodel generation script.
 * The name of the input file is SimpleAlertButton.adtValue
 */

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "SimpleAlertButton.h"

typedef NS_ENUM(NSUInteger, _SimpleAlertButtonSubtypes) {
  _SimpleAlertButtonSubtypesdefaultButton,
  _SimpleAlertButtonSubtypescancelButton,
  _SimpleAlertButtonSubtypesdestructiveButton
};

@implementation SimpleAlertButton
{
  _SimpleAlertButtonSubtypes _subtype;
  NSString *_defaultButton_title;
  NSString *_cancelButton_title;
  NSString *_destructiveButton_title;
}

+ (instancetype)cancelButtonWithTitle:(NSString *)title
{
  SimpleAlertButton *object = [[SimpleAlertButton alloc] init];
  object->_subtype = _SimpleAlertButtonSubtypescancelButton;
  object->_cancelButton_title = title;
  return object;
}

+ (instancetype)defaultButtonWithTitle:(NSString *)title
{
  SimpleAlertButton *object = [[SimpleAlertButton alloc] init];
  object->_subtype = _SimpleAlertButtonSubtypesdefaultButton;
  object->_defaultButton_title = title;
  return object;
}

+ (instancetype)destructiveButtonWithTitle:(NSString *)title
{
  SimpleAlertButton *object = [[SimpleAlertButton alloc] init];
  object->_subtype = _SimpleAlertButtonSubtypesdestructiveButton;
  object->_destructiveButton_title = title;
  return object;
}

- (id)copyWithZone:(NSZone *)zone
{
  return self;
}

- (NSString *)description
{
  switch (_subtype) {
    case _SimpleAlertButtonSubtypesdefaultButton: {
      return [NSString stringWithFormat:@"%@ - defaultButton \n\t title: %@; \n", [super description], _defaultButton_title];
      break;
    }
    case _SimpleAlertButtonSubtypescancelButton: {
      return [NSString stringWithFormat:@"%@ - cancelButton \n\t title: %@; \n", [super description], _cancelButton_title];
      break;
    }
    case _SimpleAlertButtonSubtypesdestructiveButton: {
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
  } else if (self == nil || object == nil || ![object isKindOfClass:[self class]]) {
    return NO;
  }
  return
    _subtype == object->_subtype &&
    (_defaultButton_title == object->_defaultButton_title ? YES : [_defaultButton_title isEqual:object->_defaultButton_title]) &&
    (_cancelButton_title == object->_cancelButton_title ? YES : [_cancelButton_title isEqual:object->_cancelButton_title]) &&
    (_destructiveButton_title == object->_destructiveButton_title ? YES : [_destructiveButton_title isEqual:object->_destructiveButton_title]);
}

- (void)matchDefaultButton:(SimpleAlertButtonDefaultButtonMatchHandler)defaultButtonMatchHandler cancelButton:(SimpleAlertButtonCancelButtonMatchHandler)cancelButtonMatchHandler destructiveButton:(SimpleAlertButtonDestructiveButtonMatchHandler)destructiveButtonMatchHandler
{
  switch (_subtype) {
    case _SimpleAlertButtonSubtypesdefaultButton: {
      defaultButtonMatchHandler(_defaultButton_title);
      break;
    }
    case _SimpleAlertButtonSubtypescancelButton: {
      cancelButtonMatchHandler(_cancelButton_title);
      break;
    }
    case _SimpleAlertButtonSubtypesdestructiveButton: {
      destructiveButtonMatchHandler(_destructiveButton_title);
      break;
    }
  }
}

@end

