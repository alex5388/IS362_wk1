#How many airplanes have listed speeds? What are the min and max speeds?
select count(speed) from planes
where speed > 0; #23

select min(speed) from planes
where speed > 0; #90

select max(speed) from planes
where speed > 0; #432
