//
//  ZHUpdateViewController.m
//  Dyrs
//
//  Created by mbp  on 13-8-13.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "ZHUpdateViewController.h"
#import "FMDatabase.h"
#import "ZHFileCache.h"

@interface ZHUpdateViewController ()

@end

@implementation ZHUpdateViewController


- (PendingOperations *)pendingOperations {
    if (!_pendingOperations) {
    _pendingOperations = [[PendingOperations alloc] init];
    }
    return _pendingOperations;
}



- (void)imageDownloaderDidFinish:(ImageDownloader *)downloader
{
    DLog(@"%@ : %d", downloader.imageRecord.name , [self.pendingOperations.downloadsInProgress count]);

    [self.pendingOperations.downloadsInProgress removeObjectForKey:downloader.imageRecord.name];
    
    
    
    fileNumTextLabel.text = [NSString stringWithFormat:@"已下载：%d", [self.pendingOperations.downloadsInProgress count]];
    

    if ([self.pendingOperations.downloadsInProgress count] == 0) {
        endDate = [NSDate date];
        
        DLog(@"%f", [endDate timeIntervalSinceDate:startDate]);
        textLabel.text = [NSString stringWithFormat:@"更新完成！"];
        fileNumTextLabel.text = [NSString stringWithFormat:@""];
        
    }

}


- (void)loadImage
{

    startDate = [[NSDate alloc] init];
    
    ZHPassDataJSON *dataToJson = [[ZHPassDataJSON alloc] init];

    NSMutableArray *dataArray = [dataToJson getAllUpdateImage ];
    
    [dataToJson release];
    
    
    if ([dataArray count] == 0) {
        textLabel.text = [NSString stringWithFormat:@"更新完成！"];
        fileNumTextLabel.text = [NSString stringWithFormat:@""];
        
    }
    else {
       
    
        textLabel.text = [NSString stringWithFormat:@"第二步：下载文件数据！%@ %d", @"下载数量：", [dataArray count]];

        for (int i=0; i < dataArray.count; i++) {
            Images *imgs= [dataArray objectAtIndex:i];

            
            ImageDownloader *imageDownloader = [[ImageDownloader alloc] initWithPhotoRecord:imgs  delegate:self];
            [self.pendingOperations.downloadsInProgress setObject:imageDownloader forKey:imgs.name];
            [self.pendingOperations.downloadQueue addOperation:imageDownloader];
        }
    }
    

}


- (void)cancelAllOperations {
    [self.pendingOperations.downloadQueue cancelAllOperations];
}


- (void)db
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"dyrs.db"];
    
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath] ;
    if (![db open]) {
        NSLog(@"Could not open db.");
        return ;
    }
    
}


- (void)passDidFinish:(NSDictionary *)jsonDict
{
    NSLog(@"pass finish !!!");
//    textLabel.text = @"pass finish !!!";
    textLabel.text = @"第二步：下载文件数据！";

    [self loadImage];
}



- (void)jsonToDB:(NSDictionary *)dataDict
{
    
    ZHPassDataJSON *dataToJson = [[ZHPassDataJSON alloc] init];
    dataToJson.delegate = self;
    [dataToJson jsonToDB:dataDict];
    [dataToJson release];
    
}


- (void)parseData:(UIButton *)button
{

    NSURL *url = [NSURL URLWithString:@"http://192.168.1.114:8080/"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"1", @"v",
                            nil];
    
    [httpClient postPath:@"/HaroAdmin/update" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        


        NSString*jsonString = [[NSString alloc]initWithBytes:[responseObject bytes]length:[responseObject length] encoding:NSUTF8StringEncoding];
        NSDictionary *statueDict  = [jsonString objectFromJSONString] ;


        if ([[[statueDict objectForKey:@"status"] stringValue]isEqualToString:Statue_success]) {

            NSDictionary *dataDict = (NSDictionary *)[statueDict objectForKey:@"data"];
            NSLog(@"%@", [[[dataDict objectForKey:@"product"] objectAtIndex:0] objectForKey:@"series"]);

            textLabel.text = @"第一步：更新数据完成！";
            [self jsonToDB:dataDict];
            
            
            
        }

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"[HTTPClient Error]: %@", error.localizedDescription);
        
    }];
    
    
    
    
//    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
//        
//        
//        
//        
//        
//        
//
//        
//    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
//
//
//        NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//        NSString*   temp = [[NSString alloc] init];
//
//        NSDictionary *statueDict  = [temp objectFromJSONString] ;
//
//        
//        if ([[[statueDict objectForKey:@"status"] stringValue]isEqualToString:Statue_success]) {
//            
//            NSDictionary *dataDict = (NSDictionary *)[statueDict objectForKey:@"data"];
//            NSLog(@"%@", [[[dataDict objectForKey:@"product"] objectAtIndex:0] objectForKey:@"series"]);
//            
//            textLabel.text = [[[dataDict objectForKey:@"product"] objectAtIndex:0] objectForKey:@"series"];
//            [self jsonToDB:dataDict];
//            
////            NSArray *a;
////            a objectAtIndex
//
//
//        }
//        else {
//            
//            NSLog(@"返回 statue：  %@ \n", [statueDict objectForKey:@"statue"] );
//        }
//
//    }];
//    
//    [operation start];
    
    
}



- (void)loginSuccess
{
    [self.view.superview removeFromSuperview];
}

#pragma - view cycle

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    textLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 300, 280, 50)];
    textLabel.text = @"状态";
    
    [self.view addSubview:textLabel];
    
    [textLabel release];
    
    
    fileNumTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 350, 280, 50)];
    fileNumTextLabel.text = @"状态";
    
    [self.view addSubview:fileNumTextLabel];
    
    [fileNumTextLabel release];
    

    
    if ([[KNSUserDefaults objectForKey:KCurrentUser_version] isEqualToString:@"0"]) {
        isForceUpdate = YES;
        
        textLabel.text = @"首次更新无法跳过，请耐心等待！";
    }
    else {
        isForceUpdate = NO;
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:@"quxiao" forState:UIControlStateNormal];
        button.frame = CGRectMake(20, 100, 280, 50);
        [button addTarget:self  action:@selector(loginSuccess) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];

        
    }
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button setTitle:@"解析json" forState:UIControlStateNormal];
//    button.frame = CGRectMake(20, 100, 280, 50);
//    [button addTarget:self  action:@selector(parseData:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:button];
//    
//    
//    
//    
//    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button3 setTitle:@"加载图片" forState:UIControlStateNormal];
//    button3.frame = CGRectMake(20, 300, 280, 50);
//    [button3 addTarget:self  action:@selector(loadImage) forControlEvents:UIControlEventTouchUpInside];
//    
    
    
    
    
//    UIImage *image = [UIImage imageWithData:[[ZHFileCache share] file:@"bdlogo.gif"]];
//
//    [button setImage:image forState:UIControlStateNormal];
//
//    [self.view addSubview:button3];
//
    
    
    
    
    

    
}


- (void)viewDidUnload {
    [self setPendingOperations:nil];
    [super viewDidUnload];
}


- (void)didReceiveMemoryWarning {
    [self cancelAllOperations];
    [super didReceiveMemoryWarning];
}


- (void)dealloc
{
    [super dealloc];
    
    
    [textLabel release];
    [startDate release];
}


@end
