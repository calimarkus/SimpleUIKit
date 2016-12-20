//
//  SMViewController.h
//  SimpleUIKit ExampleProject
//

#import <UIKit/UIKit.h>

@interface SMViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;

@end
