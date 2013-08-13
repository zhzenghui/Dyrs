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


- (void)userDictToDB:(NSDictionary *)userDict
{
    
    NSString *sqlString = nil;
    
    sqlString = [NSString stringWithFormat:@"INSERT INTO user (user_id, name, gender, account, password, type, create_time, status, dept_id) VALUES (:user_id, :name, :gender, :account, :password, :type, :create_time, :status, :dept_id)"];
    
    

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
 更新完成时， 调用更新所有 状态为2（更新未完成）的所有数据 
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
        else if ([[jsonDict objectForKey:@"table"] isEqualToString:@"setting"])
        {
            
        }
        
        
        
        [db commit];

        [db close];
        
    }
}
@end
