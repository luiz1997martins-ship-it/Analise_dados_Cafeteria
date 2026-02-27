create table coffee.coffee_sales (
	hour_of_day int,	
	cash_type varchar (10),
	money int,
	coffee_name varchar (20),
	Time_of_Day varchar (10),
	Weekday varchar (3),
	Month_name varchar (3),
	Weekdaysort int,
	Monthsort int,
	sale_date date,
	sale_time time
);

alter table coffee.coffee_sales
alter column money type numeric;

select * from coffee.coffee_sales

-- Vendas por período
select 
	time_of_day,
	sum(money) as lucro_por_periodo
from coffee.coffee_sales
group by time_of_day

-- Cafés mais vendidos
select
	coffee_name,
	count(coffee_name) as qtd_vendas_cafés
from coffee.coffee_sales
group by coffee_name
order by count(coffee_name) desc

-- Dia da semana de maior venda
select 
	weekday,
	count(weekday) as qtd_vendas_semana
from coffee.coffee_sales
group by weekday
order by count(weekday)desc

-- Horário de "pico"
select 
	hour_of_day,
	count(hour_of_day) as qtd_pedidos_por_hora
from coffee.coffee_sales
group by hour_of_day
order by count(hour_of_day) desc 
limit 5

-- Total de Vendas
select
	sum(money) as total_vendas
from coffee.coffee_sales

-- Vendas por tamanho do Copo

alter table coffee.coffee_sales
add column type_coffee varchar(20)

update coffee.coffee_sales
set type_coffee = 
	case
		when money = 38.7 and coffee_name = 'Latte' then 'Extra Grande'
		when money = 32.82 and coffee_name = 'Latte' then 'Pequeno'
		when money = 35.76 and coffee_name = 'Latte' then 'Médio'
		when money = 37.72 and coffee_name = 'Latte' then 'Grande'
		when money = 38.7 and coffee_name = 'Hot Chocolate' then 'Extra Grande'
		when money = 32.82 and coffee_name = 'Hot Chocolate' then 'Pequeno'
		when money = 35.76 and coffee_name = 'Hot Chocolate' then 'Médio'
		when money = 37.72 and coffee_name = 'Hot Chocolate' then 'Grande'
		when money = 33.8 and coffee_name = 'Americano with Milk' then 'Extra Grande'
		when money = 32.82 and coffee_name = 'Americano with Milk' then 'Grande'
		when money = 30.86 and coffee_name = 'Americano with Milk' then 'Médio'
		when money = 27.92 and coffee_name = 'Americano with Milk' then 'Pequeno'
		when money = 25.96 and coffee_name = 'Americano' then 'Médio'
		when money = 28.9 and coffee_name = 'Americano' then 'Extra Grande'
		when money = 23.02 and coffee_name = 'Americano' then 'Pequeno'
		when money = 27.92 and coffee_name = 'Americano' then 'Grande'
		when money = 38.7 and coffee_name = 'Cocoa' then 'Extra Grande'
		when money = 32.82 and coffee_name = 'Cocoa' then 'Pequeno'
		when money = 35.76 and coffee_name = 'Cocoa' then 'Médio'
		when money = 37.72 and coffee_name = 'Cocoa' then 'Grande'
		when money = 25.96 and coffee_name = 'Cortado' then 'Médio'
		when money = 28.9 and coffee_name = 'Cortado' then 'Extra Grande'
		when money = 23.02 and coffee_name = 'Cortado' then 'Pequeno'
		when money = 27.92 and coffee_name = 'Cortado' then 'Grande'
		when money = 23.02 and coffee_name = 'Espresso' then 'Grande'
		when money = 24.0 and coffee_name = 'Espresso' then 'Extra Grande'
		when money = 21.06 and coffee_name = 'Espresso' then 'Médio'
		when money = 18.12 and coffee_name = 'Espresso' then 'Pequeno'
		when money = 38.7 and coffee_name = 'Cappuccino' then 'Extra Grande'
		when money = 32.82 and coffee_name = 'Cappuccino' then 'Pequeno'
		when money = 35.76 and coffee_name = 'Cappuccino' then 'Médio'
		when money = 37.72 and coffee_name = 'Cappuccino' then 'Grande'
		end;

-- CRIAÇÃO DE VIEW

-- Tabela completa para view
create or replace view coffee.vw_coffe_vendas as
select
	hour_of_day,
	cash_type,
	money::numeric (10,2) as valor_vendas,
	coffee_name,
	time_of_day,
	weekday,
	month_name,
	weekdaysort,
	monthsort,
	sale_date::date,
	sale_time::time,
	type_coffee
from coffee.coffee_sales;
