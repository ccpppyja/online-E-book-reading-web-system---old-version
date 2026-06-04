
use webb16;
create table user(
                     id int primary key auto_increment,
                     username varchar(40) not null unique ,
                     password varchar(100)not null ,
                     email varchar(60) not null
)character set utf8 collate utf8_general_ci;


create table book(
                     id int primary key auto_increment,
                     title varchar(100) not null ,
                     author varchar(40),
                     genre varchar(40),
                     publishDate date,
                     description varchar(10240),
                     fileUrl varchar(255) not null unique ,
                     imageUrl varchar(255)
)character set utf8 collate utf8_general_ci;


create table bookmark(
                         id int primary key auto_increment,
                         userId int,
                         bookId int,
                         foreign key (userId) references user(id) on delete cascade ,
                         foreign key (bookId) references book(id) on delete cascade
)character set utf8 collate utf8_general_ci;


create table reading_history(
                                id int primary key auto_increment,
                                userId int,
                                bookId int,
                                lastReadTime timestamp,
                                foreign key (userId) references user(id) on delete cascade ,
                                foreign key (bookId) references book(id) on delete cascade
)character set utf8 collate utf8_general_ci;