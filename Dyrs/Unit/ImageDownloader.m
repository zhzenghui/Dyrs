//
//  ImageDownloader.m
//  ClassicPhotos
//
//  Created by Soheil M. Azarpour on 8/11/12.
//  Copyright (c) 2012 iOS Developer. All rights reserved.
//

#import "ImageDownloader.h"
#import "ZHFileCache.h"


// 1: Declare a private interface, so you can change the attributes of instance variables to read-write.
@interface ImageDownloader ()
@property (nonatomic, readwrite, strong) NSIndexPath *indexPathInTableView;
@property (nonatomic, readwrite, strong) Images *imageRecord;
@property (nonatomic, readwrite, strong) Picture *pictureRecord;

@end


@implementation ImageDownloader
@synthesize delegate = _delegate;
@synthesize imageRecord = _imageRecord;

#pragma mark -
#pragma mark - Life Cycle

- (id)initWithPhotoRecord:(Images *)record  delegate:(id<ImageDownloaderDelegate>)theDelegate {
    
    if (self = [super init]) {
        // 2: Set the properties.
        self.delegate = theDelegate;
        self.imageRecord = record;
    }
    return self;
}


- (id)initWithPictureRecord:(Picture *)record  delegate:(id<ImageDownloaderDelegate>)theDelegate {
    
    if (self = [super init]) {
        // 2: Set the properties.
        self.delegate = theDelegate;
        self.pictureRecord = record;
    }
    return self;
}


- (void)haroFinish:(NSData *)data picture:(Picture *)picture
{
    
    ZHFileCache *zfc = [[ZHFileCache alloc] init];
    
    [zfc saveFile:data fileName:picture.name];
    
    
    [zfc release];
}

- (void)dyrsFinish:(NSData *)data image:(Images *)image
{
    self.imageRecord.status = 2;
    
    
    ZHFileCache *zfc = [[ZHFileCache alloc] init];
    
    [zfc saveFile:data image:self.imageRecord];
    
    
    [zfc release];
    
}

#pragma mark -
#pragma mark - Downloading image

// 3: Regularly check for isCancelled, to make sure the operation terminates as soon as possible.
- (void)main {
    
    // 4: Apple recommends using @autoreleasepool block instead of alloc and init NSAutoreleasePool, because blocks are more efficient. You might use NSAuoreleasePool instead and that would be fine.
    @autoreleasepool {
        
        if (self.isCancelled)
            return;
        
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString: self.imageRecord.url]];
        
        if (self.isCancelled) {
            imageData = nil;
            return;
        }
        
        if (imageData) {
    
            if (KisHaro) {
                [self haroFinish:imageData picture:self.pictureRecord];

            }
            else if (KisDyrs) {

                [self dyrsFinish:imageData image:self.imageRecord];

            }
            
        }
        else {
            
        }
        
        [imageData release];
        imageData = nil;
        
        if (self.isCancelled)
            return;
        
        // 5: Cast the operation to NSObject, and notify the caller on the main thread.
        [(NSObject *)self.delegate performSelectorOnMainThread:@selector(imageDownloaderDidFinish:) withObject:self waitUntilDone:NO];
        
    }
}

@end


