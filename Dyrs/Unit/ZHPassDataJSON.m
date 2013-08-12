//
//  ZHPassDataJSON.m
//  NetWork
//
//  Created by mbp  on 13-8-9.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "ZHPassDataJSON.h"

#import "ZHdyrsModel.h"



@implementation ZHPassDataJSON


#pragma mark - user

- (void)userDictToDB:(NSDictionary *)userDict
{
//      dict   to   sql   db
    
    
}

- (void)userArrayToDB:(NSArray *)array
{
    for (NSDictionary *userDict in array) {
        
        [self userDictToDB:userDict];
    }
}


#pragma mark - data to pass


- (void)dyrsJsonToDB:(NSDictionary *)jsonDict
{
    
    
    
    if ([[jsonDict objectForKey:@"table"] isEqualToString:@"user"])
    {
        
        [self userArrayToDB:[jsonDict objectForKey:@"tabledata"]];
        
    }
    else if ([[jsonDict objectForKey:@"table"] isEqualToString:@"setting"])
    {
        
    }
    
    
}
@end
