//
//  ZHViewController.m
//  Dyrs
//
//  Created by mbp  on 13-8-12.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "ZHViewController.h"
#import "ZHUpdateViewController.h"




@interface ZHViewController ()

@end

@implementation ZHViewController




- (void)openUpdateViewController
{
    ZHUpdateViewController *updateViewController = [[ZHUpdateViewController alloc] init];
    
    [self.view  addSubview:updateViewController.view];
    [self  addChildViewController:updateViewController];
    
    
    [updateViewController release];
}

#pragma mark    - view cycle
- (void)viewDidLoad
{
    [super viewDidLoad];



    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button4 setTitle:@"open update" forState:UIControlStateNormal];
    button4.frame = CGRectMake(20, 400, 280, 50);
    [button4 addTarget:self  action:@selector(openUpdateViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button4];
    
    
    [self openUpdateViewController];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
