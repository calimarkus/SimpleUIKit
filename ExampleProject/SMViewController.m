//
//  SMViewController.m
//  ExampleProject
//
//  Created by Markus Emrich on 17.11.13.
//  Copyright (c) 2013 Markus Emrich. All rights reserved.
//

#import "UIView+SimpleMotionEffects.h"

#import "SMViewController.h"

@interface SMViewController ()

@end

@implementation SMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // status bar style
    if([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    
    // labels
    CGFloat strenghtX = self.view.frame.size.width / (self.labels.count * 2);
    CGFloat strenghtY = self.view.frame.size.height / (self.labels.count * 4);
    [self.labels enumerateObjectsUsingBlock:^(UILabel *label, NSUInteger idx, BOOL *stop) {
        [label addMotionEffectWithMovement:CGPointMake(strenghtX*idx, strenghtY*idx)];
    }];
    
    // image
    [self.imageView addMotionEffectWithMovement:CGPointMake(150, 150)];
}

@end
