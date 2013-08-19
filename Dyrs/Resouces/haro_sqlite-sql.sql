CREATE TABLE category ( cate_id INTEGER DEFAULT '0', name INTEGER DEFAULT NULL, array_order INTEGER DEFAULT NULL, status INTEGER DEFAULT NULL, type INTEGER DEFAULT NULL );
CREATE TABLE content ( content_id INTEGER DEFAULT '0', product_id INTEGER DEFAULT NULL, scene_id INTEGER DEFAULT NULL, layer_id INTEGER DEFAULT NULL, dir TEXT DEFAULT NULL, name TEXT DEFAULT NULL, status INTEGER DEFAULT NULL, type INTEGER DEFAULT NULL, array_order INTEGER DEFAULT NULL );  
CREATE TABLE custom ( custom_id INTEGER DEFAULT '0', province_id INTEGER DEFAULT NULL, dealer_id INTEGER DEFAULT NULL, shop_id INTEGER DEFAULT NULL, user_id INTEGER DEFAULT NULL, name TEXT DEFAULT NULL, tel TEXT DEFAULT NULL, address TEXT DEFAULT NULL, remark TEXT DEFAULT NULL, create_time INTEGER DEFAULT NULL, array_order INTEGER DEFAULT NULL, time TEXT DEFAULT NULL, budget TEXT DEFAULT NULL, status INTEGER DEFAULT NULL );
CREATE TABLE district ( district_id INTEGER DEFAULT '0', name TEXT DEFAULT NULL, fid INTEGER DEFAULT NULL, type INTEGER DEFAULT NULL, del_sign INTEGER DEFAULT NULL, order_sort INTEGER DEFAULT NULL, py TEXT DEFAULT NULL, hot INTEGER DEFAULT NULL ); 
CREATE TABLE favorite(  custom_id INTEGER DEFAULT NULL, cate_id INTEGER DEFAULT NULL, product_id INTEGER DEFAULT NULL, create_time TEXT DEFAULT NULL );  
CREATE TABLE layer ( layer_id INTEGER DEFAULT '0', scene_id INTEGER DEFAULT NULL, name TEXT DEFAULT NULL, level INTEGER DEFAULT NULL, status INTEGER DEFAULT NULL, array_order INTEGER DEFAULT NULL );  
CREATE TABLE picture(  picture_id INTEGER DEFAULT '0', product_id INTEGER DEFAULT NULL, cate_id INTEGER DEFAULT NULL, type INTEGER DEFAULT NULL, dir TEXT DEFAULT NULL, name TEXT DEFAULT NULL );  
CREATE TABLE product ( product_id INTEGER DEFAULT '0', cate_id INTEGER DEFAULT NULL, series TEXT DEFAULT NULL, no TEXT DEFAULT NULL, color INTEGER DEFAULT NULL, info_cn TEXT DEFAULT NULL, info_en TEXT DEFAULT NULL, price DOUBLE DEFAULT NULL, standard TEXT DEFAULT NULL, wood TEXT DEFAULT NULL, process TEXT DEFAULT NULL, deal TEXT DEFAULT NULL, level TEXT DEFAULT NULL, array_order INTEGER DEFAULT NULL, status INTEGER DEFAULT NULL, create_time INTEGER DEFAULT NULL );  
CREATE TABLE scene(  scene_id INTEGER DEFAULT '0', name TEXT DEFAULT NULL, status INTEGER DEFAULT NULL, array_order INTEGER DEFAULT NULL );  
CREATE TABLE user(  user_id INTEGER DEFAULT '0', district_id INTEGER DEFAULT NULL, name TEXT DEFAULT NULL, email TEXT DEFAULT NULL, password TEXT DEFAULT NULL, type INTEGER DEFAULT NULL, create_time TEXT DEFAULT NULL, status INTEGER DEFAULT NULL );
CREATE TABLE user_login(  login_id INTEGER DEFAULT '0', user_id INTEGER DEFAULT NULL, operate_time INTEGER DEFAULT NULL, operate_type INTEGER DEFAULT NULL );            