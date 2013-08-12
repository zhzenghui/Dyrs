//
//  ZHdyrsModel.m
//  NetWork
//
//  Created by mbp  on 13-8-9.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "ZHdyrsModel.h"






#pragma mark - Department

@implementation Department



@end


#pragma mark - Users

@implementation User
@synthesize ID;
//@synthesize full_name;
//@synthesize role_id;
//@synthesize department_id;
@synthesize status;
@synthesize created_at;

@synthesize expiredDate;



- (void)dealloc
{
    [ID release];
//    [full_name release];
//    [role_id release];
//    [department_id release];
    [created_at release];
    
    
    [super dealloc];
}

@end




#pragma mark - images

@implementation Images

@end

#pragma mark - setting

@implementation Setting

@end

#pragma mark - personnel

@implementation Personnel

@end

#pragma mark - cases

@implementation Cases

@end

#pragma mark - accessories

@implementation Accessories

@end

#pragma mark - accessories_detail

@implementation Accessories_detail

@end





@implementation ZHdyrsModel

@end
