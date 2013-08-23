//
//  User.m
//  NetWork
//
//  Created by mbp  on 13-8-2.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "Users.h"

static Users *user;

@implementation Users

@synthesize ID;
@synthesize name;
@synthesize email;
@synthesize content;
@synthesize role;
@synthesize version;
@synthesize created_at;
@synthesize updated_at;
@synthesize expiredDate;

+ (id)share
{
    if (user) {
        return user;
    }
    user = [[Users alloc] init];


    return user;
}

- (id) init
{
    self = [super init];
    if (self)
    {
        [self reloadUserInfo];
    }
    return self;
}

- (Users *)reloadUserInfo
{
    if ([KNSUserDefaults objectForKey:KCurrentUser]) {
        NSDictionary *userDict = [KNSUserDefaults objectForKey:KCurrentUser];
        [self dictToUser:userDict];
    }
    
    return self;
}

- (void)dealloc
{
    [ID release];
    [name release];
    [email release];
    [content release];
    [role release];
    [created_at release];
    [updated_at release];
    [version release];
    
    [super dealloc];
}


- (void)jsonToUser
{
    
}

- (void)insertUser
{

}

- (void)updateUser:(NSString *)userID
{
    
}

- (void)deleteUser:(NSString *)userID
{
    
}


- (NSDictionary *)userToDict:(Users *)user
{
    NSMutableDictionary  *userDict = [NSMutableDictionary dictionary];
    
    
    
    return userDict;
}


- (Users *)dictToUser:(NSDictionary *)userDict
{

    self.ID = [userDict objectForKey:@"user_id"];
    self.name = [userDict objectForKey:@"name"];
    self.version = [userDict objectForKey:@"version"];
//    self.email = [userDict objectForKey:@"email"];
//    self.role = [userDict objectForKey:@"role"];
//    self.content = [userDict objectForKey:@"content"];
//    self.created_at = [userDict objectForKey:@"created_at"];
//    self.updated_at = [userDict objectForKey:@"updated_at"];
//    self.expiredDate = [userDict objectForKey:@"expiredDate"];
    
    return self;
}


- (NSMutableDictionary *)currentUser
{
    
    return [KNSUserDefaults objectForKey:KCurrentUser];
}

- (void)saveCurrentUser:(NSMutableDictionary *)userDict
{
    

    if (KisHaro) {
        [userDict setValue:[NSDate date] forKey:@"expiredDate"];
    }

    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:userDict];

    if ( ! [dict objectForKey:KCurrentUser_version]) {
        [dict setValue:@"0" forKey:KCurrentUser_version];
    }

    
    [KNSUserDefaults setValue:dict forKey:[dict objectForKey:@"name"]];
    [KNSUserDefaults setValue:dict forKey:KCurrentUser];
    
    [self reloadUserInfo];
}

- (void)deleteCurrentUser:(NSDictionary *)userDict
{
    [KNSUserDefaults setValue:nil forKey:[userDict objectForKey:@"name"]];
    [KNSUserDefaults setValue:nil forKey:KCurrentUser];
}

@end
