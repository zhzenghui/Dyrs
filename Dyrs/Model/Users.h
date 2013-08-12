//
//  User.h
//  NetWork
//
//  Created by mbp  on 13-8-2.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Users : NSObject

@property(nonatomic, retain) NSString *ID;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *email;
@property(nonatomic, retain) NSString *content;
@property(nonatomic, retain) NSString *role;
@property(nonatomic, retain) NSString *created_at;
@property(nonatomic, retain) NSString *updated_at;
@property(nonatomic, retain) NSString *expiredDate;

+ (id)share;


- (void)jsonToUser;

- (void)insertUser;

- (void)updateUser:(NSString *)userID;

- (void)deleteUser:(NSString *)userID;


- (NSDictionary *)userToDict:(Users *)user;
- (Users *)dictToUser:(NSDictionary *)userDict;


- (void)saveCurrentUser:(NSDictionary *)userDict;
- (void)deleteCurrentUser:(NSDictionary *)userDict;


@end
