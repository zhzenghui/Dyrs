//
//  ZHViewController.m
//  Dyrs
//
//  Created by mbp  on 13-8-12.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "ZHViewController.h"
#import "ZHPassDataJSON.h"
#import "FMDatabase.h"


@interface ZHViewController ()

@end

@implementation ZHViewController


- (void)db
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"MyDatabase.db"];
    
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath] ;
    if (![db open]) {
        NSLog(@"Could not open db.");
        return ;
    }

}


- (void)jsonToDB:(NSDictionary *)dataDict
{
    
    [self db];
    ZHPassDataJSON *dataToJson = [[ZHPassDataJSON alloc] init];
    
    [dataToJson dyrsJsonToDB:dataDict];
    [dataToJson release];
}


- (void)parseData:(UIButton *)button
{
    
    
    
    NSString *userString = @"{\"status\":\"100\",  \"data\":{\"table\":\"user\", \"tabledata\":[{\"user_id\":1, \"name\":\"zne\", \"gender\":1, \"account\":\"zhzne\", \"password\":\"123456\", \"type\":1, \"create_time\":\"2013-8-13\", \"status\":0, \"dept_id\":1}]}}";
//    id, name, info, shop_name, team_name, status, create_time
    NSDictionary *statueDict  = (NSDictionary *)[userString objectFromJSONString] ;


    
    
    if ([[statueDict objectForKey:@"status"] isEqualToString:Statue_success]) {
        
        NSDictionary *dataDict = (NSDictionary *)[statueDict objectForKey:@"data"];
        [self jsonToDB:dataDict];
        
    }
    else {
        
        NSLog(@"返回 statue：  %@ \n", [statueDict objectForKey:@"statue"] );
    }
    
}



#pragma mark    - view cycle
- (void)viewDidLoad
{
    [super viewDidLoad];


    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button3 setTitle:@"解析json" forState:UIControlStateNormal];
    button3.frame = CGRectMake(20, 300, 280, 50);
    [button3 addTarget:self  action:@selector(parseData:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button3];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
