//
//  ViewController.m
//  TestAnimationInAutoLayout
//
//  Created by SatoShunsuke on 2014/09/20.
//  Copyright (c) 2014年 SatoShunsuke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraint1_y;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraint2_y;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraint3_y;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraint4_y;

@property (strong, nonatomic) NSLayoutConstraint *tempConstraint1_y;
@property (strong, nonatomic) NSLayoutConstraint *tempConstraint2_y;
@property (strong, nonatomic) NSLayoutConstraint *tempConstraint3_y;
@property (strong, nonatomic) NSLayoutConstraint *tempConstraint4_y;

@property (weak, nonatomic) IBOutlet UIButton *btnTest;

@end

//http://stackoverflow.com/questions/19899323/autolayout-constraints-and-animation
//より

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setViewBelowPosition:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)setViewBelowPosition:(BOOL)animate
{
    CGFloat duration = animate ? 0.4 : 0.0;
    
    _tempConstraint1_y = _constraint1_y;
    [self.view removeConstraints:@[_constraint1_y]];
    _constraint1_y = [NSLayoutConstraint constraintWithItem:self.view
                                                  attribute:NSLayoutAttributeBottom
                                                  relatedBy:0
                                                     toItem:_btn1
                                                  attribute:NSLayoutAttributeBottom
                                                 multiplier:1
                                                   constant:-1000];
    [self.view addConstraint:_constraint1_y];
    [UIView animateWithDuration:duration delay:0.0 options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        //
    }];
    
    _tempConstraint2_y = _constraint2_y;
    [self.view removeConstraints:@[_constraint2_y]];
    _constraint2_y = [NSLayoutConstraint constraintWithItem:self.view
                                                  attribute:NSLayoutAttributeBottom
                                                  relatedBy:0
                                                     toItem:_btn2
                                                  attribute:NSLayoutAttributeBottom
                                                 multiplier:1
                                                   constant:-1000];
    [self.view addConstraint:_constraint2_y];
    [UIView animateWithDuration:duration delay:0.0 options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        //
    }];
    
    _tempConstraint3_y = _constraint3_y;
    [self.view removeConstraints:@[_constraint3_y]];
    _constraint3_y = [NSLayoutConstraint constraintWithItem:self.view
                                                  attribute:NSLayoutAttributeBottom
                                                  relatedBy:0
                                                     toItem:_btn3
                                                  attribute:NSLayoutAttributeBottom
                                                 multiplier:1
                                                   constant:-1000];
    [self.view addConstraint:_constraint3_y];
    [UIView animateWithDuration:duration delay:0.0 options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        //
    }];
    
    _tempConstraint4_y = _constraint4_y;
    [self.view removeConstraints:@[_constraint4_y]];
    _constraint4_y = [NSLayoutConstraint constraintWithItem:self.view
                                                  attribute:NSLayoutAttributeBottom
                                                  relatedBy:0
                                                     toItem:_btn4
                                                  attribute:NSLayoutAttributeBottom
                                                 multiplier:1
                                                   constant:-1000];
    [self.view addConstraint:_constraint4_y];
    [UIView animateWithDuration:duration delay:0.0 options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        //
    }];
}

- (IBAction)btnTapped:(id)sender {
    
    _btnTest.selected = !_btnTest.selected;
    
    if (!_btnTest.isSelected) {
        [self setViewBelowPosition:YES];
        return;
    }
    
    [self.view removeConstraints:@[_constraint1_y]];
    [self.view addConstraint:_tempConstraint1_y];
    [UIView animateWithDuration:0.4 delay:0.0 options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        _constraint1_y = _tempConstraint1_y;
    }];
    
    [self.view removeConstraints:@[_constraint2_y]];
    [self.view addConstraint:_tempConstraint2_y];
    [UIView animateWithDuration:0.4 delay:0.2 options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        _constraint2_y = _tempConstraint2_y;
    }];
    
    [self.view removeConstraints:@[_constraint3_y]];
    [self.view addConstraint:_tempConstraint3_y];
    [UIView animateWithDuration:0.4 delay:0.4 options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        _constraint3_y = _tempConstraint3_y;
    }];
    
    [self.view removeConstraints:@[_constraint4_y]];
    [self.view addConstraint:_tempConstraint4_y];
    [UIView animateWithDuration:0.4 delay:0.6 options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        _constraint4_y = _tempConstraint4_y;
    }];
}




@end
