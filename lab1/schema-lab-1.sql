create table country (
	country_id integer not null,
	name varchar(100) not null,
	constraint pk_country primary key (country_id)
);

create table owner (
	owner_id integer not null,
	name varchar(100) not null,
	surname varchar(200) not null,
	patronymic varchar(200),
	constraint pk_owner primary key (owner_id)
);

create table club (
	club_id integer not null,
	country_id integer not null,
	name varchar(100) not null,
	constraint pk_club primary key (club_id)
);

alter table club
	add constraint fk_club_on_country foreign key (country_id) references country (country_id);

create table owner_club (
    owner_id integer not null,
    club_id integer not null,
    primary key (owner_id, club_id)
);

alter table owner_club
    add constraint fk_owner_club_on_owner foreign key (owner_id) references owner (owner_id),
    add constraint fk_owner_club_on_club foreign key (club_id) references club (club_id);

create table training_base (
	base_id integer not null,
	name varchar(100) not null,
	address varchar(200) not null,
	filed_count integer not null,
	constraint pk_base_id primary key (base_id)
);

alter table training_base
    add constraint training_base_unique_address unique (address);

create table camp (
	camp_id integer not null,
	training_base_id integer not null,
	start_date date not null,
	end_date date not null,
	club_id integer not null,
	constraint pk_camp primary key (camp_id)
);

alter table camp
    add constraint fk_camp_on_training_base foreign key (training_base_id) references training_base (base_id),
    add constraint fk_camp_on_club foreign key (club_id) references club (club_id);

create table team (
	team_id integer not null,
	name varchar(100) not null,
	rating double precision not null,
	club_id integer not null,
	constraint pk_team_id primary key (team_id)
);

alter table team
    add constraint fk_team_on_club foreign key (club_id) references club (club_id);

create table contract (
	unique_number integer not null,
	start_date date not null,
	end_date date not null,
	conclusion_date date not null,
	constraint pk_unique_number primary key (unique_number)
);

create table player (
	player_id integer not null,
	name varchar(100) not null,
	surname varchar(200) not null,
	patronymic varchar(200),
	date_of_birth date not null,
	goals_score integer not null,
	batted_balls_score integer not null,
	contract_id integer not null,
	team_id integer not null,
	constraint pk_player_id primary key (player_id)
);

alter table player
    add constraint fk_player_on_contract foreign key (contract_id) references contract (unique_number),
    add constraint fk_player_on_team foreign key (team_id) references team (team_id);

create table position (
	position_id integer not null,
	name varchar(30) not null,
	constraint pk_position_id primary key (position_id)
);

create table personal (
	personal_id integer not null,
	name varchar(100) not null,
	surname varchar(200) not null,
	patronymic varchar(200),
	gender char not null,
	date_of_birth date not null,
	position_id integer not null,
	salary double precision not null,
	contract_id integer not null,
	team_id integer not null,
	constraint pk_personal_id primary key (personal_id)
);

alter table personal
    add constraint fk_personal_on_position foreign key (position_id) references position (position_id),
    add constraint fk_personal_on_contract foreign key (contract_id) references contract (unique_number),
    add constraint fk_personal_on_team foreign key (team_id) references team (team_id),
    add constraint personal_check_gender check (gender = 'm' or gender = 'w');

create table competition (
	comp_id integer not null,
	start_date date not null,
	end_date date not null,
	name varchar(100) not null,
	prize double precision not null,
	place varchar(100) not null,
	constraint pk_comp_id primary key (comp_id)
);

create table stadium (
	stadium_id integer not null,
	name varchar(100) not null,
	address varchar(100) not null,
	coverage_type varchar(40) not null,
	seats_count integer not null,
	constraint pk_stadium_id primary key (stadium_id)
);

alter table stadium
    add constraint stadium_unique_name unique (name),
    add constraint stadium_unique_address unique (address),
    add constraint stadium_check_seats_count check (seats_count > 0 and seats_count < 1000000);

create table match_type (
	match_type_id integer not null,
	name varchar(30) not null,
	constraint pk_match_type_id primary key (match_type_id)
);

alter table match_type
    add constraint match_type_unique_name unique (name);

create table season (
	season_id integer not null,
	name varchar(100) not null,
	constraint pk_season_id primary key (season_id)
);

create table match (
	match_number integer not null,
	match_date date not null,
	match_time time not null,
	season_id integer not null,
	team1_id integer not null,
	team2_id integer not null,
	match_type_id integer not null,
	competition_id integer not null,
	stadium_id integer not null,
	constraint pk_match_number primary key (match_number)
);

alter table match
    add constraint fk_match_on_season foreign key (season_id) references season (season_id),
    add constraint fk_match_on_team1 foreign key (team1_id) references team (team_id),
    add constraint fk_match_on_team2 foreign key (team2_id) references team (team_id),
    add constraint fk_match_on_match_type foreign key (match_type_id) references match_type (match_type_id),
    add constraint fk_match_on_competition foreign key (competition_id) references competition (comp_id),
    add constraint fk_match_on_stadium foreign key (stadium_id) references stadium (stadium_id);
