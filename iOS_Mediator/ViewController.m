//
//  ViewController.m
//  iOS_Mediator
//
//  Created by 侯良凯 on 2022/1/19.
//

#import "ViewController.h"
#import <CTMediator/CTMediator.h>
#import <A_Category/CTMediator+A.h>
#import <A_Extension/A_Extension-Swift.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = self.dataSource[indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        // Objective-C -> Category -> Objective-C
        UIViewController *viewController = [[CTMediator sharedInstance] A_Category_Objc_ViewControllerWithCallback:^(NSString *result) {
            NSLog(@"%@", result);
        }];
        [self presentViewController:viewController animated:YES completion:nil];
//        [self.navigationController pushViewController:viewController animated:YES];
    }
    if (indexPath.row == 1) {
        // Objective-C -> Category -> Swift
        UIViewController *viewController = [[CTMediator sharedInstance] A_Category_Swift_ViewControllerWithCallback:^(NSString *result) {
            NSLog(@"%@", result);
        }];
        [self presentViewController:viewController animated:YES completion:nil];

//        [self.navigationController pushViewController:viewController animated:YES];
    }
    if (indexPath.row == 2) {
//         Objective-C -> Extension -> Objective-C
        UIViewController *viewController = [[CTMediator sharedInstance] A_showObjcWithCallback:^(NSString * _Nonnull result) {
            NSLog(@"%@", result);
        }];
        [self presentViewController:viewController animated:YES completion:nil];

//        [self.navigationController pushViewController:viewController animated:YES];
    }
    if (indexPath.row == 3) {
        // Objective-C -> Extension -> Swift
        UIViewController *viewController = [[CTMediator sharedInstance] A_showSwiftWithCallback:^(NSString * _Nonnull result) {
            NSLog(@"%@", result);
        }];
        [self presentViewController:viewController animated:YES completion:nil];

//        [self.navigationController pushViewController:viewController animated:YES];
    }
}


#pragma mark - getters and setters

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = @[
                        @"Objective-C -> Category -> Objective-C",
                        @"Objective-C -> Category -> Swift",
                        @"Objective-C -> Extension -> Objective-C",
                        @"Objective-C -> Extension -> Swift",
                        ];
    }
    return _dataSource;
}


@end
