//
//  ZHPassDataJSON.h
//  NetWork
//
//  Created by mbp  on 13-8-9.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//


typedef enum {
//    dyrs
    AccessoriesTable     = -1,
    CasesTable           = 1,
    CategoryTable        = 2,
    ChannelTable         = 3,
    Channel_viewTable    = 4,
    DepartmentTable      = 5,
    ImagesTable          = 6,
    MemberTable          = 7,
    UserTable            = 8,
    ValuesTable          = 9,
    
//    haro
    CategoryHaroTable,
    ContentTable,
    CustomTable,
    DistrictTable,
    FavoriteTable,
    LayerTable,
    PictureTable,
    ProductTable,
    SceneTable,
    UserHaroTable,
    User_loginTable
    
} _TableName;



#define Kinsert @"i"
#define Kupdate @"u"
#define Kdelete @"d"


#import <Foundation/Foundation.h>
#import "FMDatabase.h"


@protocol ZHPassDataJSONDelegate;

@interface ZHPassDataJSON : NSObject
{
    
    __block FMDatabase *db;
    

}

@property (nonatomic, assign) id <ZHPassDataJSONDelegate> delegate;


- (void)jsonToDB:(NSDictionary *)jsonDict;
- (NSMutableArray *)getAllUpdateImage;



@end


@protocol ZHPassDataJSONDelegate <NSObject>


- (void)passDidFinish:(NSDictionary *)jsonDict;

@end