//
//  ZHPassDataJSON.h
//  NetWork
//
//  Created by mbp  on 13-8-9.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"



@interface ZHPassDataJSON : NSObject
{
    FMDatabase *db;
}
- (void)dyrsJsonToDB:(NSDictionary *)jsonDict;

@end
