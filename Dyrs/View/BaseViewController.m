//
//  BaseViewController.m
//  Dyrs
//
//  Created by mbp  on 13-8-22.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController


- (UIImageView *)addSelfView:(UIView *)view imagePathName:(NSString *)imagePathName pathNameType:(NSString *)pathNameType rect:(CGRect)frame
{
    
    NSString  *path1 = [MAINBUNDLE pathForResource:imagePathName ofType:pathNameType];
    
    UIImage* img =  [[UIImage alloc] initWithContentsOfFile:path1];
    
    UIImageView  *imageView= [[[UIImageView alloc] initWithFrame:frame] autorelease];
    imageView.image  = img;
    [img release];
    [view addSubview:imageView];
    
    return  imageView;
}

- (UIImageView *)addSelfView:(UIView *)view imagePathNamePNG:(NSString *)imagePathName rect:(CGRect)frame
{
    return [self addSelfView:view imagePathName:imagePathName pathNameType:@"png" rect:frame];
    
}

- (UIImageView *)addSelfView:(UIView *)view imagePathNameJPG:(NSString *)imagePathName rect:(CGRect)frame
{
    return [self addSelfView:view imagePathName:imagePathName pathNameType:@"jpg" rect:frame];
}



- (UIButton *)addSelfView:(UIView *)view
                     rect:(CGRect)rect
                      tag:(int)tag
                   action:(SEL)action
                imagePath:(NSString *)imagePath
     highlightedImagePath:(NSString *)highlightedImagePath
{
    
    NSString  *path1 = nil;
    NSString  *path2 = nil;
    UIImage* img = nil;
    UIImage* img2 = nil;
    
    
    if (imagePath) {
        path1 = [MAINBUNDLE pathForResource:imagePath ofType:@"png"];
        img =  [[UIImage alloc] initWithContentsOfFile:path1];
    }
    
    if (highlightedImagePath) {
        path2 = [MAINBUNDLE pathForResource:highlightedImagePath ofType:@"png"];
        img2 =  [[UIImage alloc] initWithContentsOfFile:path2];
    }
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (img) {
        [button setImage:img forState:UIControlStateNormal];
        [img  release];
        
    }
    if (img2) {
        [button setImage:img2 forState:UIControlStateHighlighted];
        [img2 release];
    }
    
    
    button.frame = rect;
    button.tag = tag;
    
    [view addSubview:button];
    
    return button;
}




- (UIButton *)addSelfView:(UIView *)view
                     rect:(CGRect)rect
                      tag:(int)tag
                   action:(SEL)action
                imagePath:(NSString *)imagePath
{
    
    
    return [self addSelfView:view rect:rect tag:tag action:action imagePath:imagePath highlightedImagePath:nil];
}




- (UIButton *)addSelfView:(UIView *)view
                     rect:(CGRect)rect
                      tag:(int)tag
                   action:(SEL)action

{
    return [self addSelfView:view rect:rect tag:tag action:action imagePath:nil highlightedImagePath:nil];
}



- (void)addMemu
{
    
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
