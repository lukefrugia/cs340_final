-- USING 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE TABLE `USER`
(
  user_id INT NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(255) NOT NULL,
  balance FLOAT NOT NULL,
  PRIMARY KEY (user_id),
  UNIQUE (user_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `LEAGUE`
(
  league_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  sport VARCHAR(255) NOT NULL,
  PRIMARY KEY (league_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TEAM`
(
  team_id INT NOT NULL AUTO_INCREMENT,
  city VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  league_id INT NOT NULL,
  PRIMARY KEY (team_id),
  FOREIGN KEY (league_id) REFERENCES LEAGUE(league_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `GAME`
(
  game_id INT NOT NULL AUTO_INCREMENT,
  game_date DATE NOT NULL,
  home_team_id INT NOT NULL,
  away_team_id INT NOT NULL,
  winning_team_id INT,
  PRIMARY KEY (game_id),
  FOREIGN KEY (home_team_id) REFERENCES TEAM(team_id),
  FOREIGN KEY (away_team_id) REFERENCES TEAM(team_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ODDS`
(
  odds_id INT NOT NULL AUTO_INCREMENT,
  home_win_odds FLOAT NOT NULL,
  away_win_odds FLOAT NOT NULL,
  PRIMARY KEY (odds_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `BETS_ON`
(
  bet_id INT NOT NULL AUTO_INCREMENT,
  bet_type VARCHAR(255) NOT NULL,
  bet_date DATE NOT NULL,
  bet_amount FLOAT NOT NULL,
  payout FLOAT NOT NULL,
  user_id INT NOT NULL,
  odds_id INT NOT NULL,
  PRIMARY KEY (bet_id),
  FOREIGN KEY (user_id) REFERENCES USER(user_id),
  FOREIGN KEY (odds_id) REFERENCES ODDS(odds_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `USER` (user_name, balance) VALUES
('Luke', 1000000.50),
('Bob', 200.00),
('Charlie', 150.75),
('David', 300.40),
('Eve', 250.00),
('Frank', 180.25),
('Grace', 220.00),
('Hank', 190.90),
('Ivy', 160.10),
('Jack', 275.60);

INSERT INTO `LEAGUE` (league_id, name, sport) VALUES
(1, 'NCAA Football', 'Football'),
(2, 'National Football League', 'Football');

INSERT INTO `TEAM` (team_id, city, name, league_id) VALUES
(1, 'Corvallis', 'Oregon State Beavers', 1),  -- NCAA Football
(2, 'Pocatello', 'Idaho State Bengals', 1),
(3, 'San Diego', 'San Diego State Aztecs', 1),
(4, 'Eugene', 'Oregon Ducks', 1),
(5, 'West Lafayette', 'Purdue Boilermakers', 1),
(6, 'Fort Collins', 'Colorado State Rams', 1),
(7, 'Reno', 'Nevada Wolf Pack', 1),
(8, 'Las Vegas', 'UNLV Rebels', 1),
(9, 'Berkeley', 'California Golden Bears', 1),
(10, 'San Jose', 'San Jose State Spartans', 1),
(11, 'Colorado Springs', 'Air Force Falcons', 1),
(12, 'Pullman', 'Washington State Cougars', 1),
(13, 'Boise', 'Boise State Broncos', 1);

INSERT INTO `GAME` (game_id, game_date, home_team_id, away_team_id) VALUES
(1, '2024-08-31', 1, 2),  -- Oregon State Beavers vs. Idaho State Bengals
(2, '2024-09-07', 3, 1),  -- San Diego State Aztecs vs. Oregon State Beavers
(3, '2024-09-14', 1, 4),  -- Oregon State Beavers vs. Oregon Ducks
(4, '2024-09-21', 1, 5),  -- Oregon State Beavers vs. Purdue Boilermakers
(5, '2024-10-05', 1, 6),  -- Oregon State Beavers vs. Colorado State Rams
(6, '2024-10-12', 7, 1),  -- Nevada Wolf Pack vs. Oregon State Beavers
(7, '2024-10-19', 1, 8),  -- Oregon State Beavers vs. UNLV Rebels
(8, '2024-10-26', 9, 1),  -- California Golden Bears vs. Oregon State Beavers
(9, '2024-11-09', 1, 10), -- Oregon State Beavers vs. San Jose State Spartans
(10, '2024-11-16', 11, 1), -- Air Force Falcons vs. Oregon State Beavers
(11, '2024-11-23', 1, 12), -- Oregon State Beavers vs. Washington State Cougars
(12, '2024-11-30', 13, 1); -- Boise State Broncos vs. Oregon State Beavers

INSERT INTO `ODDS` (odds_id, home_win_odds, away_win_odds) VALUES
(1, 1.80, 2.00),
(2, 1.70, 2.10),
(3, 1.75, 2.05),
(4, 1.60, 2.20),
(5, 1.50, 2.50),
(6, 1.45, 2.60),
(7, 1.55, 2.40),
(8, 1.65, 2.30),
(9, 1.60, 2.20),
(10, 1.70, 2.10),
(11, 1.75, 2.05),
(12, 1.55, 2.40);

INSERT INTO `BETS_ON` (bet_id, bet_type, bet_date, bet_amount, user_id, odds_id) VALUES
(1, 'Home Win', '2024-01-01', 50.00, 1, 1),
(2, 'Away Win', '2024-01-02', 30.00, 2, 2),
(3, 'Home Win', '2024-01-03', 20.00, 3, 3),
(4, 'Away Win', '2024-01-04', 40.00, 4, 4),
(5, 'Home Win', '2024-01-05', 60.00, 5, 5),
(6, 'Away Win', '2024-01-06', 25.00, 6, 6),
(7, 'Home Win', '2024-01-07', 35.00, 7, 7),
(8, 'Away Win', '2024-01-08', 45.00, 8, 8),
(9, 'Home Win', '2024-01-09', 55.00, 9, 9),
(10, 'Away Win', '2024-01-10', 65.00, 10, 10);

DELIMITER //

CREATE TRIGGER after_bet
AFTER INSERT ON BETS_ON
FOR EACH ROW
BEGIN
	UPDATE `USER`
    SET balance = balance - NEW.bet_amount
    WHERE user_id = NEW.user_id;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION calculate_payout(bet_amount FLOAT, odds FLOAT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE payout FLOAT;
    SET payout = bet_amount * odds;
    RETURN payout;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE determine_payout(IN bet_id INT)
BEGIN
	DECLARE bet_amount FLOAT;
    DECLARE bet_type VARCHAR(255);
    DECLARE odds FLOAT;
    DECLARE payout FLOAT;
    DECLARE user_id INT;
    
    SELECT bet_amount, bet_type, odds_id, user_id
    INTO bet_amount, bet_type, odds, user_id
    FROM BETS_ON
    WHERE bet_id = bet_id;
    
    IF bet_type = 'Home Win' THEN
		SELECT home_win_odds INTO odds from ODDS WHERE odds_id = odds;
	ELSEIF bet_type = 'Away Win' THEN
		SELECT away_win_odds INTO odds FROM ODDS WHERE odds_id = odds;
	END IF;
    
    SET payout = calculate_payout(bet_amount, odds);
    
    UPDATE BETS_ON
    SET payout = payout
    WHERE bet_id = bet_id;
    
    UPDATE `USER`
    SET balance = balance + payout
    WHERE user_id = user_id;
END //

DELIMITER ;