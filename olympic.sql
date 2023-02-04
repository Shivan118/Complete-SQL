CREATE DATABASE OLYMPICS;

use OLYMPICS;

CREATE TABLE OLYMPICS_HISTORY(
   ID     INTEGER  NOT NULL PRIMARY KEY 
  ,Name   VARCHAR(108) NOT NULL
  ,Sex    VARCHAR(1) NOT NULL
  ,Age    VARCHAR(2) NOT NULL
  ,Height VARCHAR(3) NOT NULL
  ,Weight VARCHAR(16) NOT NULL
  ,Team   VARCHAR(47) NOT NULL
  ,NOC    VARCHAR(3) NOT NULL
  ,Games  VARCHAR(11) NOT NULL
  ,Year   INTEGER  NOT NULL
  ,Season VARCHAR(6) NOT NULL
  ,City   VARCHAR(22) NOT NULL
  ,Sport  VARCHAR(25) NOT NULL
  ,Event  VARCHAR(85) NOT NULL
  ,Medal  VARCHAR(6) NOT NULL
);
SELECT * FROM OLYMPICS_HISTORY;

CREATE TABLE region(
   NOC    VARCHAR(3) NOT NULL PRIMARY KEY
  ,region VARCHAR(32) NOT NULL
  ,notes  VARCHAR(27)
);

SELECt * FROM region;

-- 1. How many olympics games have been held?

select count(distinct games) as total_olympic_games
from olympics_history;

-- 2. Write a SQL query to list down all the Olympic Games held so far.

 select distinct year,season,city
    from olympics_history
    order by year; 

-- 3. SQL query to fetch total no of countries participated in each olympic games.

select games, nr.region
        from olympics_history oh
        join region nr ON nr.noc = oh.noc
        group by games, nr.region;
        
with all_countries as
        (select games, nr.region
        from olympics_history oh
        join region nr ON nr.noc = oh.noc
        group by games, nr.region)
select games, count(1) as total_countries
from all_countries
group by games
order by games;

-- 4 ( last ). Write a SQL query to return the Olympic Games which had the highest participating countries and the lowest participating countries.

      with all_countries as
              (select games, nr.region
              from olympics_history oh
              join region nr ON nr.noc=oh.noc
              group by games, nr.region),
          tot_countries as
              (select games, count(1) as total_countries
              from all_countries
              group by games)
      select distinct
      concat(first_value(games) over(order by total_countries)
      , ' - '
      , first_value(total_countries) over(order by total_countries)) as Lowest_Countries,
      concat(first_value(games) over(order by total_countries desc)
      , ' - '
      , first_value(total_countries) over(order by total_countries desc)) as Highest_Countries
      from tot_countries
      order by 1;
    
    -- 5. Write an SQL Query to fetch details of all Olympic Games where India won medal(s) in hockey. 
    select team, sport, games, count(1) as total_medals
    from olympics_history
    where medal <> 'NA'
    and team = 'India' and sport = 'Hockey'
    group by team, sport, games
    order by total_medals desc;

    -- 6. Write SQL Query to return the sport which has won India the highest no of medals. 

   with t1 as
        	(select sport, count(1) as total_medals
        	from olympics_history
        	where medal <> 'NA'
        	and team = 'India'
        	group by sport
        	order by total_medals desc),
        t2 as
        	(select *, rank() over(order by total_medals desc) as rnk
        	from t1)
    select sport, total_medals
    from t2
    where rnk = 1;

    -- 7. dentify the sport which were just played once in all of olympics.
            with t1 as
          	(select distinct games, sport
          	from olympics_history),
          t2 as
          	(select sport, count(1) as no_of_games
          	from t1
          	group by sport)
      select t2.*, t1.games
      from t2
      join t1 on t1.sport = t2.sport
      where t2.no_of_games = 1
      order by t1.sport;
      
      
      -- 8. Top 5 most successful countries in olympics. Success is defined by no of medals won.
    with t1 as
            (select nr.region, count(1) as total_medals
            from olympics_history oh
            join region nr on nr.noc = oh.noc
            where medal <> 'NA'
            group by nr.region
            order by total_medals desc),
        t2 as
            (select *, dense_rank() over(order by total_medals desc) as rnk
            from t1)
    select *
    from t2
    where rnk <= 5;

-- 9. Top 5 athletes who have won the most medals (gold/silver/bronze).
    with t1 as
            (select name, team, count(1) as total_medals
            from olympics_history
            where medal in ('Gold', 'Silver', 'Bronze')
            group by name, team
            order by total_medals desc),
        t2 as
            (select *, dense_rank() over (order by total_medals desc) as rnk
            from t1)
    select name, team, total_medals
    from t2
    where rnk <= 5;
    
-- 10. Top 5 athletes who have won the most gold medals.
    with t1 as
            (select name, team, count(1) as total_gold_medals
            from olympics_history
            where medal = 'Gold'
            group by name, team
            order by total_gold_medals desc),
        t2 as
            (select *, dense_rank() over (order by total_gold_medals desc) as rnk
            from t1)
    select name, team, total_gold_medals
    from t2
    where rnk <= 5;
