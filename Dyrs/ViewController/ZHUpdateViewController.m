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
    
    
    if ([self.pendingOperations.downloadsInProgress count] == 0) {
        endDate = [NSDate date];
        
        DLog(@"%f", [endDate timeIntervalSinceDate:startDate]);
    }

}


- (void)loadImage
{

    startDate = [[NSDate alloc] init];
    
    ZHPassDataJSON *dataToJson = [[ZHPassDataJSON alloc] init];

    NSMutableArray *dataArray = [dataToJson getAllUpdateImage ];
    
    [dataToJson release];
    
    textLabel.text = [NSString stringWithFormat:@"%@ %d", @"下载数量 !!!", [dataArray count]];

    for (int i=0; i < dataArray.count; i++) {
        Images *imgs= [dataArray objectAtIndex:i];

        
        ImageDownloader *imageDownloader = [[ImageDownloader alloc] initWithPhotoRecord:imgs  delegate:self];
        [self.pendingOperations.downloadsInProgress setObject:imageDownloader forKey:imgs.name];
        [self.pendingOperations.downloadQueue addOperation:imageDownloader];

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
    textLabel.text = @"pass finish !!!";
    
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

    
    NSString *userString = @"{\"status\": \"100\",\"data\": {\"user\": [{\"sqltype\": \"i\",\"sqldata\": {\"user_id\": 1,\"name\": \"zne\",\"gender\":1,\"account\": \"zhzne\",\"password\": \"123456\",\"type\": 1,\"create_time\": \"2013-8-13\",\"status\": 0,\"dept_id\": 1}}],\"images\": [{\"sqltype\": \"i\",\"sqldata\": {\"id\": 1,\"name\": \"pic1.jpg\",\"url\": \"http://www.baidu.com/img/bdlogo.gif\",\"object_type\": 0,\"object_id\": 0,\"status\": 0,\"create_time\": \"2013-8-13\"}}]}}";

    NSDictionary *statueDict  = (NSDictionary *)[userString objectFromJSONString] ;
    
    
    
    
    if ([[statueDict objectForKey:@"status"] isEqualToString:Statue_success]) {
        
        NSDictionary *dataDict = (NSDictionary *)[statueDict objectForKey:@"data"];
        [self jsonToDB:dataDict];
        
    }
    else {
        
        NSLog(@"返回 statue：  %@ \n", [statueDict objectForKey:@"statue"] );
    }
    
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
    
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"解析json" forState:UIControlStateNormal];
    button.frame = CGRectMake(20, 100, 280, 50);
    [button addTarget:self  action:@selector(parseData:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button3 setTitle:@"加载图片" forState:UIControlStateNormal];
    button3.frame = CGRectMake(20, 300, 280, 50);
    [button3 addTarget:self  action:@selector(loadImage) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    UIImage *image = [UIImage imageWithData:[[ZHFileCache share] file:@"bdlogo.gif"]];

    [button setImage:image forState:UIControlStateNormal];

    [self.view addSubview:button3];

    
    
    
    
    
    textLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 300, 280, 50)];
    textLabel.text = @"状态";
    
    [self.view addSubview:textLabel];
    
    [textLabel release];
    
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
