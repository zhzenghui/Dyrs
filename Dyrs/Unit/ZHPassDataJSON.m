//
//  ZHPassDataJSON.m
//  NetWork
//
//  Created by mbp  on 13-8-9.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "ZHPassDataJSON.h"

#import "ZHdyrsModel.h"


#define FMDBQuickCheck(SomeBool) { if (!(SomeBool)) { NSLog(@"Failure on line %d", __LINE__); abort(); } }


@implementation ZHPassDataJSON

- (id) init
{
    self = [super init];
    if (self)
    {
        NSString *dbPath = [KDocumentDirectory stringByAppendingPathComponent:@"MyDatabase.db"];
        db = [FMDatabase databaseWithPath:dbPath] ;

    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    
    if (![db open]) {
        [db release];
        return;
    }
}



- (void)dictToDB:(NSDictionary *)dict sqlString:(NSString *)sqlString
{
    bool statue =  [db executeUpdate:
                    sqlString withParameterDictionary:dict];
    
    if (statue) {

    }
    else {
        DLog(@"statue:%i error: %@", statue, sqlString);
    }
}


#pragma mark - user

- (void)deleteDict:(NSString *)ID
{
    
    NSMutableString *sqlString = [NSMutableString string];

    sqlString = [NSString stringWithFormat:@"DELETE from user  \
                 WHERE user_id = %@", ID];
    sqlString = [NSString stringWithFormat:@"DELETE from Channel  \
                 WHERE user_id = %@", ID];
    sqlString = [NSString stringWithFormat:@"DELETE from Channel_View  \
                 WHERE user_id = %@", ID];
    sqlString = [NSString stringWithFormat:@"DELETE from Department  \
                 WHERE id = %@", ID];
    sqlString = [NSString stringWithFormat:@"DELETE from Images  \
                 WHERE id = %@", ID];
    sqlString = [NSString stringWithFormat:@"DELETE from values  \
                 WHERE id = %@", ID];
    sqlString = [NSString stringWithFormat:@"DELETE from Member  \
                 WHERE id = %@", ID];
    sqlString = [NSString stringWithFormat:@"DELETE from Cases  \
                 WHERE id = %@", ID];
    sqlString = [NSString stringWithFormat:@"DELETE from Category  \
                 WHERE id = %@", ID];
    sqlString = [NSString stringWithFormat:@"DELETE from Accessories  \
                 WHERE id = %@", ID];
    
}


- (void)deleteUserDictToDB:(NSDictionary *)dict
{
    
}

- (void)updataUserDictToDB:(NSDictionary *)userDict
{
    
    NSMutableString *sqlString = [NSMutableString string];

    sqlString = [NSString stringWithFormat:@"update user set  \
                 user_id=:user_id, name, gender, account, password,\
                 type, create_time, status, dept_id  \
                 \
                 WHERE user_id = :user_id;"];
    
    sqlString = [NSString stringWithFormat:@"update Channel set \
                 channel_id=:channel_id, name=:name, array_order=:array_order,\
                 status=:status, create_time=:create_time \
                 \
                 WHERE user_id = :user_id;"];
    
    sqlString = [NSString stringWithFormat:@"update Channel_View set \
                 user_id=:user_id, channel_id=:channel_id \
                 \
                 WHERE user_id = :user_id;"];
    
    sqlString = [NSString stringWithFormat:@"update Department set  \
                 id=:id, name=:name, info=:info, shop_name=:shop_name,\
                 team_name=:team_name, status=:status, create_time=:create_time \
                 \
                 WHERE id = :id;"];
    
    sqlString = [NSString stringWithFormat:@"update Images set \
                 id=:id, name=:name, url=:url, object_type=:object_type, \
                 object_id=:object_id, status=:status, create_time=:create_time \
                 \
                 WHERE id = :id;"];
    
    sqlString = [NSString stringWithFormat:@"update values set  \
                 id=:id, key_key=:key_key, key_value=:key_value, user_id=:user_id\
                 \
                 WHERE id = :id;"];
    
    sqlString = [NSString stringWithFormat:@"update Member set  \
                 id=:id, name=:name, info=:info, dept_id=:dept_id,  \
                 gender=:gender,type=:type, status=:status, create_time=:create_time \
                 \
                 WHERE id = :id;"];

    sqlString = [NSString stringWithFormat:@"update Cases set  \
                 id=:id, name=:name, info=:info, dept_id=:dept_id, \
                 house_type_id=:house_type_id, house_type_id=:house_type_id,\
                 style_id=:style_id, city_id=:city_id, dept_id=:dept_id, \
                 member_id=:member_id, price=:price, status=:status,\
                 create_time=:create_time \
                 \
                 WHERE id = :id;"];

    sqlString = [NSString stringWithFormat:@"update Category set \
                 id=:id, name=:name, fid=:fid, level=:level, last=:last,\
                  type=:type, status=:status, create_time=:create_time \
                 WHERE id = :id;"];

    sqlString = [NSString stringWithFormat:@"update Accessories set \
                 id=:id, title=:title, info=:info, cate_id=:cate_id,  \
                 status=:status, create_time=:create_time \
                 \
                 WHERE id = :id;"];

    
    [self dictToDB:userDict sqlString:sqlString];

}

- (void)userDictToDB:(NSDictionary *)userDict 
{
    
    NSString *sqlString = nil;
    
    sqlString = [NSString stringWithFormat:@"INSERT INTO user (user_id, name, gender, account, password, type, create_time, status, dept_id) VALUES (:user_id, :name, :gender, :account, :password, :type, :create_time, :status, :dept_id)"];
    sqlString = [NSString stringWithFormat:@"INSERT INTO Channel (channel_id, name, array_order, status, create_time) VALUES (:channel_id, :name, :array_order, :status, :create_time)"];
    sqlString = [NSString stringWithFormat:@"INSERT INTO Channel_View (user_id, channel_id) VALUES (:user_id, :channel_id)"];
    sqlString = [NSString stringWithFormat:@"INSERT INTO Department (id, name, info, shop_name, team_name, status, create_time) VALUES (:id, :name, :info, :shop_name, :team_name, :status, :create_time)"];
    
    
    sqlString = [NSString stringWithFormat:@"INSERT INTO Images (id, name, url, object_type, object_id, status, create_time) VALUES (:id, :name, :url, :object_type, :object_id, :status, :create_time)"];    
    sqlString = [NSString stringWithFormat:@"INSERT INTO values (id, key_key, key_value, user_id) VALUES (:id, :key_key, :key_value, :user_id)"];    
    sqlString = [NSString stringWithFormat:@"INSERT INTO Member (id, name, info, dept_id, gender, type, status, create_time) VALUES (:id, :name, :info, :dept_id, :gender, :type, :status, :create_time)"];
    sqlString = [NSString stringWithFormat:@"INSERT INTO Cases (id, name, info, dept_id, house_type_id, area_id, style_id, city_id, dept_id, member_id, price, status, create_time) VALUES (:id, :name, :info, :dept_id, :house_type_id, :area_id, :style_id, :city_id, :dept_id, :member_id, :price, :status, :create_time)"];    
    sqlString = [NSString stringWithFormat:@"INSERT INTO Category (id, name, fid, level, last, status, create_time) VALUES (:id, :name, :fid, :level, :last, :status, :create_time)"];
    
    sqlString = [NSString stringWithFormat:@"INSERT INTO Accessories (id, title, info, cate_id, status, create_time) VALUES (:id, :title, :info, :cate_id, :status, :create_time)"];
    
    
    [self dictToDB:userDict sqlString:sqlString];
}

- (void)userArrayToDB:(NSArray *)array
{
    
    for (NSDictionary *userDict in array) {
        
        [self userDictToDB:userDict];
    }
}


#pragma mark - data to pass

/*
 默认为 3 未下载， 
 下载完成  2  
 更新完成时， 调用更新所有状态为2（更新未完成）的所有数据
 更新为  0 （正常）  
 */
- (void)dyrsUpdatedStatue
{
 
    NSMutableString *sqlString = [NSMutableString string];
    //  accessories
    [sqlString appendString:@"UPDATE accessories SET status = 0 WHERE status = 2;"];
    //  cases
    [sqlString appendString:@"UPDATE cases SET status = 0 WHERE status = 2;"];
    //  category
    [sqlString appendString:@"UPDATE category SET status = 0 WHERE status = 2;"];
    //  channel
    [sqlString appendString:@"UPDATE channel SET status = 0 WHERE status = 2;"];
    //  channel_view
    [sqlString appendString:@"UPDATE channel_view SET status = 0 WHERE status = 2;"];
    //  department
    [sqlString appendString:@"UPDATE department SET status = 0 WHERE status = 2;"];
    //  images
    [sqlString appendString:@"UPDATE images SET status = 0 WHERE status = 2;"];
    //  user
    [sqlString appendString:@"UPDATE user SET status = 0 WHERE status = 2;"];
    //  values
    [sqlString appendString:@"UPDATE values SET status = 0 WHERE status = 2;"];
    
    
    
    
    
    if (![db open]) {
        DLog (@"Could not open db.");
    }
    else {
        
        [db beginTransaction];
        
        BOOL rc = [db executeUpdate:sqlString];
        
        FMDBQuickCheck(rc);
        
        if (!rc) {
            NSLog(@"ERROR: %d - %@", db.lastErrorCode, db.lastErrorMessage);
        }
        
        [db commit];
        
        [db close];
        
    }
}

- (void)dyrsJsonToDB:(NSDictionary *)jsonDict
{

    if (![db open]) {
        DLog (@"Could not open db.");
    }
    else {
    
        [db beginTransaction];

        
        
        if ([[jsonDict objectForKey:@"table"] isEqualToString:@"user"])
        {

            [self userArrayToDB:[jsonDict objectForKey:@"tabledata"]];        
            
        }
        else if ([[jsonDict objectForKey:@"table"] isEqualToString:@"values"])
        {
            
        }
        
        
        
        [db commit];

        [db close];
        
    }
}
@end
