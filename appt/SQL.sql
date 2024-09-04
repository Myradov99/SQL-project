-- we are creting cinema company
create table Movies(
		movie_id int primary key auto_increment,
        title varchar(100) NOT NULL,
        Relaesayear DATE,
        genre varchar(100)
        );
      -- default undecided ,useful constait
Create table theater(
		theaterID int Primary key AUTO_INCREMENT, -- ussine kopeltya
		theatername varchar(100),
		location varchar(100) unique,       --  we cant doublecate in one table many columnss
		capacity float, 
		theaterType varchar(50),
        rating decimal(3,1)
 );
 
create table showtime (
    showtimeID int primary key,
    movie_id int,
    theaterID int,
    StartTime DATETIME, -- for date -2024-04-04  ,, for time is 23:00:22, for date time comabine together
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (theaterID) REFERENCES Theater(theaterID)
); 
alter table showtime
add column showtimeID int primary key auto_increment
First;
select * from showtime;

insert into showtime (movie_id,theaterID,StartTime) values
(1, 2, '2024-03-25 23:00:00'),  
(2, 3, '2024-07-18 22:00:00'),  
(3, 4, '2024-04-11 19:00:00'),  
(4, 5, '2024-06-01 20:00:00'),  
(5, 6, '2024-06-01 20:00:00'),  
(6, 7, '2024-06-01 20:00:00'); 


create table actors (
    actorId int primary key auto_increment,
    country varchar(100),
    namea  VARCHAR(100),
    birthdate DATE,
    Nationality VARCHAR(50)
);
select* from actors;
insert into actors (country, namea, birthdate, Nationality) 
values
('USA','Tom Hanks','1980-10-05','AMERICAN'),
('UK','Meryl Streep','1975-08-02','BRITISH'),
('USA','Leonardo DiCaprio','1973-02-05', 'AMERICAN'),
('TURKMENISTAN','YLHAM MYRADOV','1999-08-10', 'TURKMEN'),
('FRANCE','Denzel Washington','1968-07-09', 'FRANCE'),
('GERMANY','Julia Roberts','1985-01-06', 'GERMAN');


 drop table actors;
        -- i forgot to put column relaeseyear (DATE) if i want to just write year (Data)
        -- forgot to remove unique from movie_id
        alter table movies 
        drop column movie_id,
        drop column  Relaesayear;
        alter table Movies 
        add column movie_id int PRIMARY KEy;
        add column Relaesayear date,
        after title; 
        
         
-- added new column
Alter table Movies 
Add location varchar(100)


ALTER TABLE Movies 
MODIFY COLUMN movie_id INT FIRST;

-- change datatype and location 
Alter table Movies
modify column location varchar(50) -- changed datatype from 100 to 50
after Relaesayear; -- we put location data after Relaeseyear 

-- rename table and column
alter table Movies 
rename column location to place ;

-- drop column 
alter table Movies
drop column place;

select * from Movies;
drop table theater;

-- i like o do like this
-- insert
insert into  Movies	(title,Relaesayear,genre)
values('Agent',"2001-10-01","action"),-- id is auto_increment
("New york","2004-09-14","comedy"),
("Dune","2015-01-22","Action Trailer"),
("Aqua man","2023-05-07","Action trailer"),
("love me ","2008-08-30","Drama");
INSERT INTO Movies(title, genre) VALUES ('father', 'drama');

-- formal format
INSERT INTO theater VALUES (1,'Cinema City', 'Bucharest, Calea Vitan', 251.1, '3d', 4.2);
INSERT INTO theater VALUES (2,'Movieplex', 'Oradea, Piața Unirii', 156.5, 'IMAX', 4.8);
INSERT INTO theater  VALUES (3,'Patria Cinema', 'Bacău, Bulevardul Unirii', 182.9, 'Standard', 4.9);
INSERT INTO theater VALUES (4,'Cityplex', 'Sibiu, Piața Mare', 220.0, 'VIP', 5);
INSERT INTO theater VALUES (5,'CinemaPRO', 'Craiova, Strada Unirii', 300.0, '3D', 3.9);
INSERT INTO theater  VALUES (6,'Happy Cinema', 'Brașov, Piața Sfatului', 120.0, 'Standard', 4.4);
INSERT INTO theater  VALUES (7,'CineGold', 'Constanța, Strada Mihai Eminescu', 180.0, 'VIP', 4.8);
INSERT INTO theater  VALUES (8,'Hollywood Multiplex', 'Iași, Bulevardul Ștefan cel Mare și Sfânt', 500.0, 'Standard', 5);
INSERT INTO theater  VALUES (9,'Grand Cinema Digiplex', 'Timișoara, Piața Victoriei', 250.0, 'IMAX', 4.9);
INSERT INTO theater  VALUES (10,'Movie Vip', 'Cluj-Napoca, Strada Horea', 70.0, 'Standard', 5);
insert into theater (theatername,location ) values (11,"Romania,""Romania");

select * from theater;

-- update write without table word
update  theater
set theatertype ='undecided'
where theaterid =11;

-- delete column
Delete from theater
where theaterID=11 ;
 
-- set autocommit off;     -- <- manually save
commit;
rollback; -- like ctrl z return back

-- insert into mydate values(currentdate()+1,currenttime(), now());
-- +1 it is means automatic adding currentdate

-- add uniquie
alter table showtime
add constraint 
unique (starttime);
-- add not null
alter table theater
modify Nationality varchar(100) NOT NULL;
select * from theater;

-- safe udates off
SET SQL_SAFE_UPDATES = 0;  

UPDATE theater
SET rating = 4
WHERE rating < 4;

-- check constaint make sure all rating higer than 4
alter table theater
 add check (rating >= 4);

-- order by 
select * from Actors
order by country ;

select * from  Movies
order by title ASC, movie_id  DESC ; -- from A to Z  -- DESC AND ASC from 1 to 6 ,6 to 1
-- first title after movie_id order to ecran

-- join two table 
Select * from showtime 
 inner join movies
on  showtime.movie_id = movies.movie_id
inner join theater
on showtime.theaterID = theater.theaterID;

-- one row we will add to see on left join
insert into showtime
values(7,null,null, null);

Select * from showtime 
 left join movies
on  showtime.movie_id = movies.movie_id
left join theater
on showtime.theaterID = theater.theaterID;
Select * from showtime 
 right join movies
on  showtime.movie_id = movies.movie_id
right join theater
on showtime.theaterID = theater.theaterID;

-- specific cilumn on joins
Select  showtimeID,title,genre
from showtime inner join movies
on  showtime.movie_id = movies.movie_id;

-- functions 
select count(country) as country
from actors;
select max(rating)as reviews
from theater;
select min(rating)
from theater;
select avg(rating)
from theater;
--  decided add new column for movies table 
Alter table Movies
add ticket float;

-- Error Code: 1364. Field 'title' doesn't have a default value


-- change place column 
alter table MOVIES
modify column ticket float after genre;
-- i did wrong first 
delete from Movies
where movie_id =12;
-- i creted ticket column and i put price when connected with title when called name with price
UPDATE movies   -- replace place  and connect 
SET ticket = CASE
WHEN title = 'Agent' THEN 6.99
WHEN title = 'New york' THEN 5.78
WHEN title = 'Dune' THEN 7.45
WHEN title = 'Aqua man' THEN 6.57
WHEN title = 'love me' THEN 7.00
WHEN title = 'father' THEN 6.86
END
where movie_id IN(1,2,3,4,5,6);
-- i got on movie_id 5 null  and with update i put price 
update movies
set ticket = 6.99
where movie_id =5;


-- i decided make function with this ticket column


select sum(ticket)as priice  -- we give name for ticket 
from Movies;
select max(ticket)
from movies;
select concat(namea," ",Nationality) as Bio
From Actors;
select concat(theatername," ",theaterType)as theater
from theater;
select*from  actors;

-- i decided add one more column for actor table 

alter table actors
add column Reward varchar(50);

update actors
set reward = 'Golden Globe Award'
where actorId =1;
update actors
set reward = 'Cannes Film Festival Award (Palme d)'
where actorId =6;

-- logical operater and or between in 

-- or only one condition must be true  . and  2 condition must be true
select * from actors
where country = 'USA' or Reward ='Critics Choice Movie Award';
-- this will return besides American actors with and not also besides British actor

select * from  actors
where not Nationality ='AMERICAN' and not Nationality = 'British';
 -- in also can find  given values
 -- also have a between operater which is can find given values 
 
select * from theater
where capacity between '120' and  '156.5';
select * from theater 
where location In('Bucharest, Calea Vitan','Oradea, Piața Unirii');

-- lets use wild caracter %  _
select * from movies
where title like 'A%'; -- where title starts with A 
select * from movies
where title like '%e';  -- where title ends with e 
select * from actors
where birthdate like '1973%'; -- where start with 1973
select * from actors
where birthdate like '____-08-__';  -- where middle is 08 whoever born on 08 month
select * from actors
where namea like '__ham%'; -- where exist ham  will appear . 

-- Union is not allowed dublicate , Union all is allawed dublicate
-- union is combines result two or mpre tables

select theaterID,theatername from theater
Union 
select actorId,namea from Actors;

--  views  virtual table result statment on sql 
-- fields from real table it is just to see seperate it is not real table
select * from movies;
create view price_movie as
select title,ticket
from movies;
select * from price_movie;
-- let see if we ad row can be appear automatically on column
insert into Movies(title,genre,ticket)
values('Mother','drama',7.99);

-- when i inserted it is showing ,me from id 13 , mistake 

/*1	Agent		2001-10-01		action	6.99
2	New york	2004-09-14	comedy	5.78
3	Dune		2015-01-22		Action Trailer	7.45
4	Aqua man	2023-05-07	Action trailer	6.57
5	love me 	2008-08-30	Drama	6.99
6	father		NULL		drama	6.86
13	Mother		NULL			drama	7.99
*/		

-- lets fix this		
alter table movies;
delete from Movies
 where movie_id IN (8,9,10,11,12);
 select * from Movies;

-- lets change 13 to 7

update Movies 
set movie_id =7
where movie_id =13;

-- lets add value for releaseyear where movie_id 7
update movies
set Relaesayear = '2024-07-15'
where movie_id =7; 

select * from Movies;
select * from price_movie;
-- susceesfully added automat
/*Agent	6.99
New york	5.78
Dune	7.45
Aqua man	6.57
love me 	6.99
father	6.86
[Mother	7.99]*/
select * from theater;
create view Theatermenu as
select location,theaterType
from theater;

select * from Theatermenu;

--  index using to find values specific column quickly 
select * from actors;
create index infotheater
on theater (capacity , rating, theaterType);
show index from theater;

create index  namea_Reward_index
on actors(namea,Reward);
show index from actors ;

-- subquery

select Avg (ticket ) as price
from movies;
 
 select * from showtime;
SELECT movie_id, theaterId 
FROM showtime 
WHERE StartTime > (SELECT MIN(startTime) FROM showtime);

 select ticket, title
 from movies
 where (select  avg(ticket)from theater);

-- find rezolv of 2 column from seperate table 
select namea, location
from (
    select actors.namea, theater.location
    from actors
    join theater ON actors.actorId = theater.theaterId
)  play_place;

select birthdate, title
from(select actors.birthdate , movies.title
		from actors 
        join movies on actors.actorId=movies.movie_id
		) as unknowen;
    
    -- basicly chosing from theater table  2 column 
     -- a little bit mistake i belive 
      select theatername , theaterType
      from theater
      where (select  theaterId
      from movies where movie_id =2);
      
    
      
      select * from actors;
      -- i decided to add one more foreign key on actors table
      alter table actors
      add  column  Bio_id INT ;
 
 -- adding foring  key for actors and showtime table 
	   alter table actors
    add  foreign key (actorId)references showtime(showtimeID);
    -- set values
    select * from actors
    join showtime on showtime.showtimeID;
    
    select * from  showtime;
    
    alter table actors
    add foreign key (Bio_id) references movies(movie_id);
    
-- set new column valies    
    update  actors
    set Bio_id =6
    where actorId =6;
    
    -- join with movies table
    
    select * from actors
    inner join movies on movie_id ;
    
    -- order by with asc
    select * from  actors
    order by actorId asc;
    
     -- join other variant
     
    select * from actors	
    inner join movies on actors.bio_id = movies.movie_id;

-- safe update mode
SET SQL_SAFE_UPDATES = 0;
      
      
    -- group by 
      -- aggregate  all rows by a spesific   column  often use by sum, avg ,count, min, max
      
      select count(bio_id), country
      from actors
      group by actorId;
      
      -- having is the same wiht where 
      
      select sum(ticket), relaesayear
      from Movies
      group by relaesayear
      having relaesayear is not null;
      
      select min(ticket), relaesayear, movie_id
      from Movies
      group by relaesayear, movie_id;
      
      select max(ticket), relaesayear
      from Movies
      group by relaesayear;
      
      
      -- rollup is grant total ; result of all column  adding aditional one more column
      select count(actorId), reward
      from actors
      group by Reward  with rollup;  -- showing result total actors is 6
      
      
      select sum(ticket), movie_id
      from movies
      group by movie_id  with rollup;
      
      -- on delete set Null - when delete foreign key we can s
      -- on delete cascade - delete entire row
      
      -- procedure 
     
      delimiter $$
      create procedure moviestype()
      begin
      select * from movies;
      end $$
      delimiter ;
      
      call  moviestype();
 
 delimiter $$
       create procedure actors (in  actorID int ,in namea varchar (50))
begin
select *
from actors 
where actorId = Id and namea = namea ;
end $$
      delimiter ;
      
      call  actors(1 ,'Tom Hanks');
      
      
      -- triggers - is update insert delete

-- delimeter  mark of each command end
-- before insert

delimiter ^^    -- works with triggers
create trigger  funny,       -- creating name is funny  
before insert on  movies,   -- before we inserting table movies
for each row 					-- every row
if  new.genre  < Horror then set new.genre = "This istn for children";     -- we give condition horror movie doesnt belong for children but of course we need to create one more column about age 
end if;
delimiter ^^
	
  --  lets insert
    insert into movies 
    values (8,"come to me ",2024-04-25,"Horror",8.25);
    
    select * from acrtors
   
   
   # after insert
	delimiter ^^    
create trigger  country ,        
after insert on  actors,   
for each row 
begin				
if  new.country is null  then 
insert into actors (actorId ,country)
values (new.actorId, 'defoult country ')
end if;
end ;
delimiter ^^


#before update
delimiter //
create trigger ticketprice
before update on  movies
for each row 
if new.ticket = 8 then
set new.ticket = 7.40;
elseif new.ticket <8 then
set new.ticket = 9;
end if;
end; //


update movies
set ticket  = 9;


#before delete  we using old like old.id

delomiter %%
create trigger timt
before delete on showtime
for each row
begin
insert into showtime(movie_id ,starttime)
value(old.movie_id,old.starttime);
end%%
delimiter;

delete from showtime
where movie_id =1;

select * from showtime

