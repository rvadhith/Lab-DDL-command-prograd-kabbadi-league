-- PROGRESSION - 1


-- 1. **Create table city**
CREATE TABLE City(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT City_PK PRIMARY KEY(id)
);

-- 2. **Create table referee**
CREATE TABLE Referee(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT Referee_PK PRIMARY KEY(id)
);
-- 3. **Create table innings**
CREATE TABLE innings(
id NUMBER(11),
innings_number NUMBER(11)NOT NULL,
CONSTRAINT innings_PK PRIMARY KEY(id)
);
-- 4. **Create table extra_type**
CREATE TABLE extra_type(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT extra_type_PK PRIMARY KEY(id)
);
-- 5. **Create table skill**
CREATE TABLE skill(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT skill_PK PRIMARY KEY(id)
);
-- 6. **Create table team**
CREATE TABLE team(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
coach VARCHAR(50) NOT NULL,
home_city NUMBER(11),
captain NUMBER(11) NOT NULL,
CONSTRAINT home_city_FK FOREIGN KEY (home_city) REFERENCES City(id),
CONSTRAINT team_PK PRIMARY KEY(id)
);
-- 7. **Create table player**
CREATE TABLE player(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
skill_id NUMBER(11),
team_id NUMBER(11),
CONSTRAINT skill_id_FK FOREIGN KEY (skill_id) REFERENCES skill(id),
CONSTRAINT team_id_FK FOREIGN KEY (team_id) REFERENCES team(id),
CONSTRAINT player_PK PRIMARY KEY(id)
);
-- 8. **Create table venue**
CREATE TABLE venue(
id NUMBER(11),
stadium_name VARCHAR(50) NOT NULL,
city_id NUMBER(11),
CONSTRAINT city_id_FK FOREIGN KEY (city_id) REFERENCES City(id),
CONSTRAINT venue_PK PRIMARY KEY(id)
);
-- 9. **Create table event**
CREATE TABLE event(
id NUMBER(11),
stadium_name VARCHAR(50) NOT NULL,
innings_id NUMBER(11),
event_no NUMBER(11) NOT NULL,
raider_id NUMBER(11),
raid_points NUMBER(11) NOT NULL,
defending_points NUMBER(11) NOT NULL,
clock_in_seconds NUMBER(11) NOT NULL,
team_one_score NUMBER(11) NOT NULL,
team_two_score NUMBER(11) NOT NULL,
CONSTRAINT innings_id_FK FOREIGN KEY (innings_id) REFERENCES innings(id),
CONSTRAINT raider_id_FK FOREIGN KEY (raider_id) REFERENCES player(id),
CONSTRAINT event_PK PRIMARY KEY(id)
);
-- 10. **Create table extra_event**
CREATE TABLE extra_event(
id NUMBER(11),
event_id NUMBER(11),
extra_type_id NUMBER(11),
points NUMBER(11) NOT NULL,
scoring_team_id NUMBER(11),
CONSTRAINT event_id_FK FOREIGN KEY (event_id) REFERENCES event(id),
CONSTRAINT extra_type_id_FK FOREIGN KEY (extra_type_id) REFERENCES extra_type(id),
CONSTRAINT scoring_team_id_FK FOREIGN KEY (scoring_team_id) REFERENCES team(id),
CONSTRAINT extra_event_PK PRIMARY KEY(id)
);
-- 11. **Create table outcome**
CREATE TABLE outcome(
id NUMBER(11),
status VARCHAR(100),
winner_team_id NUMBER(11),
score NUMBER(11),
player_of_match NUMBER(11),
CONSTRAINT winner_team_id_FK FOREIGN KEY (winner_team_id) REFERENCES team(id),
CONSTRAINT player_of_match_FK FOREIGN KEY (player_of_match) REFERENCES player(id),
CONSTRAINT outcome_PK PRIMARY KEY(id)
);
-- 12. **Create table game**
CREATE TABLE game(
id NUMBER(11),
game_date DATE,
team_id_1 NUMBER(11),
team_id_2 NUMBER(11),
venue_id NUMBER(11),
outcome_id NUMBER(11),
referee_id_1 NUMBER(11),
referee_id_2 NUMBER(11),
first_innings_id NUMBER(11),
second_innings_id NUMBER(11),
CONSTRAINT team_id_1_FK FOREIGN KEY (team_id_1) REFERENCES team(id),
CONSTRAINT team_id_2_FK FOREIGN KEY (team_id_2) REFERENCES team(id),
CONSTRAINT venue_id_FK FOREIGN KEY (venue_id) REFERENCES venue(id),
CONSTRAINT outcome_id_FK FOREIGN KEY (outcome_id) REFERENCES outcome(id),
CONSTRAINT referee_id_1_FK FOREIGN KEY (referee_id_1) REFERENCES referee(id),
CONSTRAINT referee_id_2_FK FOREIGN KEY (referee_id_2) REFERENCES referee(id),
CONSTRAINT first_innings_id_FK FOREIGN KEY (first_innings_id) REFERENCES innings(id),
CONSTRAINT second_innings_id_FK FOREIGN KEY (second_innings_id) REFERENCES innings(id),
CONSTRAINT game_PK PRIMARY KEY(id)
);

-- 13. **Drop table city**
ALTER TABLE venue
DROP CONSTRAINT city_id_FK;
ALTER TABLE team
DROP CONSTRAINT home_city_FK;
DROP TABLE City;
-- 14. **Drop table innings**
ALTER TABLE event
DROP CONSTRAINT innings_id_FK;
ALTER TABLE game
DROP CONSTRAINT first_innings_id_FK;
ALTER TABLE game
DROP CONSTRAINT second_innings_id_FK;
DROP TABLE innings;
-- 15. **Drop table skill**
ALTER TABLE player
DROP CONSTRAINT skill_id_FK;
DROP TABLE skill;
-- 16. **Drop table extra_type**
DROP TABLE extra_type;