//
//  AboutViewController.m
//  HitMePlease
//
//  Created by Jep Xia on 16/12/5.
//  Copyright © 2016年 Jep Xia. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()
- (IBAction)close:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *htmlFile =[[NSBundle mainBundle]pathForResource:@"CrazyDrag" ofType:@"html"];
//    NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
//    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]];
//    [self.webView loadData:htmlData
//                  MIMEType:@"text/html"
//          textEncodingName:@"UTF-8"
//                   baseURL:baseURL];
//    
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];   [self.webView loadRequest:request];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)close:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
