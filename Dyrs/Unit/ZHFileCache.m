//
//  ZHFileCache.m
//  Dyrs
//
//  Created by mbp  on 13-8-15.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//


#define SDWIRetain(__v) ([__v retain]);
#define SDWIReturnRetained SDWIRetain

#define SDWIRelease(__v) ([__v release]);
#define SDWISafeRelease(__v) ([__v release], __v = nil);
#define SDWISuperDealoc [super dealloc];


#import "ZHFileCache.h"

ZHFileCache *instance;

@implementation ZHFileCache


#pragma mark SDImageCache (class methods)

+ (ZHFileCache *)share
{
    if (instance == nil)
    {
        instance = [[ZHFileCache alloc] init];
    }
    
    return instance;
}


- (void)saveFile
{
    
}

- (id)init
{
    if ((self = [super init]))
    {
        // Init the disk cache
        diskCachePath = SDWIReturnRetained([KDocumentDirectory stringByAppendingPathComponent:@"/files"]);
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:diskCachePath])
        {
            [[NSFileManager defaultManager] createDirectoryAtPath:diskCachePath
                                      withIntermediateDirectories:YES
                                                       attributes:nil
                                                            error:NULL];
        }
    }
    
    return self;
}


@end
