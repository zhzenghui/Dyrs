//
//  ImageDownloader.m
//  ClassicPhotos
//
//  Created by Soheil M. Azarpour on 8/11/12.
//  Copyright (c) 2012 iOS Developer. All rights reserved.
//

#import "ImageDownloader.h"


// 1: Declare a private interface, so you can change the attributes of instance variables to read-write.
@interface ImageDownloader ()
@property (nonatomic, readwrite, strong) NSIndexPath *indexPathInTableView;
@property (nonatomic, readwrite, strong) Images *photoRecord;
@end


@implementation ImageDownloader
@synthesize delegate = _delegate;
@synthesize photoRecord = _photoRecord;

#pragma mark -
#pragma mark - Life Cycle

- (id)initWithPhotoRecord:(Images *)record  delegate:(id<ImageDownloaderDelegate>)theDelegate {
    
    if (self = [super init]) {
        // 2: Set the properties.
        self.delegate = theDelegate;
        self.photoRecord = record;
    }
    return self;
}

#pragma mark -
#pragma mark - Downloading image

// 3: Regularly check for isCancelled, to make sure the operation terminates as soon as possible.
- (void)main {
    
    // 4: Apple recommends using @autoreleasepool block instead of alloc and init NSAutoreleasePool, because blocks are more efficient. You might use NSAuoreleasePool instead and that would be fine.
    @autoreleasepool {
        
        if (self.isCancelled)
            return;
        
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString: self.photoRecord.url]];
        
        if (self.isCancelled) {
            imageData = nil;
            return;
        }
        
        if (imageData) {
            self.photoRecord.status = 2;
//            UIImage *downloadedImage = [UIImage imageWithData:imageData];
            
//            1.存储到本地
            
//            2.更新数据库
            
//            self.photoRecord.image = downloadedImage;
        }
        else {
//            self.photoRecord.failed = YES;
        }
        
        imageData = nil;
        
        if (self.isCancelled)
            return;
        
        // 5: Cast the operation to NSObject, and notify the caller on the main thread.
        [(NSObject *)self.delegate performSelectorOnMainThread:@selector(imageDownloaderDidFinish:) withObject:self waitUntilDone:NO];
        
    }
}

@end


