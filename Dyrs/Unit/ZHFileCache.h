//
//  ZHFileCache.h
//  Dyrs
//
//  Created by mbp  on 13-8-15.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHFileCache : NSObject
{
    
    NSArray *pathsArray;
    NSString *diskCachePath;

    
}


- (void)saveFile;

+ (ZHFileCache *)share;



@end
