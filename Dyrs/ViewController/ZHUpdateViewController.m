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



- (void)imageDownloaderDidFinish:(ImageDownloader *)downloader
{
    
}


- (void)loadImage
{
    
    
    Images *imgs= [[Images alloc] init];
    
    ImageDownloader *imageDownloader = [[ImageDownloader alloc] initWithPhotoRecord:imgs  delegate:self];
    
    
    
    
    [self.pendingOperations.downloadsInProgress setObject:imageDownloader forKey:imgs.name];
    
    [self.pendingOperations.downloadQueue addOperation:imageDownloader];
    
    
    
    
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
