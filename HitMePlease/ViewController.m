//
//  ViewController.m
//  HitMePlease
//
//  Created by Jep Xia on 16/12/4.
//  Copyright © 2016年 Jep Xia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)showAlert:(id)sender;
- (IBAction)sliderMoved:(id)sender;

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


- (IBAction)showAlert:(id)sender {
    [[[UIAlertView alloc]initWithTitle:@"您好，苍老师" message:@"听说您的新贴转发了499次" delegate:nil cancelButtonTitle:@"我来帮转1次，你懂的" otherButtonTitles:nil, nil]show];
}

- (IBAction)sliderMoved:(id)sender {
    UISlider *slider = (UISlider*)sender;
    NSLog(@"滑动条的当前数值是：%f",slider.value);
}
@end
