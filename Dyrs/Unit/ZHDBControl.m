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
                DLog(@"error===========  %@", sqlString);
            } else {
                DLog(@"succ ");
            }
            
        }
        
        [_db close];
    }
    else {
        DLog(@"error=========== when open db");
    }
}


- (BOOL)checkDB
{

    NSString *projectName = nil;
    NSString *file  = nil;
    
    if ([KProjectNameHaro isEqualToString:@"haro"]) {
        projectName = [NSString stringWithFormat:@"haro.db"];
        file = [NSString stringWithFormat:@"haro_sqlite-sql"];
    }
    else {
        projectName = [NSString stringWithFormat:@"dyrs.db"];
        file = [NSString stringWithFormat:@"dyrs_sqlite"];
    }
    
    
    NSString *dbPath = [KDocumentDirectory stringByAppendingPathComponent:projectName];


    if (![[NSFileManager defaultManager] fileExistsAtPath:dbPath]) {
        NSString *fileName = [[NSBundle mainBundle] pathForResource:file ofType:@"sql"];
        NSString *sqlString = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
        
        FMDatabase *db = [[[FMDatabase alloc ]initWithPath:dbPath] autorelease];
        
        if ([db open]) {
            [self createTable:sqlString database:db];
        }
        
        
        [sqlString release];

        DLog(@"create db talbe --- YES");

        return YES;
    }
    else {

        return YES;
    }

    return NO;
}

@end
