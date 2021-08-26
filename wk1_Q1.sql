#How many airplanes have listed speeds? What are the min and max speeds?
select count(speed) from planes
where speed > 0; #23

select min(speed) from planes
where speed > 0; #90

select max(speed) from planes
where speed > 0; #432

/*What is the total distance flown by all planes in 2013? What is the total distance flown by all of
the planes in January 2013 where the tailnum is
missing?*/

select sum(distance) from flights
where year = 2013; #343180156

select * from flights
where tailnum is null; #1784167

/*What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? 
Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare? */

select sum(distance), manufacturer from flights 
inner join planes on flights.tailnum = planes.tailnum 
where month=7 and day=5 and flights.year=2013 
group by manufacturer; #1526 Cessna, 1089 Douglas

select sum(distance), manufacturer from flights 
left outer join planes on flights.tailnum = planes.tailnum 
where month=7 and day=5 and flights.year=2013 
group by manufacturer; 

#the results were similar, but I received an extra distance sum for some reason.

/*Write and answer at least one question of your own choosing that joins information from at least three of
the tables in the flights database.*/

#Show wind speeds that carriers faced in July

SELECT airlines.carrier, flights.month, weather.wind_speed FROM flights
JOIN airlines ON flights.carrier = airlines.carrier 
JOIN weather ON flights.month = weather.month
WHERE weather.wind_speed > 10 and flights.month = 7;

Part 2
select carrier, sum(distance) from flights
where year = 2013
group by carrier;

Tableau Link : https://public.tableau.com/app/profile/alex.miller8311/viz/CarrierDistancesin2013/Sheet1?publish=yes

