//
//  TableViewController.m
//  TKAnimationKit
//
//  Created by PC on 2020/8/10.
//  Copyright © 2020 PC. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "TestKenBurnsView.h"
#import "TestDBSphereView.h"





@interface TableViewController ()
@property(nonatomic, strong) NSArray *titleAry;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDatas];

}

- (void)loadDatas
{
    self.titleAry = @[@"Test",
                      @"KenBurnsView",
                      @"TKSphereView"
    ];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleAry.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.titleAry[row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    switch (row) {
        case 0:
        {
            ViewController *vc = [ViewController createVC];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            TestKenBurnsView *vc = [[TestKenBurnsView alloc] init];
            [self.navigationController pushViewController:vc animated:YES];

        }
            break;
        case 2:
        {
            TestDBSphereView *vc = [[TestDBSphereView alloc] init];
            [self.navigationController pushViewController:vc animated:YES];

        }
            break;

        default:
            break;
    }
}

@end
