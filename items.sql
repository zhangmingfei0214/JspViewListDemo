create db shopping

-------------------
--table structure for user
------------------
create table user(
	id int(11) not null auto_increment,
	name varchar(50) default null
);

set foreign_key_checks=0;
--------------------
--table structure for items
---------------------
create table item (
	id int(11) not null auto_increment,
	name varchar(50) default null,
	city varchar(50) default null,
	price int(11) default null,
	number int(11) default null,
	picture varchar(500) dafault null,
	primary key ('id')
) engine=innoDB auto_increment=11 default charset=utf8;

----------------------------
--Records of items
----------------------------
insert into items values('1','沃特篮球鞋','佛山','180','500','001.jpg');
insert into items values('2','安踏球鞋','福州','120','800','002.jpg');
insert into items values('3','耐克球鞋','广州','500','1000','003.jpg');
insert into items values('4','阿迪达斯T血衫','上海','388','600','004.jpg');
insert into items values('5','李宁文化衫','深圳','180','900','005.jpg');
insert into items values('6','小米3','北京','1999','3000','006.jpg');
insert into items values('7','小米2s','北京','1299','2000','007.jpg');
insert into items values('8','ThinkPad笔记本','北京','6999','500','008.jpg');
insert into items values('9','dell笔记本','北京','4999','5000','009.jpg');
insert into items values('10','ipad5','北京','5999','250','010.jpg');

/*查询*/
/*新建查询*/
/*进行数据库表的建立*/