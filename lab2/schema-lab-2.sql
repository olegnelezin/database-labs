INSERT INTO country (name) VALUES
('USA'),
('Spain'),
('Germany'),
('Brazil'),
('Italy');

INSERT INTO owner (name, surname, patronymic) VALUES
('John', 'Doe', 'Smith'),
('Anna', 'Ivanova', NULL),
('Carlos', 'Fernandez', NULL),
('Maria', 'Rossi', 'Giovanni'),
('David', 'Johnson', NULL);

INSERT INTO club (country_id, name) VALUES
((SELECT country_id FROM country WHERE name = 'USA'),
'New York FC'),
((SELECT country_id FROM country WHERE name = 'USA'),
'Los Angeles Galaxy'),
((SELECT country_id FROM country WHERE name = 'Spain'),
'FC Barcelona'),
((SELECT country_id FROM country WHERE name = 'Germany'),
'Bayern Munich'),
((SELECT country_id FROM country WHERE name = 'Brazil'),
'Sao Paulo FC');

INSERT INTO owner_club (owner_id, club_id) VALUES
((SELECT owner_id FROM owner WHERE name = 'John' AND surname = 'Doe'),
(SELECT club_id FROM club WHERE name = 'New York FC')),
((SELECT owner_id FROM owner WHERE name = 'Anna' AND surname = 'Ivanova'),
(SELECT club_id FROM club WHERE name = 'FC Barcelona')),
((SELECT owner_id FROM owner WHERE name = 'Carlos' AND surname = 'Fernandez'),
(SELECT club_id FROM club WHERE name = 'Sao Paulo FC')),
((SELECT owner_id FROM owner WHERE name = 'Maria' AND surname = 'Rossi'),
(SELECT club_id FROM club WHERE name = 'Los Angeles Galaxy')),
((SELECT owner_id FROM owner WHERE name = 'David' AND surname = 'Johnson'),
(SELECT club_id FROM club WHERE name = 'Bayern Munich'));

INSERT INTO training_base (name, address, filed_count) VALUES
('Base A', '123 Main St, NY', 5),
('Base B', '456 Elm St, LA', 4),
('Base C', '789 Pine St, Madrid', 6),
('Base D', '101 Maple St, Berlin', 3),
('Base E', '202 Oak St, Sao Paulo', 8);

INSERT INTO camp (training_base_id, start_date, end_date, club_id) VALUES
((SELECT base_id FROM training_base WHERE name = 'Base A'),
'2024-01-15', '2024-01-30',
(SELECT club_id FROM club WHERE name = 'New York FC')),
((SELECT base_id FROM training_base WHERE name = 'Base B'),
'2024-02-05', '2024-02-20',
(SELECT club_id FROM club WHERE name = 'Los Angeles Galaxy')),
((SELECT base_id FROM training_base WHERE name = 'Base C'),
'2024-03-01', '2024-03-15',
(SELECT club_id FROM club WHERE name = 'FC Barcelona')),
((SELECT base_id FROM training_base WHERE name = 'Base D'),
'2024-04-10', '2024-04-20',
(SELECT club_id FROM club WHERE name = 'Bayern Munich')),
((SELECT base_id FROM training_base WHERE name = 'Base E'),
'2024-05-01', '2024-05-15',
(SELECT club_id FROM club WHERE name = 'Sao Paulo FC'));

INSERT INTO team (name, rating, club_id) VALUES
('Team A', 85.5,
(SELECT club_id FROM club WHERE name = 'New York FC')),
('Team B', 90.0,
(SELECT club_id FROM club WHERE name = 'Los Angeles Galaxy')),
('Team C', 88.0,
(SELECT club_id FROM club WHERE name = 'FC Barcelona')),
('Team D', 92.0,
(SELECT club_id FROM club WHERE name = 'Bayern Munich')),
('Team E', 86.0,
(SELECT club_id FROM club WHERE name = 'Sao Paulo FC'));

INSERT INTO contract (unique_number, start_date, end_date, conclusion_date) VALUES
(1, '2023-01-01', '2024-01-01', '2023-01-01'),
(2, '2023-05-01', '2025-05-01', '2023-05-01'),
(3, '2024-03-15', '2026-03-15', '2024-03-15'),
(4, '2024-06-01', '2026-06-01', '2024-06-01'),
(5, '2024-07-01', '2025-07-01', '2024-07-01');

INSERT INTO player (name, surname, patronymic, date_of_birth, goals_score, batted_balls_score, contract_id, team_id) VALUES
('Lionel', 'Messi', 'Andres', '1987-06-24', 700, 0, 1,
(SELECT team_id FROM team WHERE name = 'Team A')),
('Cristiano', 'Ronaldo', 'Luiz', '1985-02-05', 800, 0, 2,
(SELECT team_id FROM team WHERE name = 'Team B')),
('Neymar', 'Jr.', NULL, '1992-02-05', 300, 0, 3,
(SELECT team_id FROM team WHERE name = 'Team C')),
('Kylian', 'Mbappe', NULL, '1998-12-20', 250, 0, 4,
(SELECT team_id FROM team WHERE name = 'Team D')),
('Kevin', 'De Bruyne', NULL, '1991-06-28', 100, 0, 5,
(SELECT team_id FROM team WHERE name = 'Team E'));

INSERT INTO position (name) VALUES
('Forward'),
('Midfielder'),
('Defender'),
('Goalkeeper'),
('Wing');

INSERT INTO personal (name, surname, patronymic, gender, date_of_birth, position_id, salary, contract_id, team_id) VALUES
('Alex', 'Johnson', 'Smith', 'm', '1990-05-20',
(SELECT position_id FROM position WHERE name = 'Forward'),
50000, 1,
(SELECT team_id FROM team WHERE name = 'Team A')),
('Emily', 'Davis', 'Anne', 'w', '1985-11-15',
(SELECT position_id FROM position WHERE name = 'Midfielder'),
60000, 2,
(SELECT team_id FROM team WHERE name = 'Team B')),
('Michael', 'Brown', 'Lee', 'm', '1978-08-08',
(SELECT position_id FROM position WHERE name = 'Defender'),
55000, 3,
(SELECT team_id FROM team WHERE name = 'Team C')),
('Sara', 'Wilson', 'Jane', 'w', '1992-09-30',
(SELECT position_id FROM position WHERE name = 'Goalkeeper'),
52000, 4,
(SELECT team_id FROM team WHERE name = 'Team D')),
('Tom', 'Taylor', 'Adam', 'm', '1989-03-15',
(SELECT position_id FROM position WHERE name = 'Wing'),
48000, 5,
(SELECT team_id FROM team WHERE name = 'Team E'));

INSERT INTO competition (start_date, end_date, name, prize, place) VALUES
('2024-06-01', '2024-07-01', 'World Cup', 3000000, 'Qatar'),
('2024-04-01', '2024-05-01', 'European Championship', 1500000, 'Germany'),
('2024-05-01', '2024-06-01', 'Copa America', 1200000, 'Brazil'),
('2024-03-01', '2024-03-30', 'Champions League', 2500000, 'Europe'),
('2024-02-01', '2024-02-29', 'FIFA Club World Cup', 800000, 'Japan');

INSERT INTO stadium (name, address, coverage_type, seats_count) VALUES
('Stadium A', '123 Field Rd, NY', 'Grass', 50000),
('Stadium B', '456 Park Ave, LA', 'Artificial', 60000),
('Stadium C', '789 Main St, Madrid', 'Grass', 55000),
('Stadium D', '101 First St, Berlin', 'Grass', 75000),
('Stadium E', '202 Second St, Sao Paulo', 'Artificial', 70000);

INSERT INTO match_type (name) VALUES
('Friendly'),
('Championship'),
('Cup'),
('League'),
('International');

INSERT INTO season (name) VALUES
('2023/2024'),
('2024/2025'),
('2025/2026'),
('2026/2027'),
('2027/2028');

INSERT INTO match (match_date, match_time, season_id, team1_id, team2_id, match_type_id, competition_id, stadium_id) VALUES
('2024-06-10', '18:00:00',
(SELECT season_id FROM season WHERE name = '2023/2024'),
(SELECT team_id FROM team WHERE name = 'Team A'),
(SELECT team_id FROM team WHERE name = 'Team B'),
(SELECT match_type_id FROM match_type WHERE name = 'Friendly'),
(SELECT comp_id FROM competition WHERE name = 'World Cup'),
(SELECT stadium_id FROM stadium WHERE name = 'Stadium A')),
('2024-06-12', '20:00:00',
(SELECT season_id FROM season WHERE name = '2023/2024'),
(SELECT team_id FROM team WHERE name = 'Team B'),
(SELECT team_id FROM team WHERE name = 'Team C'),
(SELECT match_type_id FROM match_type WHERE name = 'Championship'),
(SELECT comp_id FROM competition WHERE name = 'European Championship'),
(SELECT stadium_id FROM stadium WHERE name = 'Stadium B')),
('2024-06-15', '17:00:00',
(SELECT season_id FROM season WHERE name = '2023/2024'),
(SELECT team_id FROM team WHERE name = 'Team C'),
(SELECT team_id FROM team WHERE name = 'Team D'),
(SELECT match_type_id FROM match_type WHERE name = 'Cup'),
(SELECT comp_id FROM competition WHERE name = 'Copa America'),
(SELECT stadium_id FROM stadium WHERE name = 'Stadium C')),
('2024-06-18', '19:00:00',
(SELECT season_id FROM season WHERE name = '2023/2024'),
(SELECT team_id FROM team WHERE name = 'Team D'),
(SELECT team_id FROM team WHERE name = 'Team E'),
(SELECT match_type_id FROM match_type WHERE name = 'League'),
(SELECT comp_id FROM competition WHERE name = 'Champions League'),
(SELECT stadium_id FROM stadium WHERE name = 'Stadium D')),
('2024-06-20', '16:00:00',
(SELECT season_id FROM season WHERE name = '2023/2024'),
(SELECT team_id FROM team WHERE name = 'Team E'),
(SELECT team_id FROM team WHERE name = 'Team A'),
(SELECT match_type_id FROM match_type WHERE name = 'International'),
(SELECT comp_id FROM competition WHERE name = 'FIFA Club World Cup'),
(SELECT stadium_id FROM stadium WHERE name = 'Stadium E'));
