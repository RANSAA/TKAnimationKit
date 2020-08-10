//
//  TestKenBurnsView.m
//  TKAnimationKit
//
//  Created by PC on 2020/8/10.
//  Copyright © 2020 PC. All rights reserved.
//

#import "TestKenBurnsView.h"
#import "KenBurnsView.h"


@interface TestKenBurnsView ()

@end

@implementation TestKenBurnsView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;

//    self.view.frame = [UIScreen mainScreen].bounds;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self test];
}

- (void)test
{
    NSArray *ary = @[[UIImage imageNamed:@"tiankong1"]];
    KenBurnsView *vi = [[KenBurnsView alloc] initWithFrame:self.view.bounds];
    [vi animateWithImages:ary transitionDuration:15 loop:YES isLandscape:YES];
    [self.view addSubview:vi];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
