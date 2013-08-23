//
//  BaseViewController.h
//  Dyrs
//
//  Created by mbp  on 13-8-22.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController



- (UIImageView *)addSelfView:(UIView *)view imagePathNamePNG:(NSString *)imagePathName rect:(CGRect)frame;
- (UIImageView *)addSelfView:(UIView *)view imagePathNameJPG:(NSString *)imagePathName rect:(CGRect)frame;

- (UIButton *)addSelfView:(UIView *)view
                     rect:(CGRect)rect
                      tag:(int)tag
                   action:(SEL)action
                imagePath:(NSString *)imagePath
     highlightedImagePath:(NSString *)highlightedImagePath;
- (UIButton *)addSelfView:(UIView *)view
                     rect:(CGRect)rect
                      tag:(int)tag
                   action:(SEL)action
                imagePath:(NSString *)imagePath;
- (UIButton *)addSelfView:(UIView *)view
                     rect:(CGRect)rect
                      tag:(int)tag
                   action:(SEL)action;


- (void)addMemu;

@end
