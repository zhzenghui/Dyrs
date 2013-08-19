//
//  ZHaroModel.m
//  Dyrs
//
//  Created by mbp  on 13-8-19.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//



//#ifdef KProjectNameHaro

#import "ZHaroModel.h"



#pragma mark - Product

@implementation Product



- (void)dealloc
{
    
    [_series release];
    [_no release];
    [_info_en release];
    [_info_cn release];
    
    [_standard release];
    [_wood release];
    [_process release];
    [_deal release];
    [_level release];
    
    
    [super dealloc];
}
@end


#pragma mark - Product

@implementation CategoryHaro


- (void)dealloc
{
    
    [_name release];
    [super dealloc];
}

@end

#pragma mark - Picture

@implementation Picture

- (void)dealloc
{
    
    [_name release];
    [_text release];
    [super dealloc];
}

@end

#pragma mark - Scene

@implementation Scene

- (void)dealloc
{
    
    [_name release];
    [super dealloc];
}

@end

#pragma mark - Layer

@implementation Layer

- (void)dealloc
{
    
    [_name release];
    [super dealloc];
}

@end


#pragma mark - Content

@implementation Content

- (void)dealloc
{
    
    [_name release];
    [_dir release];
    
    [super dealloc];
}

@end


#pragma mark - Custom

@implementation Custom

- (void)dealloc
{
    
    [_name release];
    [_tel release];
    [_address release];

    [_remark release];
    [_time release];
    [_budget release];

    [super dealloc];
}

@end


#pragma mark - UserHaro

@implementation UserHaro

- (void)dealloc
{
    
    [_name release];
    [_email release];
    [_password release];
    
    [super dealloc];
}

@end


#pragma mark - User

@implementation Favorite

- (void)dealloc
{
    
    
    [super dealloc];
}

@end


@implementation ZHaroModel

@end


//#endif