//
//  AttributedStringViewController.m
//  SimpleUIKit ExampleProject
//

#import "AttributedStringViewController.h"

#import "NSAttributedString+SimpleUIKit.h"

@implementation AttributedStringViewController {
  UITextView *_textView;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.title = @"SimpleAttributedString";
    self.edgesForExtendedLayout = UIRectEdgeNone;

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidChangeFrame:)
                                                 name:UIKeyboardDidChangeFrameNotification
                                               object:nil];
  }
  return self;
}

- (void)dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardDidChangeFrame:(NSNotification *)notification
{
  const CGRect rawKeyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
  const CGRect textViewFrameInWindowCoordinates = [_textView convertRect:_textView.bounds toView:_textView.window];
  const CGRect intersectionRect = CGRectIntersection(textViewFrameInWindowCoordinates, rawKeyboardFrame);
  _textView.contentInset = (UIEdgeInsets){ .bottom = CGRectGetHeight(intersectionRect) };
  _textView.scrollIndicatorInsets = _textView.contentInset;
}

- (void)viewDidLoad
{
  CGFloat textSize = 15.0;
  UITextView *textView = [[UITextView alloc] initWithFrame:self.view.bounds];
  textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  textView.font = [UIFont systemFontOfSize:textSize];
  textView.attributedText = FormattedExampleText(textSize);
  _textView = textView;
  [self.view addSubview:_textView];

  UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
  containerView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
  UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"B",@"I",@"U"]];
  segmentedControl.frame = CGRectMake(10, 5, 300, 30);
  segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  segmentedControl.momentary = YES;
  [segmentedControl addTarget:self
                       action:@selector(segmentedControlDidChangeValue:)
             forControlEvents:UIControlEventValueChanged];
  [containerView addSubview:segmentedControl];
  textView.inputAccessoryView = containerView;
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [_textView becomeFirstResponder];
}

- (void)segmentedControlDidChangeValue:(UISegmentedControl *)segmentedControl
{
  NSMutableAttributedString *mutableString = [_textView.attributedText mutableCopy];
  switch (segmentedControl.selectedSegmentIndex) {
    case 0:
      [mutableString setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]
                    forRange:_textView.selectedRange];
      break;
    case 1:
      [mutableString setFont:[UIFont italicSystemFontOfSize:[UIFont systemFontSize]]
                    forRange:_textView.selectedRange];
      break;
    case 2:
      [mutableString setAttributes:@{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)}
                             range:_textView.selectedRange];
      break;

    default:
      break;
  }
  _textView.attributedText = mutableString;
}

static NSAttributedString *FormattedExampleText(CGFloat textSize)
{
  NSMutableAttributedString *mutableString = [[NSMutableAttributedString alloc] initWithString:ExampleText()];
  [mutableString setFont:[UIFont boldSystemFontOfSize:textSize]
                   color:[UIColor orangeColor]
        forRangeOfString:@"Judy Hopps"];
  [mutableString setFont:[UIFont boldSystemFontOfSize:textSize]
                   color:[UIColor redColor]
        forRangeOfString:@"Zootopia"];
  [mutableString setFont:[UIFont boldSystemFontOfSize:textSize]
                   color:[UIColor blueColor]
        forRangeOfString:@"police academy"];
  return mutableString;
}

static NSString *ExampleText()
{
  return @"In a world populated by anthropomorphic mammals where predators and prey \
  species peacefully coexist, a rabbit from rural Bunnyburrow named Judy Hopps fulfills her \
  childhood dream of becoming the first rabbit police officer in urban utopia, Zootopia. Despite \
  being the police academy valedictorian, Judy is relegated to parking duty by Chief Bogo, who \
  doubts her potential. On her first day, she is hustled by Nick Wilde and Finnick, a con artist \
  duo of foxes.\n\
  \n\
  The next day, Judy abandons parking duty to arrest Duke Weaselton, a thief who stole plant bulbs.\
  Bogo reprimands her, but an otter named Mrs. Otterton enters Bogo's office pleading for someone to\
  find her husband Emmitt, one of fourteen predators who have gone missing. Judy volunteers, causing Bogo\
  to fire her for insubordination. When Assistant Mayor Dawn Bellwether praises the assignment and informs\
  Mayor Leodore Lionheart that Judy is taking the case, Bogo gives her 48 hours to find Otterton on the condition\
  that she must resign if she fails.";
}

@end
