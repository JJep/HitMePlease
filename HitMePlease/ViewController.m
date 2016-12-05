//
//  ViewController.m
//  HitMePlease
//
//  Created by Jep Xia on 16/12/4.
//  Copyright © 2016年 Jep Xia. All rights reserved.
//

#import "ViewController.h"
#import "AboutViewController.h"

@interface ViewController () {
    int currentValue;
    int targetValue;
    int score;
    int round;
}

- (IBAction)showAlert:(id)sender;
- (IBAction)sliderMoved:(id)sender;
- (IBAction)starover:(id)sender;
- (IBAction)showInfo:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UILabel *targetLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *roundLabel;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb- Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
    
    [self startNewRound];
    [self updateLabels];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)startNewRound {
    targetValue = 1 + (arc4random() % 100);
    currentValue = 50;
    round += 1;
    self.slider.value = currentValue;
}

- (void)updateLabels {
    self.targetLabel.text = [NSString stringWithFormat:@"%d", targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", round];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showAlert:(id)sender {

    int difference = abs(targetValue - currentValue);
    int points = 100 - difference;
    score += points;
    NSString *message = [NSString stringWithFormat:@"滑动条的当前数值是:%d,我们的标数值是:%d,之间的差距是:%d",
                         currentValue,
                         targetValue,
                         difference];
    NSString *currentScoreTitle = [NSString stringWithFormat:@"当前得分为 %d", score];

    UIAlertController* alert = [UIAlertController alertControllerWithTitle:currentScoreTitle
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"本老师知道了" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              [self startNewRound];
                                                              [self updateLabels];
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)sliderMoved:(id)sender {
    UISlider *slider = (UISlider*)sender;
    currentValue = (int)lroundf(slider.value);
}

- (IBAction)starover:(id)sender {
    //添加过渡效果
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade; transition.duration = 3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];

    round = 0;
    score = 0;
    targetValue = 0;
    currentValue = 0;
    [self startNewRound];
    [self updateLabels];
    
    [self.view.layer addAnimation:transition forKey:nil];
}

- (IBAction)showInfo:(id)sender {
    AboutViewController *controller = [[AboutViewController alloc]initWithNibName:@"AboutViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}
@end
