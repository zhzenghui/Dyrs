//
//  ZHPassDataJSON.m
//  NetWork
//
//  Created by mbp  on 13-8-9.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "ZHPassDataJSON.h"


#import "ZHdyrsModel.h"
#import "ZHDBControl.h"


#define FMDBQuickCheck(SomeBool) { if (!(SomeBool)) { NSLog(@"Failure on line %d", __LINE__); abort(); } }


@implementation ZHPassDataJSON




- (id) init
{
    self = [super init];
    if (self)
    {
        
        if ([[ZHDBControl share] checkDB]) {
            
            
            NSString *dbPath = nil;
            
            if (KisDyrs) {
                dbPath = [KDocumentDirectory stringByAppendingPathComponent:@"dyrs.db"];
            }
            else {
                dbPath = [KDocumentDirectory stringByAppendingPathComponent:@"haro.db"];

            }

            db = [[FMDatabase alloc ]initWithPath:dbPath] ;
            
        }
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


#pragma mark  命令执行

- (void)stringToDBSqlString:(NSString *)sqlString
{
    
    if (!sqlString) {
        return;
    }
    
    
    bool statue =  [db executeUpdate:
                    sqlString];
    
    if (statue) {
        
    }
    else {
        DLog(@"statue:%i error: %@", statue, sqlString);
    }
}


- (void)dictToDB:(NSDictionary *)dict sqlString:(NSString *)sqlString
{
    
    
    if (!sqlString) {
        return;
    }
    
    
    bool statue =  [db executeUpdate:
                    sqlString withParameterDictionary:dict];
    
    if (statue) {

    }
    else {
        DLog(@"statue:%i error: %@,  \n lasterror:%@", statue, sqlString, db.lastError);
    }
}


/*

switch (tableName) {
    case UserTable:
    {
        break;
    }
    case ChannelTable:
    {
    }
    case Channel_viewTable:
    {
        
    }
    case DepartmentTable:
    {
        
    }
    case ImagesTable:
    {
        
    }
    case ValuesTable:
    {
        
    }
    case MemberTable:
    {
        
    }
    case CasesTable:
    {
        
    }
    case CategoryTable:
    {
        
    }
    case AccessoriesTable:
    {
        
    }
    default:
        break;
}
 
 */
#pragma mark - insert  update  delete




- (void)deleteDictToDB:(NSDictionary *)dict  tableName:(_TableName)tableName
{
    NSString *sqlString = nil;
    
    switch (tableName) {
        case UserTable:
        {
            sqlString = [NSString stringWithFormat:@"DELETE from user  \
                         WHERE user_id = :user_id"];
            break;
        }
        case ChannelTable:
        {
            sqlString = [NSString stringWithFormat:@"DELETE from Channel  \
                         WHERE user_id = :user_id"];
            break;
        }
        case Channel_viewTable:
        {
            sqlString = [NSString stringWithFormat:@"DELETE from Channel_View  \
                         WHERE user_id = :user_id"];
            break;
        }
        case DepartmentTable:
        {
            sqlString = [NSString stringWithFormat:@"DELETE from Department  \
                         WHERE id = :id"];
            break;
        }
        case ImagesTable:
        {
            sqlString = [NSString stringWithFormat:@"DELETE from Images  \
                         WHERE id = :id"];
            break;
        }
        case ValuesTable:
        {
            sqlString = [NSString stringWithFormat:@"DELETE from values  \
                         WHERE id = :id"];
            break;
        }
        case MemberTable:
        {
            sqlString = [NSString stringWithFormat:@"DELETE from Member  \
                         WHERE id = :id"];
            break;
        }
        case CasesTable:
        {
            sqlString = [NSString stringWithFormat:@"DELETE from Cases  \
                         WHERE id = :id"];
            break;
        }
        case CategoryTable:
        {
            sqlString = [NSString stringWithFormat:@"DELETE from Category  \
                         WHERE id = :id"];
            break;
        }
        case AccessoriesTable:
        {
            sqlString = [NSString stringWithFormat:@"DELETE from Accessories  \
                         WHERE id = :id"];
            break;
        }
        default:
            break;
    }
    
    [self dictToDB:dict sqlString:sqlString];
 

}

- (void)updataDictToDB:(NSDictionary *)userDict  tableName:(_TableName)tableName
{
    
    NSString *sqlString = nil;

    
    
    switch (tableName) {
        case UserTable:
        {
            sqlString = [NSString stringWithFormat:@"update user set  \
                         user_id=:user_id, name=:name, gender=:gender, account=:account, password=:password,\
                         type=:type, create_time=:create_time, status=:status, dept_id=:dept_id  \
                         \
                         WHERE user_id = :user_id;"];
            break;
        }
        case ChannelTable:
        {
            
            sqlString = [NSString stringWithFormat:@"update Channel set \
                         channel_id=:channel_id, name=:name, array_order=:array_order,\
                         status=:status, create_time=:create_time \
                         \
                         WHERE user_id = :user_id;"];
            break;
        }
        case Channel_viewTable:
        {
            sqlString = [NSString stringWithFormat:@"update Channel_View set \
                         user_id=:user_id, channel_id=:channel_id \
                         \
                         WHERE user_id = :user_id;"];
            break;
        }
        case DepartmentTable:
        {
            sqlString = [NSString stringWithFormat:@"update Department set  \
                         id=:id, name=:name, info=:info, shop_name=:shop_name,\
                         team_name=:team_name, status=:status, create_time=:create_time \
                         \
                         WHERE id = :id;"];
            break;
        }
        case ImagesTable:
        {
            
            
            sqlString = [NSString stringWithFormat:@"update Images set \
                         id=:id, name=:name, url=:url, object_type=:object_type, \
                         object_id=:object_id, status=:status, create_time=:create_time \
                         \
                         WHERE id = :id;"];
            
            break;
        }
        case ValuesTable:
        {
            sqlString = [NSString stringWithFormat:@"update values set  \
                         id=:id, key_key=:key_key, key_value=:key_value, user_id=:user_id\
                         \
                         WHERE id = :id;"];
            
            break;
        }
        case MemberTable:
        {
            
            sqlString = [NSString stringWithFormat:@"update Member set  \
                         id=:id, name=:name, info=:info, dept_id=:dept_id,  \
                         gender=:gender,type=:type, status=:status, create_time=:create_time \
                         \
                         WHERE id = :id;"];
            break;
        }
        case CasesTable:
        {
            sqlString = [NSString stringWithFormat:@"update Cases set  \
                         id=:id, name=:name, info=:info, dept_id=:dept_id, \
                        house_type_id=:house_type_id,\
                         style_id=:style_id, city_id=:city_id, dept_id=:dept_id, \
                         member_id=:member_id, price=:price, status=:status,\
                         create_time=:create_time \
                         \
                         WHERE id = :id;"];
            break;
        }
        case CategoryTable:
        {
            sqlString = [NSString stringWithFormat:@"update Category set \
                         id=:id, name=:name, fid=:fid, level=:level, last=:last,\
                         type=:type, status=:status, create_time=:create_time \
                         WHERE id = :id;"];
            break;
        }
        case AccessoriesTable:
        {
            sqlString = [NSString stringWithFormat:@"update Accessories set \
                         id=:id, title=:title, info=:info, cate_id=:cate_id,  \
                         status=:status, create_time=:create_time \
                         \
                         WHERE id = :id;"];
            break;
        }
        case UserHaroTable:
        {
            sqlString = [NSString stringWithFormat:@"update User set \
                         user_id=:user_id, district_id=:district_id, namer=:namer, email=:email, password=:password, type=:type, create_time=:create_time,  statu=:status \
                         \
                         WHERE user_id = :user_id;"];
            break;
        }
        case ProductTable:
        {
            sqlString = [NSString stringWithFormat:@"update Product set \
                         product_id=:product_id, cate_id=:cate_id, series=:series, no=:no, color=:color, info_cne=:info_cn, info_en=:info_en,  price=:price, standard=:standard, wood=:wood, process=:process, deal=:deal,\
                         level=:level, array_order=:array_order, status=:status, create_time=:create_time\
                         \
                         WHERE product_id = :product_id;"];
            break;
        }
        case CategoryHaroTable:
        {
            sqlString = [NSString stringWithFormat:@"update Category set \
                         cate_id=:cate_id, name=:name, array_order=:array_order, status=:status, typed=:type, \
                         \
                         WHERE cate_id = :cate_id;"];
            break;
        }
        case PictureTable:
        {
            sqlString = [NSString stringWithFormat:@"update Picture set \
                         picture_id=:picture_id, product_id=:product_id, cate_id=:cate_id, type=:type, text=:text, name=:name \
                         \
                         WHERE picture_id = :picture_id;"];
            break;
        }
        case SceneTable:
        {
            sqlString = [NSString stringWithFormat:@"update Scene set \
                         scene_id=:scene_id, name=:name, status=:status, array_order=:array_order \
                         \
                         WHERE scene_id = :scene_id;"];
            break;
        }
        case LayerTable:
        {
            sqlString = [NSString stringWithFormat:@"update Layer set \
                         layer_id=:layer_id, scene_id=:scene_id, name=:name, level=:level, status=:status, array_order=:array_order \
                         \
                         WHERE layer_id = :layer_id;"];
            break;
        }
        case ContentTable:
        {
            sqlString = [NSString stringWithFormat:@"update Content set \
                         content_id=:content_id, product_id=:product_id, scene_id=:scene_id, layer_id=:layer_id, dir=:dir, name=:name, status=:status,  type=:type, array_order=:array_order \
                         \
                         WHERE content_id = :content_id;"];
            break;
        }
        case CustomTable:
        {
            sqlString = [NSString stringWithFormat:@"update Custom set \
                         custom_id=:custom_id, province_id=:province_id, dealer_id=:dealer_id, shop_id=:shop_id, user_id=:user_id, name=:name, tel=:tel,  address=:address, remark=:remark, create_time=:create_time, array_order=:array_order, time=:time, budget=:budget,\
                         status=:status \
                         \
                         WHERE custom_id = :custom_id;"];
            break;
        }
        case FavoriteTable:
        {
            sqlString = [NSString stringWithFormat:@"update Favorite set \
                         custom_id=:custom_id, cate_id=:cate_id, product_id=:product_id, create_time=:create_time \
                         \
                         WHERE custom_id = :custom_id;"];
            break;
        }

            
        default:
            break;
    }



    
    [self dictToDB:userDict sqlString:sqlString];

}

- (void)insertDictToDB:(NSDictionary *)dict  tableName:(_TableName)tableName
{
    
    NSMutableString *sqlString = [NSMutableString string];
    
    switch (tableName) {
//            dyrs
        case UserTable:
        {
            [sqlString appendString:@"INSERT INTO user ("];

            
            [sqlString appendString:@")"];
            [sqlString appendString:@"VALUES ("];
            
            [sqlString appendString:@")"];
            sqlString = [NSString stringWithFormat:@"user_id, name, gender, account, password, type, version,create_time, status, dept_id) VALUES (:user_id, :name, :gender, :account, :password, :type, :create_time, :status, :dept_id)"];
            break;
        }
        case ChannelTable:
        {
                sqlString = [NSString stringWithFormat:@"INSERT INTO Channel (channel_id, name, array_order, status, create_time) VALUES (:channel_id, :name, :array_order, :status, :create_time)"];
            break;
        }
        case Channel_viewTable:
        {
            sqlString = [NSString stringWithFormat:@"INSERT INTO Channel_View (user_id, channel_id) VALUES (:user_id, :channel_id)"];
            break;

        }
        case DepartmentTable:
        {
            sqlString = [NSString stringWithFormat:@"INSERT INTO Department (id, name, info, shop_name, team_name, status, create_time) VALUES (:id, :name, :info, :shop_name, :team_name, :status, :create_time)"];
            break;

        }
        case ImagesTable:
        {
            sqlString = [NSString stringWithFormat:@"INSERT INTO Images (id, name, url, object_type, object_id, status, create_time) VALUES (:id, :name, :url, :object_type, :object_id, :status, :create_time)"];
            break;
        }
        case ValuesTable:
        {
            sqlString = [NSString stringWithFormat:@"INSERT INTO values (id, key_key, key_value, user_id) VALUES (:id, :key_key, :key_value, :user_id)"];
            break;
        }
        case MemberTable:
        {
            sqlString = [NSString stringWithFormat:@"INSERT INTO Member (id, name, info, dept_id, gender, type, status, create_time) VALUES (:id, :name, :info, :dept_id, :gender, :type, :status, :create_time)"];
            break;
        }
        case CasesTable:
        {
            sqlString = [NSString stringWithFormat:@"INSERT INTO Cases (id, name, info, dept_id, house_type_id, area_id, style_id, city_id, dept_id, member_id, price, status, create_time) VALUES (:id, :name, :info, :dept_id, :house_type_id, :area_id, :style_id, :city_id, :dept_id, :member_id, :price, :status, :create_time)"];
            break;
        }
        case CategoryTable:
        {
            sqlString = [NSString stringWithFormat:@"INSERT INTO Category (id, name, fid, level, last, status, create_time) VALUES (:id, :name, :fid, :level, :last, :status, :create_time)"];
            break;
        }
        case AccessoriesTable:
        {
            sqlString = [NSString stringWithFormat:@"INSERT INTO Accessories (id, title, info, cate_id, status, create_time) VALUES (:id, :title, :info, :cate_id, :status, :create_time)"];
            break;
            [sqlString appendString:@"INSERT INTO Product ("];
            [sqlString appendString:@""];
            [sqlString appendString:@")  VALUES ("];
            [sqlString appendFormat:@"%@", [dict objectForKey:@"cate_id"]];
            [sqlString appendString:@") "];
        }
//            haro
        case ProductTable:
        {

            [sqlString appendString:@"INSERT OR REPLACE INTO Product ("];
            [sqlString appendString:@"cate_id, \
             color, \
             info_cn, \
             info_en, \
             level, \
             no, \
             price, \
             product_id, \
             series, \
             standard\
             "];
            [sqlString appendString:@")  VALUES ("];
            [sqlString appendFormat:@"'%@', ", [dict objectForKey:@"cate_id"]];
            [sqlString appendFormat:@"'%@', ", [dict objectForKey:@"color"]];
            [sqlString appendFormat:@"'%@', ", [dict objectForKey:@"info_cn"]];
            [sqlString appendFormat:@"'%@', ", [dict objectForKey:@"info_en"]];
            [sqlString appendFormat:@"'%@', ", [dict objectForKey:@"level"]];
            [sqlString appendFormat:@"'%@', ", [dict objectForKey:@"no"]];
            [sqlString appendFormat:@"'%@', ", [dict objectForKey:@"price"]];
            [sqlString appendFormat:@"'%@', ", [dict objectForKey:@"product_id"]];
            [sqlString appendFormat:@"'%@', ", [dict objectForKey:@"series"]];
            [sqlString appendFormat:@"'%@'", [dict objectForKey:@"standard"]];
            [sqlString appendString:@") "];
            break;
        }
        case CategoryHaroTable:
        {
            sqlString = [NSString stringWithFormat:@"INSERT INTO Category (cate_id, name, array_order, status, type) VALUES (:cate_id, :name, :array_order, :status, :type)"];
            break;
        }
        case PictureTable:
        {
            sqlString = [NSString stringWithFormat:@"INSERT INTO Picture (picture_id, product_id, cate_id, type, text, name) VALUES (:picture_id, :product_id, :cate_id, :type, :text, :name)"];
            break;
        }
        case SceneTable:
        {
            sqlString = [NSString stringWithFormat:@"INSERT INTO Scene (scene_id, name, status, array_order) VALUES (:scene_id, :name, :status, :array_order)"];
            break;
        }
        case LayerTable:
        {
            sqlString = [NSString stringWithFormat:@"INSERT INTO layer (layer_id, scene_id, name, level, status, array_order) VALUES (:layer_id, :scene_id, :name, :level, :status, :array_order)"];
            break;
        }
            
        case ContentTable:
        {
            sqlString = [NSString stringWithFormat:@"INSERT INTO Content (content_id, product_id, scene_id, layer_id, dir,  name, status, type, array_order) VALUES (:content_id, :product_id, :scene_id, :layer_id, dir,  :name, :status, :type, :array_order)"];
            break;
        }
            
            
        case CustomTable:
        {
            sqlString = [NSString stringWithFormat:@"INSERT INTO Custom (custom_id, province_id, dealer_id, shop_id, user_id, name, tel, address, remark, create_time, array_order, time, budget, status) VALUES (:custom_id, :province_id, :dealer_id, :shop_id, :user_id, :name, :tel, :address, :remark, :create_time, :array_order, :time, :budget, :status)"];
            break;
        }
        case UserHaroTable:
        {
            sqlString = [NSString stringWithFormat:@"INSERT INTO User (user_id, district_id, name, email, password, type, create_time, status) VALUES (:user_id, :district_id, :name, email, :password, :type,  :create_time,:status)"];
            break;
        }
//        case FavoriteTable:
//        {
//            sqlString = [NSString stringWithFormat:@"INSERT INTO Favorite (custom_id, cate_id, name, email, password, type, create_time, status) VALUES (:user_id, :district_id, :name, email, :password, :type,  :create_time,:status)"];
//            break;
//        }
        default:
            break;
    }

    
    [self stringToDBSqlString:sqlString];
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
        

        
        BOOL rc = [db executeUpdate:sqlString];
        
        FMDBQuickCheck(rc);
        
        if (!rc) {
            NSLog(@"ERROR==========: %d - %@", db.lastErrorCode, db.lastErrorMessage);
        }
        
        [db close];
    }
}







- (void)jsonSqlType:(NSDictionary *)tableSqlDict  tableName:(_TableName)tableName
{
    
    if ([[[tableSqlDict objectForKey:@"sqltype"] stringValue] isEqualToString:Kinsert]) {
        
        [self insertDictToDB:tableSqlDict tableName:tableName];
    }
    else if ([[[tableSqlDict objectForKey:@"sqltype"] stringValue] isEqualToString:Kupdate]) {
        
        [self updataDictToDB:tableSqlDict  tableName:tableName];

    }
    else if ([[[tableSqlDict objectForKey:@"sqltype"] stringValue] isEqualToString:Kdelete]) {
        [self deleteDictToDB:tableSqlDict  tableName:tableName];

    }
}


/*
 *  遍历  所有 
 *
 *
 */
- (void)insertToDB:(NSArray *)array tableName:(_TableName)tableName
{
    
    for (NSDictionary *userDict in array) {
        
        [self jsonSqlType:userDict tableName:tableName];
    }
}


/*
 
 判断该表数据是否存在后
 
 以   table  为键名的   取得表数据
 
 */
- (void)jsonToTableDB:(NSDictionary *)jsonDict
{

    
    if ([jsonDict objectForKey:@"user"])
    {
        [self insertToDB:[jsonDict objectForKey:@"user"] tableName:UserTable];
    }
    
    
    if ([jsonDict objectForKey:@"cases"])
    {
        [self insertToDB:[jsonDict objectForKey:@"cases"] tableName:CasesTable];
    }
    
    
    if ([jsonDict objectForKey:@"images"])
    {
        [self insertToDB:[jsonDict objectForKey:@"images"] tableName:ImagesTable];
    }
    
    
    if ([jsonDict objectForKey:@"product"])
    {
        [self insertToDB:[jsonDict objectForKey:@"product"] tableName:ProductTable];
    }
    
}





/*
 
 json   =>    sql   db  

{
    "status": "100",
    "data": {
        "user": [
                 {
                     "sqltype": "i",
                     "sqldata": {
                         "user_id": 1,
                         "name": "zne",
                         "gender": 1,
                         "account": "zhzne",
                         "password": "123456",
                         "type": 1,
                         "create_time": "2013-8-13",
                         "status": 0,
                         "dept_id": 1
                     }
                 }
                 ],
        "image": [ ]
    }
}
  */

- (void)jsonToDB:(NSDictionary *)jsonDict
{
    

    dispatch_queue_t queue = dispatch_queue_create("com.ple.queue", NULL);
    dispatch_async(queue, ^(void) {
    
        
        if (![db open]) {
            
            DLog (@"Could not open db.");
        }
        else {
            [self jsonToTableDB:jsonDict];

        }
        
        
        dispatch_release(queue);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate performSelector:@selector(passDidFinish:)];
            
        });
        
        
    });

}


- (NSMutableArray *)getAllUpdateImage
{
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];

    
    NSString *sqlString = [NSString stringWithFormat:@"select * from images"];
    
    
    if (![db open]) {
        
        DLog (@"Could not open db.");
    }
    else {
        
        
        FMResultSet *rs = [db executeQuery:sqlString];
        Images *image = [[Images alloc] init];

        while ([rs next]) {
            
            image.ID = [rs intForColumn:@"id"];
            image.name = [rs stringForColumn:@"name"];
            image.url = [rs stringForColumn:@"url"];
           
            image.object_id = [rs intForColumn:@"object_id"];
            image.object_type = [rs intForColumn:@"object_type"];
            image.status = [rs intForColumn:@"status"];

            image.create_time = [rs stringForColumn:@"create_time"];

            
            [dataArray addObject:image];
            
        }
        
        [image release];
        
        [rs close];
    }
    

    return [dataArray autorelease];
}

- (NSArray *)fmResultSetToArray:(FMResultSet *)rs dataArray:(NSMutableArray *)dataArray tableName:(_TableName)table
{
//    while ([rs next]) {
//
//        
//        switch (table) {
//            case ImagesTable:
//            {
//                
//                
//                break;
//            }
//            default:
//                break;
//        }
//    }
    return dataArray;
}


#pragma mark  get  data  

- (NSArray *)getData :(_TableName)table  pageNum:(int)pageNum pageSize:(int)pageSize
{
    
    NSString *sqlString  = nil;
    NSString *tableNameString  = nil;

    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    switch (table) {
        case ImagesTable:
        {
            tableNameString = [NSString stringWithFormat:@"images"];
            break;
        }
        default:
            break;
    }
    if (pageNum == 0 && pageSize == 0) {
        sqlString = [NSString stringWithFormat:@"select * from %@", tableNameString];
    }
    else {
        
    }


    if (![db open]) {
        
        DLog (@"Could not open db.");
    }
    else {
        FMResultSet *rs = [db executeQuery:sqlString];
        
        [self fmResultSetToArray:rs dataArray:dataArray tableName:table];
            

        [rs close];

    }
    
    
    return [dataArray autorelease];
    
}



@end
