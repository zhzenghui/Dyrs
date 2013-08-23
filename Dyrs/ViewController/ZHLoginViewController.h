//
//  ZHLoginViewController.h
//  Dyrs
//
//  Created by mbp  on 13-8-23.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHLoginViewController : BaseViewController
@property (retain, nonatomic) IBOutlet UITextField *userNameTextField;
@property (retain, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)login:(id)sender;
@end
