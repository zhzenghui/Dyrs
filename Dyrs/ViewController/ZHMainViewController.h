//
//  ZHMainViewController.h
//  NetWork
//
//  Created by zeng hui on 13-8-3.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

typedef NS_ENUM(NSInteger, MenuStatus) {
    menuStatus_show = 0,
    menuStatus_hidden 
};

#import <UIKit/UIKit.h>


@interface ZHMainViewController : BaseViewController
{
    UIView *menuView;
    
    UIButton *sHButton;
    MenuStatus menuStatus ;
    
    UIViewController    * currentViewController;

}
@end
