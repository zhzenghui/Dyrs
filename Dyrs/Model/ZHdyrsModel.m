//
//  ZHdyrsModel.m
//  NetWork
//
//  Created by mbp  on 13-8-9.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "ZHdyrsModel.h"



#pragma mark - Channel

@implementation Channel
@synthesize channel_id;
@synthesize name;
@synthesize array_order;
@synthesize status;
@synthesize create_time;

- (void)dealloc
{

    [name release];
    [super dealloc];
}
@end


#pragma mark - Channel

@implementation ChannelView
@synthesize user_id;
@synthesize channel_id;

- (void)dealloc
{
    [super dealloc ];
}
@end

#pragma mark - Department

@implementation Department
@synthesize ID;
@synthesize name;
@synthesize info;
@synthesize shop_name;
@synthesize team_name;
@synthesize status;
@synthesize create_time;



- (void)dealloc
{
    [name release];
    [info     release];
    [shop_name release];
    [team_name release];
    [create_time release];
    
    [super dealloc ];
}
@end


#pragma mark - Users

@implementation User
@synthesize user_id;
@synthesize gender;
@synthesize name;
@synthesize account;
@synthesize password;
@synthesize type;
@synthesize dept_id;

@synthesize status;
@synthesize create_time;

@synthesize expiredDate;



- (void)dealloc
{

    [name release];
    [account release];
    [password release];

    [create_time release];
    [expiredDate release];
    
    [super dealloc];
}

@end




#pragma mark - images

@implementation Images
@synthesize ID;
@synthesize name;
@synthesize url ;
@synthesize object_type;
@synthesize object_id;
@synthesize status;
@synthesize create_time;


- (void)dealloc
{
    [name release];
    [url  release];
    [create_time release];
    
    [super dealloc ];
}
@end

#pragma mark - setting

@implementation values
@synthesize ID;
@synthesize key_key;
@synthesize key_value;
@synthesize user_id;



- (void)dealloc
{
    [key_key  release];
    [key_value release];
    [super dealloc ];
}
@end

#pragma mark - personnel

@implementation Member
@synthesize ID;
@synthesize name;
@synthesize info;
@synthesize dept_id;
@synthesize gender;
@synthesize type;
@synthesize status;
@synthesize create_time;


- (void)dealloc
{
    [name release];
    [info     release];
    [create_time release];
    
    [super dealloc ];
}
@end

#pragma mark - cases

@implementation Cases
@synthesize ID;
@synthesize info;
@synthesize name;
@synthesize house_type_id;
@synthesize area_id;
@synthesize style_id;
@synthesize city_id;
@synthesize dept_id;
@synthesize member_id;
@synthesize price;
@synthesize status;
@synthesize create_time;

- (void)dealloc
{
    [info     release];
    [name release];
    [create_time release];
    
    [super dealloc ];
}
@end

#pragma mark - accessories

@implementation Category1
@synthesize ID;
@synthesize name;
@synthesize fid;
@synthesize level;
@synthesize last;
@synthesize status;
@synthesize create_time;



- (void)dealloc
{
    [name release];
    [create_time release];
    [super dealloc ];
}
@end

#pragma mark - accessories_detail

@implementation Accessories

@synthesize ID;
@synthesize title;
@synthesize info;
@synthesize cate_id;
@synthesize status;
@synthesize create_time;


- (void)dealloc
{
    [title release];
    [info release];
    [create_time release];
    
    [super dealloc ];
}

@end





@implementation ZHdyrsModel


- (void)dealloc
{
    [super dealloc ];
}
@end
