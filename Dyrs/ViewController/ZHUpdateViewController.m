//
//  ZHUpdateViewController.m
//  Dyrs
//
//  Created by mbp  on 13-8-13.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "ZHUpdateViewController.h"

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
    DLog(@"%d", downloader.photoRecord.status);
    DLog(@"%@ : %d", downloader.photoRecord.name , [self.pendingOperations.downloadsInProgress count]);

    [self.pendingOperations.downloadsInProgress removeObjectForKey:downloader.photoRecord.name];
    
    
    if ([self.pendingOperations.downloadsInProgress count] == 0) {
        endDate = [NSDate date];
        
        DLog(@"%f", [endDate timeIntervalSinceDate:startDate]);
    }

}


- (void)loadImage
{
    
    
    startDate = [[NSDate alloc] init];
    
    for (int i=0; i < 10; i++) {
        Images *imgs= [[Images alloc] init];
        imgs.url   = [NSString stringWithFormat:@"https://developer.apple.com/home/images/tile-wwdc2013.jpg"];        
        imgs.name = [NSString stringWithFormat:@"img%d", i];
        ImageDownloader *imageDownloader = [[ImageDownloader alloc] initWithPhotoRecord:imgs  delegate:self];
        [self.pendingOperations.downloadsInProgress setObject:imageDownloader forKey:imgs.name];
        [self.pendingOperations.downloadQueue addOperation:imageDownloader];

    }
    
    
    

    
}


- (void)cancelAllOperations {
    [self.pendingOperations.downloadQueue cancelAllOperations];
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
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button3 setTitle:@"解析json" forState:UIControlStateNormal];
    button3.frame = CGRectMake(20, 300, 280, 50);
    [button3 addTarget:self  action:@selector(loadImage) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button3];
}


- (void)viewDidUnload {
    [self setPendingOperations:nil];
    [super viewDidUnload];
}


- (void)didReceiveMemoryWarning {
    [self cancelAllOperations];
    [super didReceiveMemoryWarning];
}



@end
