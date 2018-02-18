DROP TABLE IF EXISTS person_data;

create table person_data (
	id SERIAL PRIMARY KEY,
	avatar VARCHAR(100),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	gender VARCHAR(50),
	city_id VARCHAR(5)
);

insert into person_data (avatar, first_name, last_name, gender, city_id) values ('https://robohash.org/nihilquiaut.png?size=50x50&set=set1', 'Torre', 'Pinckney', 'Male', 3);
insert into person_data (avatar, first_name, last_name, gender, city_id) values ('https://robohash.org/minimaatquesunt.png?size=50x50&set=set1', 'Delmore', 'Goldspink', 'Male', 2);
insert into person_data (avatar, first_name, last_name, gender, city_id) values ('https://robohash.org/nihillaboreautem.jpg?size=50x50&set=set1', 'Katheryn', 'Poyner', 'Female', 5);
insert into person_data (avatar, first_name, last_name, gender, city_id) values ('https://robohash.org/modiutnemo.bmp?size=50x50&set=set1', 'Norry', 'Troman', 'Female', 5);
insert into person_data (avatar, first_name, last_name, gender, city_id) values ('https://robohash.org/nonabcumque.jpg?size=50x50&set=set1', 'Geno', 'Yarrell', 'Male', 2);
insert into person_data (avatar, first_name, last_name, gender, city_id) values ('https://robohash.org/nobisnihillibero.bmp?size=50x50&set=set1', 'Jessi', 'Parcells', 'Female', 4);
insert into person_data (avatar, first_name, last_name, gender, city_id) values ('https://robohash.org/perspiciatisidrepudiandae.bmp?size=50x50&set=set1', 'Gwendolin', 'Donett', 'Female', 2);
insert into person_data (avatar, first_name, last_name, gender, city_id) values ('https://robohash.org/nullaveniamperferendis.png?size=50x50&set=set1', 'Shantee', 'Spoole', 'Female', 4);
insert into person_data (avatar, first_name, last_name, gender, city_id) values ('https://robohash.org/porroquiquis.png?size=50x50&set=set1', 'Carlita', 'Thomasset', 'Female', 1);
insert into person_data (avatar, first_name, last_name, gender, city_id) values ('https://robohash.org/ipsaminciduntex.png?size=50x50&set=set1', 'Roscoe', 'Bertrand', 'Male', 1);

DROP TABLE IF EXISTS city_data;

create table city_data (
city_id SERIAL PRIMARY KEY,
city_name VARCHAR(50),
country_name VARCHAR(50),
currency VARCHAR(50),
currency_code VARCHAR(50)
);

insert into city_data (city_name, country_name, currency, currency_code) values ('Dnestrovsc', 'Moldova', 'Leu', 'MDL');
insert into city_data (city_name, country_name, currency, currency_code) values ('Panggungrejo', 'Indonesia', 'Rupiah', 'IDR');
insert into city_data (city_name, country_name, currency, currency_code) values ('Cikiruh Wetan', 'Indonesia', 'Rupiah', 'IDR');
insert into city_data (city_name, country_name, currency, currency_code) values ('Arvika', 'Sweden', 'Krona', 'SEK');
insert into city_data (city_name, country_name, currency, currency_code) values ('Eleftheroúpolis', 'Greece', 'Euro', 'EUR');
