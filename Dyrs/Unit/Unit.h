//
//  Unit.h
//  NetWork
//
//  Created by mbp  on 13-8-2.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//




//typedef NS_ENUM(NSInteger, statue) {
//    statue_success = 100,
//    statue_failure = 101
//};



#define Statue_success @"100"
#define statue_failure @"101"



#define CGRectMake2X(x, y, width, height) CGRectMake(x/2, y/2, width/2,height/2)

#define screenWidth [[UIScreen mainScreen] bounds].size.width
#define screenHeight [[UIScreen mainScreen] bounds].size.height


#define CREEN   CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width)
#define SCROLLVIEW_SIZE(NUM)       CGSizeMake(NUM*1024, 768)



#define DOCUMENTS_FOLDER [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

#define FILEPATH [DOCUMENTS_FOLDER stringByAppendingPathComponent:[self dateString]]

#define MAINBUNDLE [NSBundle mainBundle]


#define IMAGESIZEWIDTH(img) img.size.width/2
#define IMAGESIZEHEIGHT(img) img.size.height/2

#define IMAGEVIEWSIZEWIDTH(imgView) imgView.image.size.width/2
#define IMAGEVIEWSIZEHEIGHT(imgView) imgView.image.size.height/2

#define BUTTONSIZEWIDTH(BTN) BTN.frame.size.width
#define BUTTONSIZEHEIGHT(BTN) BTN.frame.size.height


#define KNSUserDefaults [NSUserDefaults standardUserDefaults] 

#define KCurrentUser @"currentUser"
#define KCurrentUser_version @"version"

#define KDocumentDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]



#define KProjectNameHaro @"haro"
#define KProjectNameDyrs @"Dyrs"

#define KCurrentProjectName @"dyrs"


#define SDWIRetain(__v) ([__v retain]);
#define SDWIReturnRetained SDWIRetain

#define SDWIRelease(__v) ([__v release]);
#define SDWISafeRelease(__v) ([__v release], __v = nil);
#define SDWISuperDealoc [super dealloc];


#define KisHaro [KCurrentProjectName isEqualToString:KProjectNameHaro]
#define KisDyrs [KCurrentProjectName isEqualToString:KProjectNameDyrs]


//  淘宝

#define KTaoBaoAppKey @"21584394"
#define KTaoBaoSecert @"bbff717c92a7d3cdbe99e901cf8057d9"

#define KAppredirect_uri @"http://gediaoer.com"
#define KTaoBaoCallbackUrl @"gediaoercallback://"



