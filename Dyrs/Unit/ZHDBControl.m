//
//  ZHDBControl.m
//  Dyrs
//
//  Created by mbp  on 13-8-15.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "ZHDBControl.h"
#import "FMDatabase.h"

ZHDBControl *instanceControl;

@implementation ZHDBControl



+ (ZHDBControl *)share
{
    if (instanceControl == nil)
    {
        instanceControl = [[ZHDBControl alloc] init];
    }
    
    return instanceControl;
}


- (void)createTable:(NSString *)sql database:(FMDatabase *)_db
{
    
    //    create table
    if ([_db open]) {
        
        
        NSArray * commands = [sql componentsSeparatedByString:@";"];
        for(NSString * sqlString in commands)
        {
            BOOL res = [_db executeUpdate:sqlString];
            if (!res) {
                DLog(@"error  %@", sqlString);
            } else {
                DLog(@"succ ");
            }
            
        }
        
        [_db close];
    }
    else {
        DLog(@"error when open db");
    }
}


- (BOOL)checkDB
{

    NSString *dbPath = [KDocumentDirectory stringByAppendingPathComponent:@"MyDatabase.db"];
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"dyrs_sqlite" ofType:@"sql"];
    NSString *sqlString = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
    

    if (![[NSFileManager defaultManager] fileExistsAtPath:dbPath]) {
        
        FMDatabase *db = [[FMDatabase alloc ]initWithPath:dbPath] ;
        
        if ([db open]) {
            [self createTable:sqlString database:db];
        }
        DLog(@"create db talbe --- YES");

        return YES;
    }
    else {
        return YES;
    }

    return NO;
}

@end
