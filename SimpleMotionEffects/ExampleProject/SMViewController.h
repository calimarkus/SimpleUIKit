//
//  SMViewController.h
//  ExampleProject
//
//  Created by Markus Emrich on 17.11.13.
//  Copyright (c) 2013 Markus Emrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;

@end
