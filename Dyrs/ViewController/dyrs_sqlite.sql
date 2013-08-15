/* SQLEditor (SQLite)*/
DROP TABLE accessories;
DROP TABLE cases;
DROP TABLE category;
DROP TABLE channel;
DROP TABLE channel_view;
DROP TABLE department;
DROP TABLE images;
DROP TABLE user;
DROP TABLE values;

CREATE TABLE accessories
(
id INTEGER DEFAULT NULL,
title VARCHAR(50) DEFAULT NULL,
infor VARCHAR(1000) DEFAULT NULL,
cate_id INTEGER DEFAULT NULL,
status INTEGER DEFAULT NULL,
create_time BIGINT(20) DEFAULT NULL
);

CREATE TABLE cases
(
id INTEGER DEFAULT NULL,
info VARCHAR(1000) DEFAULT NULL,
name VARCHAR(50) DEFAULT NULL,
house_type_id INTEGER DEFAULT NULL,
area_id INTEGER DEFAULT NULL,
style_id INTEGER DEFAULT NULL,
city_id INTEGER DEFAULT NULL,
dept_id INTEGER DEFAULT NULL,
member_id INTEGER DEFAULT NULL,
price DOUBLE DEFAULT NULL,
status INTEGER DEFAULT NULL,
create_time BIGINT(20) DEFAULT NULL
);

CREATE TABLE category
(
id INTEGER DEFAULT NULL,
name VARCHAR(50) DEFAULT NULL,
fid INTEGER DEFAULT NULL,
level INTEGER DEFAULT NULL,
last INTEGER DEFAULT NULL,
status INTEGER DEFAULT NULL,
created_time INTEGER DEFAULT NULL
);

CREATE TABLE channel
(
channel_id INTEGER DEFAULT NULL,
name VARCHAR(50) DEFAULT NULL,
array_order INTEGER DEFAULT NULL,
status INTEGER DEFAULT NULL
);

CREATE TABLE channel_view
(
user_id INTEGER DEFAULT NULL,
channel_id INTEGER DEFAULT NULL
);

CREATE TABLE department
(
id INTEGER DEFAULT NULL,
name VARCHAR(50) DEFAULT NULL,
info VARCHAR(1000) DEFAULT NULL,
shop_name VARCHAR(50) DEFAULT NULL,
team_name VARCHAR(50) DEFAULT NULL,
status INTEGER DEFAULT NULL,
create_time BIGINT(20) DEFAULT NULL
);

CREATE TABLE images
(
id INTEGER DEFAULT NULL,
name VARCHAR(50) DEFAULT NULL,
url VARCHAR(1000) DEFAULT NULL,
object_type INTEGER DEFAULT NULL,
object_id INTEGER DEFAULT NULL,
status INTEGER DEFAULT NULL,
create_time BIGINT(20) DEFAULT NULL
);

CREATE TABLE user
(
user_id INTEGER DEFAULT NULL,
name VARCHAR(10) DEFAULT NULL,
gender INTEGER DEFAULT NULL,
account VARCHAR(50) DEFAULT NULL,
password VARCHAR(50) DEFAULT NULL,
type INTEGER DEFAULT NULL,
create_time BIGINT(20) DEFAULT NULL,
status INTEGER DEFAULT NULL,
department_id INTEGER DEFAULT NULL
);

CREATE TABLE values
(
id INTEGER DEFAULT NULL,
key_key VARCHAR(50) DEFAULT NULL,
key_value VARCHAR(50) DEFAULT NULL,
user_id INTEGER DEFAULT NULL
);

