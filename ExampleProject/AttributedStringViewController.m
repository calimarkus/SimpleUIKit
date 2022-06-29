//
//  AttributedStringViewController.m
//  SimpleUIKit ExampleProject
//

#import "AttributedStringViewController.h"

#import "UIView+SimplePositioning.h"
#import "NSAttributedString+SimpleUIKit.h"

typedef NS_ENUM(NSUInteger, EditAction) {
  EditActionBold,
  EditActionItalic,
  EditActionUnderline
};

@interface AttributedStringViewController () <UITextViewDelegate>
@end

@implementation AttributedStringViewController {
  UITextView *_textView;
  UIToolbar *_toolbar;
  CGFloat _textSize;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    self.title = @"SimpleAttributedString";
    _textSize = 15.0;

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidChangeFrame:)
                                                 name:UIKeyboardDidChangeFrameNotification
                                               object:nil];
  }
  return self;
}

- (void)keyboardDidChangeFrame:(NSNotification *)notification
{
  const CGRect rawKeyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
  const CGRect textViewFrameInWindowCoordinates = [_textView convertRect:_textView.bounds toView:_textView.window];
  const CGRect intersectionRect = CGRectIntersection(textViewFrameInWindowCoordinates, rawKeyboardFrame);
  _textView.contentInset = (UIEdgeInsets){ .bottom = CGRectGetHeight(intersectionRect) };
  _textView.scrollIndicatorInsets = _textView.contentInset;
}

- (void)loadView {
  [super loadView];

  self.view.backgroundColor = [UIColor systemGray6Color];

  UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40.0)];
  toolbar.items = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                    [[UIBarButtonItem alloc] initWithTitle:@"B" style:UIBarButtonItemStylePlain target:self action:@selector(makeBold:)],
                    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                    [[UIBarButtonItem alloc] initWithTitle:@"I" style:UIBarButtonItemStylePlain target:self action:@selector(makeItalic:)],
                    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                    [[UIBarButtonItem alloc] initWithTitle:@"U" style:UIBarButtonItemStylePlain target:self action:@selector(makeUnderline:)],
                    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
  _toolbar = toolbar;
  [self.view addSubview:toolbar];

  UITextView *textView = [[UITextView alloc] initWithFrame:self.view.bounds];
  textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  textView.attributedText = FormattedExampleText(_textSize);
  textView.font = [UIFont systemFontOfSize:_textSize];
  textView.delegate = self;
  _textView = textView;
  [self.view addSubview:_textView];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [_textView becomeFirstResponder];
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];

  _toolbar.frameY = self.view.safeAreaInsets.top;
  _textView.frameY = _toolbar.frameBottom;
  _textView.frameHeight = self.view.frameHeight - _toolbar.frameY - self.view.safeAreaInsets.bottom;
}

- (void)makeBold:(id)sender { [self editWithAction:EditActionBold]; }
- (void)makeItalic:(id)sender { [self editWithAction:EditActionItalic]; }
- (void)makeUnderline:(id)sender { [self editWithAction:EditActionUnderline]; }

- (void)editWithAction:(EditAction)action
{
  NSMutableAttributedString *mutableString = [_textView.attributedText mutableCopy];
  switch (action) {
    case EditActionBold:
      [mutableString setFont:[UIFont boldSystemFontOfSize:_textSize]
                    forRange:_textView.selectedRange];
      break;
    case EditActionItalic:
      [mutableString setFont:[UIFont italicSystemFontOfSize:_textSize]
                    forRange:_textView.selectedRange];
      break;
    case EditActionUnderline:
      [mutableString setAttributes:@{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                                     NSFontAttributeName: [UIFont systemFontOfSize:_textSize]}
                             range:_textView.selectedRange];
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
