//
//  ZHdyrsModel.h
//  NetWork
//
//  Created by mbp  on 13-8-9.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import <Foundation/Foundation.h>



#pragma mark - Department

@interface Department : NSObject

@property(nonatomic, retain) NSString *ID;
@property(nonatomic, retain) NSString *full_name;
@property(nonatomic, retain) NSString *introduction;
@property(nonatomic, retain) NSString *shopname;

@property(nonatomic, retain) NSString *teamname;



@property(nonatomic, assign) int *status;
@property(nonatomic, retain) NSString *created_at;

@end


#pragma mark - Users

@interface User : NSObject
{
    
}


@property(nonatomic, retain) NSString *ID;
@property(nonatomic, assign) int *user_id;
@property(nonatomic, assign) int *district_id;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *email;
@property(nonatomic, retain) NSString *password;
@property(nonatomic, assign) int *type;
@property(nonatomic, retain) NSString *create_at;
@property(nonatomic, assign) int *status;


@property(nonatomic, retain) NSString *expiredDate;

@property(nonatomic, retain) NSString *created_at;



@end


#pragma mark - images

@interface Images : NSObject


@property(nonatomic, retain) NSString *ID;
@property(nonatomic, retain) NSString *pic_name;
@property(nonatomic, retain) NSString *url;
@property(nonatomic, retain) NSString *type;

@property(nonatomic, assign) int *object_id;
@property(nonatomic, retain) NSString *statue;

@property(nonatomic, assign) int *status;
@property(nonatomic, retain) NSString *created_at;

@end

#pragma mark - setting

@interface Setting : NSObject

@property(nonatomic, retain) NSString *ID;
@property(nonatomic, retain) NSString *key_key;
@property(nonatomic, retain) NSString *key_value;
@property(nonatomic, assign) int *user_id;

@end

#pragma mark - personnel

@interface Personnel : NSObject

@property(nonatomic, retain) NSString *ID;
@property(nonatomic, retain) NSString *full_name;
@property(nonatomic, retain) NSString *introduction;
@property(nonatomic, assign) int *department_id;

@property(nonatomic, assign) int *type_id;


@property(nonatomic, assign) int *status;
@property(nonatomic, retain) NSString *created_at;


@end

#pragma mark - cases

@interface Cases : NSObject


@property(nonatomic, retain) NSString *ID;
@property(nonatomic, retain) NSString *introduction;
@property(nonatomic, retain) NSString *full_name;
@property(nonatomic, assign) int *house_type_id;

@property(nonatomic, assign) int *area_id;
@property(nonatomic, assign) int *style_id;
@property(nonatomic, assign) int *city_id;
@property(nonatomic, assign) int *department_id;

@property(nonatomic, assign) int *personnel_id;
@property(nonatomic, assign) double *price;


@property(nonatomic, assign) int *status;
@property(nonatomic, retain) NSString *created_at;

@end

#pragma mark - accessories

@interface Accessories : NSObject

@property(nonatomic, retain) NSString *ID;
@property(nonatomic, retain) NSString *full_name;

@property(nonatomic, assign) int *status;
@property(nonatomic, retain) NSString *created_at;

@end

#pragma mark - accessories_detail

@interface Accessories_detail : NSObject

@property(nonatomic, retain) NSString *ID;
@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *introduction;
@property(nonatomic, assign) int *accessories_id;

@property(nonatomic, assign) int *status;
@property(nonatomic, retain) NSString *created_at;

@end





@interface ZHdyrsModel : NSObject

@end
