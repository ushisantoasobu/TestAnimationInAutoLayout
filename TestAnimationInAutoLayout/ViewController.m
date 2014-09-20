//
//  ViewController.m
//  TestAnimationInAutoLayout
//
//  Created by SatoShunsuke on 2014/09/20.
//  Copyright (c) 2014年 SatoShunsuke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yConst;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *xConst;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnTapped:(id)sender {
    
    //http://stackoverflow.com/questions/19899323/autolayout-constraints-and-animation
    //より
    
    [self.view removeConstraints:@[self.yConst,self.xConst]];
    CGFloat xPos = rand() % (int)self.view.frame.size.width;
    CGFloat yPos = rand() % (int)self.view.frame.size.height;
    self.yConst = [NSLayoutConstraint constraintWithItem:self.view
                                                  attribute:NSLayoutAttributeBottom
                                                  relatedBy:0
                                                     toItem:sender
                                                  attribute:NSLayoutAttributeBottom
                                                 multiplier:1
                                                   constant:yPos];
    [self.view addConstraint:self.yConst];
    self.xConst = [NSLayoutConstraint constraintWithItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:0
                                                             toItem:sender
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1
                                                           constant:xPos];
    [self.view addConstraint:self.xConst];
    [UIView animateWithDuration:1 delay:0.0 options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        //
    }];
}


@end
