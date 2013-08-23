//
//  ZHLoginViewController.m
//  Dyrs
//
//  Created by mbp  on 13-8-23.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "ZHLoginViewController.h"
#import "AFHTTPClient.h"
#import "ZHUpdateViewController.h"

@interface ZHLoginViewController ()

@end

@implementation ZHLoginViewController

- (void)openUpdateViewController
{
    ZHUpdateViewController *updateViewController = [[ZHUpdateViewController alloc] init];
    
    [self.view addSubview:updateViewController.view];
    [self addChildViewController:updateViewController];
    
    [updateViewController release];
    
}

- (void)loginSuccess:(id)responseObject
{
    
    /*
     过期设置
     
     */
    NSMutableDictionary *userDict = [[responseObject objectFromJSONData] objectForKey:@"data"];
    
    
    //                 保存用户信息
    
    [[Users share] saveCurrentUser:userDict];
    
    //                 登陆成功调用
    [self openUpdateViewController];
}

- (IBAction)login:(id)sender
{
//    http://192.168.1.114:8080/HaroAdmin/user/login?username=admin&password=123456
//    username=admin&password=123456
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wshadow-ivar"
    __block NSString *userNameString = [[NSString alloc] initWithFormat:@"%@", _userNameTextField.text];
    __block NSString *userPwdString = [[NSString alloc] initWithFormat:@"%@", _passwordTextField.text ];
#pragma clang diagnostic pop
    
    dispatch_queue_t myQueue = dispatch_queue_create("com.mycompany.myqueue", 0);
    
    dispatch_async(myQueue, ^{
        
        
        
        if ([[NetWork shareNetWork] CheckNetwork]) {
            NSLog(@"connection yes");
        }
        else {
            NSLog(@"connection NO");
            [[Message share] messageAlert:@"请检查网络"];
        }
        
        
        
        NSURL *url = [NSURL URLWithString:@"http://192.168.1.114:8080"];
        AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
        
        NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                                userNameString, @"username",
                                userPwdString, @"password",
                                nil];
        
        [httpClient postPath:@"/HaroAdmin/user/login" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"Request Successful, response '%@'", responseStr);
            NSDictionary *responseDict = [responseStr objectFromJSONString];

            if ( [[[responseDict objectForKey:@"status"] stringValue] isEqualToString:@"100"]) {
                DLog(@"登陆成功！");
                

                
                [self loginSuccess:responseObject];
                
            }
            else {
                
                DLog(@"发生错误， 返回的数据：%@",  responseStr);
                [[Message share] messageAlert: [responseDict objectForKey:@"msg"]];
            }
            
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"[HTTPClient Error]: %@", error.localizedDescription);
            
        }];
        
    });
    
    dispatch_release(myQueue);
    



    
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
	// Do any additional setup after loading the view.
    
//    self.view .alpha = .8;
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_userNameTextField release];
    [_passwordTextField release];
    [super dealloc];
}

@end
