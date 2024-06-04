create table movie (
	movienum smallint auto_increment primary key,
    title varchar(50),
    poster varchar(80),
    director varchar(30),
    actor varchar(30),
    publishyear smallint,
    genre varchar(80),
    youtubeURL varchar(200)
);

insert into movie (title, poster, director, actor, publishyear, genre, youtubeURL)
			values ("범죄도시", "noimage.png", "이병현", "마동석", 2024, "액션", "www.youtube.com");
            
select * from movie;
drop table movie;

-- ################################################################## --

create table user (
	usernum smallint auto_increment primary key,
    email varchar(30),
    passwd varchar(20),
    profile varchar(80),
    birthday varchar(20),
    gender boolean
);

select * from user;
drop table user;

-- ################################################################## --

create table review (
	reviewnum smallint auto_increment primary key,
    movietitle varchar(50),
    rating smallint,
    email varchar(30),
    writeday datetime,
    content varchar(1000)
);

select * from review;
drop table review;
