//
//  ViewController.m
//  TKAnimationKit
//
//  Created by PC on 2020/8/10.
//  Copyright © 2020 PC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong)CAShapeLayer *shapeLayer;
@property(nonatomic, strong)CALayer *colorLayer;
@end

@implementation ViewController

+ (instancetype)createVC
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    id vc = [story instantiateViewControllerWithIdentifier:@"ViewController"];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    [self jionAnimate];
//
//    [self addShapeLayer];
//
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self changeBackgroundColor];
//
//    });

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self jionAnimate];

    [self addShapeLayer];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self changeBackgroundColor];

    });
}


// 进入位移+抖动
- (void)jionAnimate
{
        [UIView animateWithDuration:1 animations:^{

            self.view.backgroundColor = [UIColor redColor];

//            self.view.center = CGPointMake(self.view.center.x, self.view.center.y + 200);

//            self.view.bounds = CGRectMake(0, 0, 50, 50);

        } completion:^(BOOL finished) {
            self.view.frame = [UIScreen mainScreen].bounds;

            // 2.抖动
            [self shakeAnim];

            NSLog(@"bundles:%@",NSStringFromCGRect(self.view.bounds));
        }];
}

//抖动
- (void)shakeAnim
{
       CAKeyframeAnimation *shakeAnim = [CAKeyframeAnimation animation];

       shakeAnim.keyPath = @"transform.translation.x";

       shakeAnim.duration = 1.15;

       CGFloat delta = 10;

       shakeAnim.values = @[@0, @(-delta), @(delta), @0];

       shakeAnim.repeatCount = 5;

       [self.view.layer addAnimation:shakeAnim forKey:nil];
}

//添加圆圈layer
- (void)addShapeLayer
{
    CAShapeLayer *layer = [CAShapeLayer new];
    CGFloat lineWidth = 5;
    CGRect rect = CGRectMake(0, 0, 200, 200);
    layer.bounds = rect;

    //这是个圆
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:rect.size.width/2.0];
    layer.lineWidth = lineWidth;
    layer.position = CGPointMake(200, 200);
    layer.path = path.CGPath;
    layer.fillColor = UIColor.cyanColor.CGColor;
    layer.strokeColor = UIColor.purpleColor.CGColor;
    layer.strokeStart = 0.0;//相当于从起点开始处被擦掉的位置
    layer.strokeEnd = 1.0;//相当于从起点开始处被显示的位置
    [self.view.layer addSublayer:layer];

    self.shapeLayer = layer;
}


//通过timeOffset改变背景颜色 ，该方法单独测试
- (void)changeBackgroundColor
{
    CABasicAnimation *changeColor = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    changeColor.fromValue = (id)[UIColor orangeColor].CGColor;
    changeColor.toValue   = (id)[UIColor blueColor].CGColor;
//    changeColor.byValue   = (id)[UIColor redColor].CGColor;
    changeColor.duration  = 1.0; // For convenience

    self.colorLayer = [[CALayer alloc] init];
    self.colorLayer.frame = [UIScreen mainScreen].bounds;
    [self.colorLayer addAnimation:changeColor forKey:@"color"];
    self.colorLayer.speed = 0;
    [self.view.layer insertSublayer:self.colorLayer atIndex:0];
}

- (IBAction)sliderChangeAction:(UISlider *)sender {
    self.colorLayer.timeOffset = sender.value;

//    self.shapeLayer.strokeStart = sender.value;
    self.shapeLayer.strokeEnd = sender.value;

    NSLog(@"value:%.4f",sender.value);
}

@end

