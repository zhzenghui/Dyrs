//
//  ZHFileCache.h
//  Dyrs
//
//  Created by mbp  on 13-8-15.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Images;
@interface ZHFileCache : NSObject
{
    
    NSArray *pathsArray;
    NSString *diskCachePath;

    
}


- (void)saveFile:(NSData *)data image:(Images *)image;
- (void)saveFile:(NSData *)data fileName:(NSString *)fileName;

- (id)file:(NSString *)fileName;

+ (ZHFileCache *)share;



@end
