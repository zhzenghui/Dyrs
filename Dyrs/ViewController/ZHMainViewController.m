//
//  ZHMainViewController.m
//  NetWork
//
//  Created by zeng hui on 13-8-3.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "ZHMainViewController.h"

#import "ZHBrandViewController.h"
#import "ZHConstructionViewController.h"
#import "ZHProcessViewController.h"
#import "ZHProductViewController.h"
#import "ZHDepartmentViewController.h"
#import "ZHAccessoriesViewController.h"

#import "ZHLoginViewController.h"

#define Kheight  64
#define KsubHeight  44


@interface ZHMainViewController ()
{
    UIButton *currentMenuButton;
    UIButton *currentSubMenuButton;
    
    UIScrollView *menuScrollView;
}
@end

@implementation ZHMainViewController


- (void)hiddenMenu:(BOOL)isHidden
{

    if (isHidden) {
        menuStatus = menuStatus_hidden;
        menuView.frame = CGRectMake(-150, 0, 200, 768);
    }
    else {
        menuStatus = menuStatus_show;

        menuView.frame = CGRectMake(0, 0, 200, 768);
    }
}

- (void)menuStatue
{
    if (menuStatus == menuStatus_show) {
        
        [self hiddenMenu:YES];
    }
    else {
        [self hiddenMenu:NO];
    }


}

- (void)addMemu
{
    menuView = [[UIView alloc] init];
    menuView.frame = CGRectMake(0, 0, 200, 768);
    menuView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:menuView];
    [menuView release];
    
    
    
//    隐藏 按钮
    sHButton = [self addSelfView:menuView rect:CGRectMake(150, 400, 44, 44)
                             tag:0 action:@selector(menuStatue) imagePath:@"back" ];


    menuScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 150, 150 , 404)];
    menuScrollView.tag = 100;
    

    
    
    
    NSArray *menuArray = [NSArray arrayWithObjects:@"2", @"2", @"3", @"4", @"5", @"5",nil];

    
    for (int i = 0; i <[menuArray count]; i++) {
        

        NSString *str =  [menuArray objectAtIndex:i];

        [self addSelfView:menuScrollView
                     rect:CGRectMake(0, Kheight*i, 44, 44)
                      tag:i
                   action:@selector(openSubMenu:)
                imagePath:str ];
    
        
    }
    
    
    menuScrollView.contentSize = CGSizeMake(150, 650);
    
    [menuView addSubview:menuScrollView];
    [menuScrollView release];
    
}


- (void)openSubMenuForInteger:(int)tag
{
    

    NSArray *subMenuArray = [NSArray arrayWithObjects:
                             @"1,1,1,1,1",
                             @"1,1,1",
                             @"1,",
                             @"1,1,1,1,1,1",
                             @"1,1",
                             @"1,1,1,1", nil];
    
    NSString *subMenuString = [subMenuArray objectAtIndex:tag];
    NSArray *subArray  = [subMenuString componentsSeparatedByString:@","];

    int menuHeight = 0;
//      收起 菜单
    for (int i = 0; i < 6; i++) {
        
        UIButton *button = (UIButton *)[menuScrollView viewWithTag:i];
        
        button.frame = CGRectMake(0, i*44,
                                      button.frame.size.width, button.frame.size.height);
        menuHeight += button.frame.size.height;
        
    }
//    移除 子菜单
    for (int i = 0; i < 6; i++) {
        
        NSArray *subArray  = [[subMenuArray objectAtIndex:i] componentsSeparatedByString:@","];

        for (int i =0 ; i< [subArray count]; i++) {
            UIButton *button = (UIButton *)[menuScrollView viewWithTag:i+10];
            [button removeFromSuperview];
            button = nil;
        }

    }
    

//    添加子菜单的起始位置
    int startY = currentMenuButton.frame.origin.y + currentMenuButton.frame.size.height;
//      子菜单的高度
//    
    int subMenuHeight = 0;
    
    for (int i = 0; i <[subArray count]; i++) {
        
        
        [self addSelfView:menuScrollView
                     rect:CGRectMake(0, startY+KsubHeight*i, 44, 44)
                      tag:i+10
                   action:@selector(openViewController:)
                imagePath: [subArray objectAtIndex:i] ];
        subMenuHeight += KsubHeight;
    }
//    父级 菜单移动
//
 
    for (int i = 0; i < 6; i++) {
        
        UIButton *button = (UIButton *)[menuScrollView viewWithTag:i];

        if (button.tag > currentMenuButton.tag) {
            button.frame = CGRectMake(0, button.frame.origin.y + subMenuHeight,
                                      button.frame.size.width, button.frame.size.height);
        }
        
    }
    
//    调整scrollview 的 content  size
    
    if (menuHeight+subMenuHeight > menuScrollView.contentSize.height) {
        menuScrollView.contentSize = CGSizeMake(150, menuHeight+subMenuHeight);
    }
    else {
        menuScrollView.contentSize = CGSizeMake(150, menuScrollView.contentSize.height+1);
    }


    [menuScrollView scrollRectToVisible:currentMenuButton.frame animated:YES];

//    subHeight
    
}

- (void)openSubMenu:(UIButton *)button
{
    if (currentMenuButton == button) {
        return;
    }
    
    currentMenuButton = button;
    [self openSubMenuForInteger:button.tag];

}


- (void)openViewController:(UIButton *)button
{
    UIViewController *viewController;
    
    switch (button.tag) {
        case 10:
        {
            viewController = [[ZHBrandViewController alloc] init];
            break;
        }
        case 11:
        {
            viewController = [[ZHConstructionViewController alloc] init];
            break;
        }
        case 12:
        {
            viewController = [[ZHProcessViewController alloc] init];
            break;
        }
        case 13:
        {
            viewController = [[ZHProductViewController alloc] init];
            break;
        }
        case 14:
        {
            viewController = [[ZHDepartmentViewController alloc] init];
            break;
        }
        case 15:
        {
            viewController = [[ZHAccessoriesViewController alloc] init];
            break;
        }
    }
    
    
    viewController.view.tag = button.tag;
    [self.view addSubview:viewController.view];
    [UIView animateWithDuration:1 animations:^{
    } completion:^(BOOL finished) {
    }];
    currentViewController = viewController;

    
    [self.view bringSubviewToFront:menuView];
    [self hiddenMenu:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addMemu];
    
    
    ZHLoginViewController *loginViewController = [[ZHLoginViewController alloc] init];
    
    [self.view addSubview:loginViewController.view];
    [UIView animateWithDuration:1 animations:^{
    } completion:^(BOOL finished) {
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
