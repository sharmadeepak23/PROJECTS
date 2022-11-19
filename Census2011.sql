create database project;

use project;

select * from dataset1;

#number of rows into our dataset

select count(*) from dataset1;

#dataset for jharkhand and bihar

select * from dataset1 where state in ('Jharkhand' ,'Bihar');

# overall literacy rate of India

select sum(Literacy) as Overall_literacy from dataset1;

#average growth 

select state,round(avg(growth)*100,0) as avg_growth from dataset1 group by state;

#average sex ratio

select state,round(avg(sex_ratio),0) as avg_sex_ratio from dataset1 group by state order by avg_sex_ratio desc;

#average literacy rate

select state,round(avg(literacy),0) as avg_literacy_ratio from dataset1 
group by state having round(avg(literacy),0)>90 order by avg_literacy_ratio desc;

#top 3 state showing highest growth ratio

select state,round(avg(growth)*100,0) as avg_growth from dataset1 
group by state order by avg_growth desc limit 3;

#bottom 3 state showing lowest sex ratio

select state,round(avg(sex_ratio),0) as avg_sex_ratio from dataset1
 group by state order by avg_sex_ratio asc limit 3;
 
 #top and bottom 3 states in literacy state
 #drop if the table exist #top_states
 #topstates
 
  create table top_states(
  state varchar(255),
  topstates float
  );
  
  insert into top_states(
  select state,round(avg(literacy),0) as avg_literacy_ratio from dataset1 
group by state order by avg_literacy_ratio desc);

select * from top_states order by top_states.topstates desc limit 3;

#bottom 3 states in literacy state
 #drop if the table is exist #bottom_states
  create table bottom_states(
  state varchar(255),
  bottomstates float
  );
  
  insert into bottom_states(
  select state,round(avg(literacy),0) as avg_literacy_ratio from dataset1 
group by state order by avg_literacy_ratio desc);

select * from bottom_states order by bottom_states.bottomstates asc limit 3;

#union 
select * from(
select * from top_states order by top_states.topstates desc limit 3) a

union
select * from(
select * from bottom_states order by bottom_states.bottomstates asc limit 3) b;

# states starting with letter a and b

select  distinct state from dataset1 where lower(state) like 'a%' or lower(state) like 'b%';

#states starting with letter a and ending with m

select  distinct state from dataset1 where lower(state) like 'a%' and lower(state) like '%m';















  
  
  
  
 
 
 












