//
//  ZHUpdateViewController.h
//  Dyrs
//
//  Created by mbp  on 13-8-13.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AFNetworking.h"



#import "PendingOperations.h"
#import "ImageDownloader.h"
#import "ZHPassDataJSON.h"


@interface ZHUpdateViewController : BaseViewController<ImageDownloaderDelegate, ZHPassDataJSONDelegate>
{
    NSDate *startDate ;
    NSDate *endDate;
    
    UILabel *textLabel;
    UILabel *fileNumTextLabel;

    BOOL isForceUpdate;
    
    
    
}


@property (nonatomic, strong) PendingOperations *pendingOperations;



@end
