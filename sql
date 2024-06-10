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
(1, 'ACC', 'Football'), 
(2, 'American Athletic', 'Football'), 
(3, 'Big 12', 'Football'), 
(4, 'Big Ten', 'Football'), 
(5, 'Conference USA', 'Football'), 
(6, 'FBS Independents', 'Football'), 
(7, 'Mid-American', 'Football'), 
(8, 'Mountain West', 'Football'), 
(9, 'Pac-12', 'Football');

INSERT INTO `TEAM` (team_id, city, name, league_id) VALUES
(2005, 'Air Force', 'Falcons', 8),
(2006, 'Akron', 'Zips', 7),
(12, 'Arizona', 'Wildcats', 9),
(9, 'Arizona State', 'Sun Devils', 9),
(349, 'Army', 'Black Knights', 6),
(2050, 'Ball State', 'Cardinals', 7),
(239, 'Baylor', 'Bears', 3),
(68, 'Boise State', 'Broncos', 8),
(103, 'Boston College', 'Eagles', 1),
(189, 'Bowling Green', 'Falcons', 7),
(2084, 'Buffalo', 'Bulls', 7),
(252, 'BYU', 'Cougars', 3),
(25, 'California', 'Golden Bears', 9),
(2117, 'Central Michigan', 'Chippewas', 7),
(2429, 'Charlotte', '49ers', 2),
(2132, 'Cincinnati', 'Bearcats', 3),
(228, 'Clemson', 'Tigers', 1),
(38, 'Colorado', 'Buffaloes', 9),
(36, 'Colorado State', 'Rams', 8),
(41, 'Connecticut', 'Huskies', 6),
(150, 'Duke', 'Blue Devils', 1),
(151, 'East Carolina', 'Pirates', 2),
(2199, 'Eastern Michigan', 'Eagles', 7),
(2226, 'Florida Atlantic', 'Owls', 2),
(2229, 'Florida International', 'Golden Panthers', 5),
(52, 'Florida State', 'Seminoles', 1),
(278, 'Fresno State', 'Bulldogs', 8),
(59, 'Georgia Tech', 'Yellow Jackets', 1),
(62, 'Hawaii', 'Rainbow Warriors', 8),
(248, 'Houston', 'Cougars', 3),
(356, 'Illinois', 'Fighting Illini', 4),
(84, 'Indiana', 'Hoosiers', 4),
(2294, 'Iowa', 'Hawkeyes', 4),
(66, 'Iowa State', 'Cyclones', 3),
(55, 'Jacksonville State', 'Gamecocks', 5),
(2305, 'Kansas', 'Jayhawks', 3),
(2306, 'Kansas State', 'Wildcats', 3),
(2309, 'Kent State', 'Golden Flashes', 7),
(2335, 'Liberty', 'Flames', 5),
(2348, 'Louisiana Tech', 'Bulldogs', 5),
(97, 'Louisville', 'Cardinals', 1),
(120, 'Maryland', 'Terrapins', 4),
(235, 'Memphis', 'Tigers', 2),
(2390, 'Miami', 'Hurricanes', 1),
(193, 'Miami (OH)', 'RedHawks', 7),
(130, 'Michigan', 'Wolverines', 4),
(127, 'Michigan State', 'Spartans', 4),
(2393, 'Middle Tennessee', 'Blue Raiders', 5),
(135, 'Minnesota', 'Golden Gophers', 4),
(2426, 'Navy', 'Midshipmen', 2),
(152, 'NC State', 'Wolfpack', 1),
(158, 'Nebraska', 'Cornhuskers', 4),
(2440, 'Nevada', 'Wolf Pack', 8),
(167, 'New Mexico', 'Lobos', 8),
(166, 'New Mexico State', 'Aggies', 5),
(153, 'North Carolina', 'Tar Heels', 1),
(2459, 'Northern Illinois', 'Huskies', 7),
(249, 'North Texas', 'Mean Green', 2),
(77, 'Northwestern', 'Wildcats', 4),
(87, 'Notre Dame', 'Fighting Irish', 6),
(195, 'Ohio', 'Bobcats', 7),
(194, 'Ohio State', 'Buckeyes', 4),
(201, 'Oklahoma', 'Sooners', 3),
(197, 'Oklahoma State', 'Cowboys', 3),
(2483, 'Oregon', 'Ducks', 9),
(204, 'Oregon State', 'Beavers', 9),
(213, 'Penn State', 'Nittany Lions', 4),
(221, 'Pittsburgh', 'Panthers', 1),
(2509, 'Purdue', 'Boilermakers', 4),
(242, 'Rice', 'Owls', 2),
(164, 'Rutgers', 'Scarlet Knights', 4),
(2534, 'Sam Houston State', 'Bearkats', 5),
(21, 'San Diego State', 'Aztecs', 8),
(23, 'San Jos├⌐ State', 'Spartans', 8),
(2567, 'SMU', 'Mustangs', 2),
(58, 'South Florida', 'Bulls', 2),
(24, 'Stanford', 'Cardinal', 9),
(183, 'Syracuse', 'Orange', 1),
(2628, 'TCU', 'Horned Frogs', 3),
(218, 'Temple', 'Owls', 2),
(251, 'Texas', 'Longhorns', 3),
(2641, 'Texas Tech', 'Red Raiders', 3),
(2649, 'Toledo', 'Rockets', 7),
(2655, 'Tulane', 'Green Wave', 2),
(202, 'Tulsa', 'Golden Hurricane', 2),
(5, 'UAB', 'Blazers', 2),
(2116, 'UCF', 'Knights', 3),
(26, 'UCLA', 'Bruins', 9),
(113, 'UMass', 'Minutemen', 6),
(2439, 'UNLV', 'Rebels', 8),
(30, 'USC', 'Trojans', 9),
(254, 'Utah', 'Utes', 9),
(328, 'Utah State', 'Aggies', 8),
(2638, 'UTEP', 'Miners', 5),
(2636, 'UT San Antonio', 'Roadrunners', 2),
(258, 'Virginia', 'Cavaliers', 1),
(259, 'Virginia Tech', 'Hokies', 1),
(154, 'Wake Forest', 'Demon Deacons', 1),
(264, 'Washington', 'Huskies', 9),
(265, 'Washington State', 'Cougars', 9),
(98, 'Western Kentucky', 'Hilltoppers', 5),
(2711, 'Western Michigan', 'Broncos', 7),
(277, 'West Virginia', 'Mountaineers', 3),
(275, 'Wisconsin', 'Badgers', 4),
(2751, 'Wyoming', 'Cowboys', 8);

INSERT INTO `GAME` (game_id, game_date, home_team_id, away_team_id) VALUES
(10, '2024-08-24', 2440, 2567),  -- Nevada vs. SMU
(11, '2024-08-24', 59, 52),  -- Georgia Tech vs. Florida State
(12, '2024-08-29', 135, 153),  -- Minnesota vs. North Carolina
(13, '2024-08-30', 201, 218),  -- Oklahoma vs. Temple
(14, '2024-08-31', 24, 2628),  -- Stanford vs. TCU
(15, '2024-08-31', 248, 2439),  -- Houston vs. UNLV
(16, '2024-08-31', 77, 193),  -- Northwestern vs. Miami (OH)
(17, '2024-08-31', 183, 195),  -- Syracuse vs. Ohio
(18, '2024-08-31', 221, 2309),  -- Pittsburgh vs. Kent State
(19, '2024-08-31', 194, 2006),  -- Ohio State vs. Akron
(20, '2024-08-31', 275, 2711),  -- Wisconsin vs. Western Michigan
(21, '2024-08-31', 113, 2199),  -- UMass vs. Eastern Michigan
(22, '2024-08-31', 9, 2751),  -- Arizona State vs. Wyoming
(23, '2024-08-31', 12, 167),  -- Arizona vs. New Mexico
(24, '2024-08-31', 130, 278),  -- Michigan vs. Fresno State
(25, '2024-08-31', 277, 213),  -- West Virginia vs. Penn State
(26, '2024-08-31', 84, 2229),  -- Indiana vs. Florida International
(27, '2024-08-31', 158, 2638),  -- Nebraska vs. UTEP
(28, '2024-08-31', 62, 26),  -- Hawai'i vs. UCLA
(29, '2024-08-31', 120, 41),  -- Maryland vs. Connecticut
(30, '2024-08-31', 127, 2226),  -- Michigan State vs. Florida Atlantic
(31, '2024-08-31', 242, 2534),  -- Rice vs. Sam Houston State
(32, '2024-08-31', 251, 36),  -- Texas vs. Colorado State
(33, '2024-09-02', 52, 103),  -- Florida State vs. Boston College
(34, '2024-09-06', 2567, 252),  -- SMU vs. BYU
(35, '2024-09-07', 254, 239),  -- Utah vs. Baylor
(36, '2024-09-07', 201, 248),  -- Oklahoma vs. Houston
(37, '2024-09-07', 213, 189),  -- Penn State vs. Bowling Green
(38, '2024-09-07', 2655, 2306),  -- Tulane vs. Kansas State
(39, '2024-09-07', 2649, 113),  -- Toledo vs. UMass
(40, '2024-09-07', 2229, 2117),  -- Florida International vs. Central Michigan
(41, '2024-09-07', 120, 127),  -- Maryland vs. Michigan State
(42, '2024-09-07', 166, 2335),  -- New Mexico State vs. Liberty
(43, '2024-09-07', 153, 2429),  -- North Carolina vs. Charlotte
(44, '2024-09-07', 87, 2459),  -- Notre Dame vs. Northern Illinois
(45, '2024-09-07', 2005, 23),  -- Air Force vs. San Jos├⌐ State
(46, '2024-09-07', 158, 38),  -- Nebraska vs. Colorado
(47, '2024-09-07', 21, 204),  -- San Diego State vs. Oregon State
(48, '2024-09-07', 2426, 218),  -- Navy vs. Temple
(49, '2024-09-07', 2483, 68),  -- Oregon vs. Boise State
(50, '2024-09-07', 97, 55),  -- Louisville vs. Jacksonville State
(51, '2024-09-07', 154, 258),  -- Wake Forest vs. Virginia
(52, '2024-09-07', 77, 150),  -- Northwestern vs. Duke
(53, '2024-09-07', 2226, 349),  -- Florida Atlantic vs. Army
(54, '2024-09-07', 164, 2006),  -- Rutgers vs. Akron
(55, '2024-09-07', 130, 251),  -- Michigan vs. Texas
(56, '2024-09-07', 30, 328),  -- USC vs. Utah State
(57, '2024-09-07', 2132, 221),  -- Cincinnati vs. Pittsburgh
(58, '2024-09-07', 356, 2305),  -- Illinois vs. Kansas
(59, '2024-09-07', 265, 2641),  -- Washington State vs. Texas Tech
(60, '2024-09-07', 194, 2711),  -- Ohio State vs. Western Michigan
(61, '2024-09-07', 2294, 66),  -- Iowa vs. Iowa State
(62, '2024-09-07', 2116, 2534),  -- UCF vs. Sam Houston State
(63, '2024-09-07', 183, 59),  -- Syracuse vs. Georgia Tech
(64, '2024-09-07', 264, 2199),  -- Washington vs. Eastern Michigan
(65, '2024-09-13', 2306, 12),  -- Kansas State vs. Arizona
(66, '2024-09-14', 135, 2440),  -- Minnesota vs. Nevada
(67, '2024-09-14', 2084, 113),  -- Buffalo vs. UMass
(68, '2024-09-14', 251, 2636),  -- Texas vs. UT San Antonio
(69, '2024-09-14', 356, 2117),  -- Illinois vs. Central Michigan
(70, '2024-09-14', 2509, 87),  -- Purdue vs. Notre Dame
(71, '2024-09-14', 2628, 2116),  -- TCU vs. UCF
(72, '2024-09-14', 193, 2132),  -- Miami (OH) vs. Cincinnati
(73, '2024-09-14', 202, 197),  -- Tulsa vs. Oklahoma State
(74, '2024-09-14', 2751, 252),  -- Wyoming vs. BYU
(75, '2024-09-14', 150, 41),  -- Duke vs. Connecticut
(76, '2024-09-14', 278, 166),  -- Fresno State vs. New Mexico State
(77, '2024-09-14', 221, 277),  -- Pittsburgh vs. West Virginia
(78, '2024-09-14', 2641, 249),  -- Texas Tech vs. North Texas
(79, '2024-09-14', 248, 242),  -- Houston vs. Rice
(80, '2024-09-14', 239, 2005),  -- Baylor vs. Air Force
(81, '2024-09-14', 204, 2483),  -- Oregon State vs. Oregon
(82, '2024-09-14', 25, 21),  -- California vs. San Diego State
(83, '2024-09-14', 265, 264),  -- Washington State vs. Washington
(84, '2024-09-14', 328, 254),  -- Utah State vs. Utah
(85, '2024-09-14', 36, 38),  -- Colorado State vs. Colorado
(86, '2024-09-14', 2390, 2050),  -- Miami vs. Ball State
(87, '2024-09-14', 2305, 2439),  -- Kansas vs. UNLV
(88, '2024-09-14', 2534, 62),  -- Sam Houston State vs. Hawai'i
(89, '2024-09-14', 2335, 2638),  -- Liberty vs. UTEP
(90, '2024-09-14', 258, 120),  -- Virginia vs. Maryland
(91, '2024-09-14', 152, 2348),  -- NC State vs. Louisiana Tech
(92, '2024-09-14', 2199, 55),  -- Eastern Michigan vs. Jacksonville State
(93, '2024-09-14', 2226, 2229),  -- Florida Atlantic vs. Florida International
(94, '2024-09-14', 2393, 98),  -- Middle Tennessee vs. Western Kentucky
(95, '2024-09-14', 26, 84),  -- UCLA vs. Indiana
(96, '2024-09-14', 201, 2655),  -- Oklahoma vs. Tulane
(97, '2024-09-14', 52, 235),  -- Florida State vs. Memphis
(98, '2024-09-20', 183, 24),  -- Syracuse vs. Stanford
(99, '2024-09-21', 265, 23),  -- Washington State vs. San Jos├⌐ State
(100, '2024-09-21', 2393, 150),  -- Middle Tennessee vs. Duke
(101, '2024-09-21', 228, 152),  -- Clemson vs. NC State
(102, '2024-09-21', 2534, 166),  -- Sam Houston State vs. New Mexico State
(103, '2024-09-21', 167, 278),  -- New Mexico vs. Fresno State
(104, '2024-09-21', 2641, 9),  -- Texas Tech vs. Arizona State
(105, '2024-09-21', 135, 2294),  -- Minnesota vs. Iowa
(106, '2024-09-21', 197, 254),  -- Oklahoma State vs. Utah
(107, '2024-09-21', 2348, 202),  -- Louisiana Tech vs. Tulsa
(108, '2024-09-21', 98, 2649),  -- Western Kentucky vs. Toledo
(109, '2024-09-21', 2117, 2050),  -- Central Michigan vs. Ball State
(110, '2024-09-21', 2459, 2084),  -- Northern Illinois vs. Buffalo
(111, '2024-09-21', 213, 2309),  -- Penn State vs. Kent State
(112, '2024-09-21', 52, 25),  -- Florida State vs. California
(113, '2024-09-21', 130, 30),  -- Michigan vs. USC
(114, '2024-09-21', 38, 239),  -- Colorado vs. Baylor
(115, '2024-09-21', 158, 356),  -- Nebraska vs. Illinois
(116, '2024-09-21', 2567, 2628),  -- SMU vs. TCU
(117, '2024-09-21', 218, 328),  -- Temple vs. Utah State
(118, '2024-09-21', 252, 2306),  -- BYU vs. Kansas State
(119, '2024-09-21', 2132, 248),  -- Cincinnati vs. Houston
(120, '2024-09-21', 41, 2226),  -- Connecticut vs. Florida Atlantic
(121, '2024-09-21', 103, 127),  -- Boston College vs. Michigan State
(122, '2024-09-21', 36, 2638),  -- Colorado State vs. UTEP
(123, '2024-09-21', 2426, 235),  -- Navy vs. Memphis
(124, '2024-09-21', 204, 2509),  -- Oregon State vs. Purdue
(125, '2024-09-21', 84, 2429),  -- Indiana vs. Charlotte
(126, '2024-09-21', 277, 2305),  -- West Virginia vs. Kansas
(127, '2024-09-21', 349, 242),  -- Army vs. Rice
(128, '2024-09-21', 58, 2390),  -- South Florida vs. Miami
(129, '2024-09-21', 249, 2751),  -- North Texas vs. Wyoming
(130, '2024-09-21', 87, 193),  -- Notre Dame vs. Miami (OH)
(131, '2024-09-21', 2335, 151),  -- Liberty vs. East Carolina
(132, '2024-09-21', 259, 164),  -- Virginia Tech vs. Rutgers
(133, '2024-09-21', 264, 77),  -- Washington vs. Northwestern
(134, '2024-09-21', 97, 59),  -- Louisville vs. Georgia Tech
(135, '2024-09-26', 218, 349),  -- Temple vs. Army
(136, '2024-09-27', 2390, 259),  -- Miami vs. Virginia Tech
(137, '2024-09-28', 254, 12),  -- Utah vs. Arizona
(138, '2024-09-28', 30, 275),  -- USC vs. Wisconsin
(139, '2024-09-28', 2305, 2628),  -- Kansas vs. TCU
(140, '2024-09-28', 2309, 2199),  -- Kent State vs. Eastern Michigan
(141, '2024-09-28', 5, 2426),  -- UAB vs. Navy
(142, '2024-09-28', 195, 2006),  -- Ohio vs. Akron
(143, '2024-09-28', 130, 135),  -- Michigan vs. Minnesota
(144, '2024-09-28', 242, 2429),  -- Rice vs. Charlotte
(145, '2024-09-28', 166, 167),  -- New Mexico State vs. New Mexico
(146, '2024-09-28', 2509, 158),  -- Purdue vs. Nebraska
(147, '2024-09-28', 2567, 52),  -- SMU vs. Florida State
(148, '2024-09-28', 2751, 2005),  -- Wyoming vs. Air Force
(149, '2024-09-28', 26, 2483),  -- UCLA vs. Oregon
(150, '2024-09-28', 2439, 278),  -- UNLV vs. Fresno State
(151, '2024-09-28', 68, 265),  -- Boise State vs. Washington State
(152, '2024-09-28', 164, 264),  -- Rutgers vs. Washington
(153, '2024-09-28', 2117, 21),  -- Central Michigan vs. San Diego State
(154, '2024-09-28', 249, 202),  -- North Texas vs. Tulsa
(155, '2024-09-28', 2116, 38),  -- UCF vs. Colorado
(156, '2024-09-28', 41, 2084),  -- Connecticut vs. Buffalo
(157, '2024-09-28', 193, 113),  -- Miami (OH) vs. UMass
(158, '2024-09-28', 152, 2459),  -- NC State vs. Northern Illinois
(159, '2024-09-28', 228, 24),  -- Clemson vs. Stanford
(160, '2024-09-28', 87, 97),  -- Notre Dame vs. Louisville
(161, '2024-09-28', 127, 194),  -- Michigan State vs. Ohio State
(162, '2024-09-28', 213, 356),  -- Penn State vs. Illinois
(163, '2024-09-28', 84, 120),  -- Indiana vs. Maryland
(164, '2024-09-28', 235, 2393),  -- Memphis vs. Middle Tennessee
(165, '2024-09-28', 2229, 2348),  -- Florida International vs. Louisiana Tech
(166, '2024-09-28', 151, 2636),  -- East Carolina vs. UT San Antonio
(167, '2024-09-28', 103, 98),  -- Boston College vs. Western Kentucky
(168, '2024-09-28', 2655, 58),  -- Tulane vs. South Florida
(169, '2024-09-28', 2641, 2132),  -- Texas Tech vs. Cincinnati
(170, '2024-09-28', 239, 252),  -- Baylor vs. BYU
(171, '2024-09-28', 2306, 197),  -- Kansas State vs. Oklahoma State
(172, '2024-09-28', 150, 153),  -- Duke vs. North Carolina
(173, '2024-09-28', 248, 66),  -- Houston vs. Iowa State
(174, '2024-10-03', 2638, 2534),  -- UTEP vs. Sam Houston State
(175, '2024-10-04', 2628, 248),  -- TCU vs. Houston
(176, '2024-10-05', 158, 164),  -- Nebraska vs. Rutgers
(177, '2024-10-05', 2649, 193),  -- Toledo vs. Miami (OH)
(178, '2024-10-05', 264, 130),  -- Washington vs. Michigan
(179, '2024-10-05', 2459, 113),  -- Northern Illinois vs. UMass
(180, '2024-10-05', 197, 277),  -- Oklahoma State vs. West Virginia
(181, '2024-10-05', 24, 259),  -- Stanford vs. Virginia Tech
(182, '2024-10-05', 97, 2567),  -- Louisville vs. SMU
(183, '2024-10-05', 275, 2509),  -- Wisconsin vs. Purdue
(184, '2024-10-05', 25, 2390),  -- California vs. Miami
(185, '2024-10-05', 5, 2655),  -- UAB vs. Tulane
(186, '2024-10-05', 77, 84),  -- Northwestern vs. Indiana
(187, '2024-10-05', 204, 36),  -- Oregon State vs. Colorado State
(188, '2024-10-05', 2006, 189),  -- Akron vs. Bowling Green
(189, '2024-10-05', 152, 154),  -- NC State vs. Wake Forest
(190, '2024-10-05', 2429, 151),  -- Charlotte vs. East Carolina
(191, '2024-10-05', 41, 218),  -- Connecticut vs. Temple
(192, '2024-10-05', 12, 2641),  -- Arizona vs. Texas Tech
(193, '2024-10-05', 2005, 2426),  -- Air Force vs. Navy
(194, '2024-10-05', 2483, 127),  -- Oregon vs. Michigan State
(195, '2024-10-05', 258, 103),  -- Virginia vs. Boston College
(196, '2024-10-05', 68, 328),  -- Boise State vs. Utah State
(197, '2024-10-05', 9, 2305),  -- Arizona State vs. Kansas
(198, '2024-10-05', 202, 349),  -- Tulsa vs. Army
(199, '2024-10-05', 153, 221),  -- North Carolina vs. Pittsburgh
(200, '2024-10-05', 52, 228),  -- Florida State vs. Clemson
(201, '2024-10-05', 2439, 183),  -- UNLV vs. Syracuse
(202, '2024-10-05', 23, 2440),  -- San Jos├⌐ State vs. Nevada
(203, '2024-10-05', 213, 26),  -- Penn State vs. UCLA
(204, '2024-10-05', 21, 62),  -- San Diego State vs. Hawai'i
(205, '2024-10-05', 135, 30),  -- Minnesota vs. USC
(206, '2024-10-05', 2050, 2711),  -- Ball State vs. Western Michigan
(207, '2024-10-05', 66, 239),  -- Iowa State vs. Baylor
(208, '2024-10-05', 194, 2294),  -- Ohio State vs. Iowa
(209, '2024-10-05', 59, 150),  -- Georgia Tech vs. Duke
(210, '2024-10-09', 55, 166),  -- Jacksonville State vs. New Mexico State
(211, '2024-10-09', 2335, 2229),  -- Liberty vs. Florida International
(212, '2024-10-10', 98, 2638),  -- Western Kentucky vs. UTEP
(213, '2024-10-10', 2348, 2393),  -- Louisiana Tech vs. Middle Tennessee
(214, '2024-10-11', 9, 254),  -- Arizona State vs. Utah
(215, '2024-10-11', 58, 235),  -- South Florida vs. Memphis
(216, '2024-10-12', 62, 68),  -- Hawai'i vs. Boise State
(217, '2024-10-12', 2309, 2050),  -- Kent State vs. Ball State
(218, '2024-10-12', 189, 2459),  -- Bowling Green vs. Northern Illinois
(219, '2024-10-12', 154, 228),  -- Wake Forest vs. Clemson
(220, '2024-10-12', 153, 59),  -- North Carolina vs. Georgia Tech
(221, '2024-10-12', 38, 2306),  -- Colorado vs. Kansas State
(222, '2024-10-12', 201, 251),  -- Oklahoma vs. Texas
(223, '2024-10-12', 277, 66),  -- West Virginia vs. Iowa State
(224, '2024-10-12', 152, 183),  -- NC State vs. Syracuse
(225, '2024-10-12', 2084, 2649),  -- Buffalo vs. Toledo
(226, '2024-10-12', 167, 2005),  -- New Mexico vs. Air Force
(227, '2024-10-12', 2751, 21),  -- Wyoming vs. San Diego State
(228, '2024-10-12', 328, 2439),  -- Utah State vs. UNLV
(229, '2024-10-12', 36, 23),  -- Colorado State vs. San Jos├⌐ State
(230, '2024-10-12', 258, 97),  -- Virginia vs. Louisville
(231, '2024-10-12', 2483, 194),  -- Oregon vs. Ohio State
(232, '2024-10-12', 30, 213),  -- USC vs. Penn State
(233, '2024-10-12', 164, 275),  -- Rutgers vs. Wisconsin
(234, '2024-10-12', 26, 135),  -- UCLA vs. Minnesota
(235, '2024-10-12', 120, 77),  -- Maryland vs. Northwestern
(236, '2024-10-12', 356, 2509),  -- Illinois vs. Purdue
(237, '2024-10-12', 242, 2636),  -- Rice vs. UT San Antonio
(238, '2024-10-12', 252, 12),  -- BYU vs. Arizona
(239, '2024-10-12', 87, 24),  -- Notre Dame vs. Stanford
(240, '2024-10-12', 221, 25),  -- Pittsburgh vs. California
(241, '2024-10-12', 2440, 204),  -- Nevada vs. Oregon State
(242, '2024-10-12', 2294, 264),  -- Iowa vs. Washington
(243, '2024-10-12', 278, 265),  -- Fresno State vs. Washington State
(244, '2024-10-12', 2116, 2132),  -- UCF vs. Cincinnati
(245, '2024-10-12', 349, 5),  -- Army vs. UAB
(246, '2024-10-12', 2199, 193),  -- Eastern Michigan vs. Miami (OH)
(247, '2024-10-12', 2117, 195),  -- Central Michigan vs. Ohio
(248, '2024-10-12', 2226, 249),  -- Florida Atlantic vs. North Texas
(249, '2024-10-12', 2711, 2006),  -- Western Michigan vs. Akron
(250, '2024-10-15', 166, 2348),  -- New Mexico State vs. Louisiana Tech
(251, '2024-10-16', 2534, 98),  -- Sam Houston State vs. Western Kentucky
(252, '2024-10-16', 2638, 2229),  -- UTEP vs. Florida International
(253, '2024-10-17', 259, 103),  -- Virginia Tech vs. Boston College
(254, '2024-10-18', 252, 197),  -- BYU vs. Oklahoma State
(255, '2024-10-18', 150, 52),  -- Duke vs. Florida State
(256, '2024-10-19', 12, 38),  -- Arizona vs. Colorado
(257, '2024-10-19', 25, 152),  -- California vs. NC State
(258, '2024-10-19', 41, 154),  -- Connecticut vs. Wake Forest
(259, '2024-10-19', 120, 30),  -- Maryland vs. USC
(260, '2024-10-19', 97, 2390),  -- Louisville vs. Miami
(261, '2024-10-19', 164, 26),  -- Rutgers vs. UCLA
(262, '2024-10-19', 328, 167),  -- Utah State vs. New Mexico
(263, '2024-10-19', 59, 87),  -- Georgia Tech vs. Notre Dame
(264, '2024-10-19', 265, 62),  -- Washington State vs. Hawai'i
(265, '2024-10-19', 228, 258),  -- Clemson vs. Virginia
(266, '2024-10-19', 254, 2628),  -- Utah vs. TCU
(267, '2024-10-19', 2084, 2711),  -- Buffalo vs. Western Michigan
(268, '2024-10-19', 24, 2567),  -- Stanford vs. SMU
(269, '2024-10-19', 23, 2751),  -- San Jos├⌐ State vs. Wyoming
(270, '2024-10-19', 2199, 2117),  -- Eastern Michigan vs. Central Michigan
(271, '2024-10-19', 2005, 36),  -- Air Force vs. Colorado State
(272, '2024-10-19', 77, 275),  -- Northwestern vs. Wisconsin
(273, '2024-10-19', 2459, 2649),  -- Northern Illinois vs. Toledo
(274, '2024-10-19', 2509, 2483),  -- Purdue vs. Oregon
(275, '2024-10-19', 2440, 278),  -- Nevada vs. Fresno State
(276, '2024-10-19', 218, 202),  -- Temple vs. Tulsa
(277, '2024-10-19', 127, 2294),  -- Michigan State vs. Iowa
(278, '2024-10-19', 235, 249),  -- Memphis vs. North Texas
(279, '2024-10-19', 2426, 2429),  -- Navy vs. Charlotte
(280, '2024-10-19', 349, 151),  -- Army vs. East Carolina
(281, '2024-10-19', 2305, 248),  -- Kansas vs. Houston
(282, '2024-10-19', 2636, 2226),  -- UT San Antonio vs. Florida Atlantic
(283, '2024-10-19', 2132, 9),  -- Cincinnati vs. Arizona State
(284, '2024-10-19', 66, 2116),  -- Iowa State vs. UCF
(285, '2024-10-19', 58, 5),  -- South Florida vs. UAB
(286, '2024-10-19', 356, 130),  -- Illinois vs. Michigan
(287, '2024-10-19', 193, 195),  -- Miami (OH) vs. Ohio
(288, '2024-10-19', 2655, 242),  -- Tulane vs. Rice
(289, '2024-10-19', 189, 2309),  -- Bowling Green vs. Kent State
(290, '2024-10-19', 204, 2439),  -- Oregon State vs. UNLV
(291, '2024-10-19', 84, 158),  -- Indiana vs. Nebraska
(292, '2024-10-19', 2641, 239),  -- Texas Tech vs. Baylor
(293, '2024-10-19', 277, 2306),  -- West Virginia vs. Kansas State
(294, '2024-10-22', 2229, 2534),  -- Florida International vs. Sam Houston State
(295, '2024-10-22', 2348, 2638),  -- Louisiana Tech vs. UTEP
(296, '2024-10-23', 55, 2393),  -- Jacksonville State vs. Middle Tennessee
(297, '2024-10-24', 221, 183),  -- Pittsburgh vs. Syracuse
(298, '2024-10-25', 103, 97),  -- Boston College vs. Louisville
(299, '2024-10-26', 278, 23),  -- Fresno State vs. San Jos├⌐ State
(300, '2024-10-26', 2439, 68),  -- UNLV vs. Boise State
(301, '2024-10-26', 2751, 328),  -- Wyoming vs. Utah State
(302, '2024-10-26', 202, 2636),  -- Tulsa vs. UT San Antonio
(303, '2024-10-26', 194, 158),  -- Ohio State vs. Nebraska
(304, '2024-10-26', 151, 218),  -- East Carolina vs. Temple
(305, '2024-10-26', 2006, 2199),  -- Akron vs. Eastern Michigan
(306, '2024-10-26', 2294, 77),  -- Iowa vs. Northwestern
(307, '2024-10-26', 150, 2567),  -- Duke vs. SMU
(308, '2024-10-26', 249, 2655),  -- North Texas vs. Tulane
(309, '2024-10-26', 193, 2117),  -- Miami (OH) vs. Central Michigan
(310, '2024-10-26', 2050, 2459),  -- Ball State vs. Northern Illinois
(311, '2024-10-26', 275, 213),  -- Wisconsin vs. Penn State
(312, '2024-10-26', 195, 2084),  -- Ohio vs. Buffalo
(313, '2024-10-26', 30, 164),  -- USC vs. Rutgers
(314, '2024-10-26', 235, 2429),  -- Memphis vs. Charlotte
(315, '2024-10-26', 135, 120),  -- Minnesota vs. Maryland
(316, '2024-10-26', 130, 127),  -- Michigan vs. Michigan State
(317, '2024-10-26', 2390, 52),  -- Miami vs. Florida State
(318, '2024-10-26', 24, 154),  -- Stanford vs. Wake Forest
(319, '2024-10-26', 2426, 87),  -- Navy vs. Notre Dame
(320, '2024-10-26', 259, 59),  -- Virginia Tech vs. Georgia Tech
(321, '2024-10-26', 258, 153),  -- Virginia vs. North Carolina
(322, '2024-10-26', 62, 2440),  -- Hawai'i vs. Nevada
(323, '2024-10-26', 25, 204),  -- California vs. Oregon State
(324, '2024-10-26', 2483, 356),  -- Oregon vs. Illinois
(325, '2024-10-26', 2649, 189),  -- Toledo vs. Bowling Green
(326, '2024-10-26', 248, 254),  -- Houston vs. Utah
(327, '2024-10-26', 38, 2132),  -- Colorado vs. Cincinnati
(328, '2024-10-26', 239, 197),  -- Baylor vs. Oklahoma State
(329, '2024-10-26', 2116, 252),  -- UCF vs. BYU
(330, '2024-10-26', 84, 264),  -- Indiana vs. Washington
(331, '2024-10-26', 21, 265),  -- San Diego State vs. Washington State
(332, '2024-10-26', 41, 242),  -- Connecticut vs. Rice
(333, '2024-10-26', 2628, 2641),  -- TCU vs. Texas Tech
(334, '2024-10-26', 2306, 2305),  -- Kansas State vs. Kansas
(335, '2024-10-26', 36, 167),  -- Colorado State vs. New Mexico
(336, '2024-10-26', 12, 277),  -- Arizona vs. West Virginia
(337, '2024-10-26', 2711, 2309),  -- Western Michigan vs. Kent State
(338, '2024-10-29', 2534, 2348),  -- Sam Houston State vs. Louisiana Tech
(339, '2024-10-29', 2229, 166),  -- Florida International vs. New Mexico State
(340, '2024-10-30', 2335, 55),  -- Liberty vs. Jacksonville State
(341, '2024-10-31', 2429, 2655),  -- Charlotte vs. Tulane
(342, '2024-11-01', 2226, 58),  -- Florida Atlantic vs. South Florida
(343, '2024-11-02', 68, 21),  -- Boise State vs. San Diego State
(344, '2024-11-02', 5, 202),  -- UAB vs. Tulsa
(345, '2024-11-02', 248, 2306),  -- Houston vs. Kansas State
(346, '2024-11-02', 2199, 2649),  -- Eastern Michigan vs. Toledo
(347, '2024-11-02', 2006, 2084),  -- Akron vs. Buffalo
(348, '2024-11-02', 167, 2751),  -- New Mexico vs. Wyoming
(349, '2024-11-02', 127, 84),  -- Michigan State vs. Indiana
(350, '2024-11-02', 130, 2483),  -- Michigan vs. Oregon
(351, '2024-11-02', 2440, 36),  -- Nevada vs. Colorado State
(352, '2024-11-02', 349, 2005),  -- Army vs. Air Force
(353, '2024-11-02', 239, 2628),  -- Baylor vs. TCU
(354, '2024-11-02', 2636, 235),  -- UT San Antonio vs. Memphis
(355, '2024-11-02', 2638, 2393),  -- UTEP vs. Middle Tennessee
(356, '2024-11-02', 264, 30),  -- Washington vs. USC
(357, '2024-11-02', 228, 97),  -- Clemson vs. Louisville
(358, '2024-11-02', 183, 259),  -- Syracuse vs. Virginia Tech
(359, '2024-11-02', 2116, 12),  -- UCF vs. Arizona
(360, '2024-11-02', 197, 9),  -- Oklahoma State vs. Arizona State
(361, '2024-11-02', 213, 194),  -- Penn State vs. Ohio State
(362, '2024-11-02', 2567, 221),  -- SMU vs. Pittsburgh
(363, '2024-11-02', 66, 2641),  -- Iowa State vs. Texas Tech
(364, '2024-11-02', 2294, 275),  -- Iowa vs. Wisconsin
(365, '2024-11-02', 356, 135),  -- Illinois vs. Minnesota
(366, '2024-11-02', 2509, 77),  -- Purdue vs. Northwestern
(367, '2024-11-02', 242, 2426),  -- Rice vs. Navy
(368, '2024-11-02', 278, 62),  -- Fresno State vs. Hawai'i
(369, '2024-11-02', 52, 153),  -- Florida State vs. North Carolina
(370, '2024-11-02', 158, 26),  -- Nebraska vs. UCLA
(371, '2024-11-02', 152, 24),  -- NC State vs. Stanford
(372, '2024-11-02', 2390, 150),  -- Miami vs. Duke
(373, '2024-11-05', 2117, 189),  -- Central Michigan vs. Bowling Green
(374, '2024-11-05', 2050, 193),  -- Ball State vs. Miami (OH)
(375, '2024-11-06', 2711, 2459),  -- Western Michigan vs. Northern Illinois
(376, '2024-11-06', 2309, 195),  -- Kent State vs. Ohio
(377, '2024-11-07', 151, 2226),  -- East Carolina vs. Florida Atlantic
(378, '2024-11-08', 235, 242),  -- Memphis vs. Rice
(379, '2024-11-08', 154, 25),  -- Wake Forest vs. California
(380, '2024-11-09', 68, 2440),  -- Boise State vs. Nevada
(381, '2024-11-09', 26, 2294),  -- UCLA vs. Iowa
(382, '2024-11-09', 2655, 218),  -- Tulane vs. Temple
(383, '2024-11-09', 164, 135),  -- Rutgers vs. Minnesota
(384, '2024-11-09', 58, 2426),  -- South Florida vs. Navy
(385, '2024-11-09', 166, 98),  -- New Mexico State vs. Western Kentucky
(386, '2024-11-09', 84, 130),  -- Indiana vs. Michigan
(387, '2024-11-09', 2483, 120),  -- Oregon vs. Maryland
(388, '2024-11-09', 204, 23),  -- Oregon State vs. San Jos├⌐ State
(389, '2024-11-09', 2641, 38),  -- Texas Tech vs. Colorado
(390, '2024-11-09', 62, 2439),  -- Hawai'i vs. UNLV
(391, '2024-11-09', 213, 264),  -- Penn State vs. Washington
(392, '2024-11-09', 2005, 278),  -- Air Force vs. Fresno State
(393, '2024-11-09', 21, 167),  -- San Diego State vs. New Mexico
(394, '2024-11-09', 2393, 2335),  -- Middle Tennessee vs. Liberty
(395, '2024-11-09', 265, 328),  -- Washington State vs. Utah State
(396, '2024-11-09', 103, 183),  -- Boston College vs. Syracuse
(397, '2024-11-09', 2132, 277),  -- Cincinnati vs. West Virginia
(398, '2024-11-09', 5, 41),  -- UAB vs. Connecticut
(399, '2024-11-09', 2305, 66),  -- Kansas vs. Iowa State
(400, '2024-11-09', 254, 252),  -- Utah vs. BYU
(401, '2024-11-09', 2628, 197),  -- TCU vs. Oklahoma State
(402, '2024-11-09', 9, 2116),  -- Arizona State vs. UCF
(403, '2024-11-09', 113, 349),  -- UMass vs. Army
(404, '2024-11-09', 152, 150),  -- NC State vs. Duke
(405, '2024-11-09', 221, 258),  -- Pittsburgh vs. Virginia
(406, '2024-11-09', 59, 2390),  -- Georgia Tech vs. Miami
(407, '2024-11-09', 259, 228),  -- Virginia Tech vs. Clemson
(408, '2024-11-09', 87, 52),  -- Notre Dame vs. Florida State
(409, '2024-11-09', 2348, 55),  -- Louisiana Tech vs. Jacksonville State
(410, '2024-11-09', 194, 2509),  -- Ohio State vs. Purdue
(411, '2024-11-12', 2084, 2050),  -- Buffalo vs. Ball State
(412, '2024-11-12', 2649, 2117),  -- Toledo vs. Central Michigan
(413, '2024-11-12', 189, 2711),  -- Bowling Green vs. Western Michigan
(414, '2024-11-13', 2459, 2006),  -- Northern Illinois vs. Akron
(415, '2024-11-13', 193, 2309),  -- Miami (OH) vs. Kent State
(416, '2024-11-13', 195, 2199),  -- Ohio vs. Eastern Michigan
(417, '2024-11-14', 202, 151),  -- Tulsa vs. East Carolina
(418, '2024-11-15', 2636, 249),  -- UT San Antonio vs. North Texas
(419, '2024-11-15', 12, 248),  -- Arizona vs. Houston
(420, '2024-11-16', 77, 194),  -- Northwestern vs. Ohio State
(421, '2024-11-16', 235, 5),  -- Memphis vs. UAB
(422, '2024-11-16', 221, 228),  -- Pittsburgh vs. Clemson
(423, '2024-11-16', 87, 258),  -- Notre Dame vs. Virginia
(424, '2024-11-16', 264, 26),  -- Washington vs. UCLA
(425, '2024-11-16', 2306, 9),  -- Kansas State vs. Arizona State
(426, '2024-11-16', 30, 158),  -- USC vs. Nebraska
(427, '2024-11-16', 328, 62),  -- Utah State vs. Hawai'i
(428, '2024-11-16', 153, 154),  -- North Carolina vs. Wake Forest
(429, '2024-11-16', 24, 97),  -- Stanford vs. Louisville
(430, '2024-11-16', 25, 183),  -- California vs. Syracuse
(431, '2024-11-16', 113, 2335),  -- UMass vs. Liberty
(432, '2024-11-16', 66, 2132),  -- Iowa State vs. Cincinnati
(433, '2024-11-16', 356, 127),  -- Illinois vs. Michigan State
(434, '2024-11-16', 23, 68),  -- San Jos├⌐ State vs. Boise State
(435, '2024-11-16', 218, 2226),  -- Temple vs. Florida Atlantic
(436, '2024-11-16', 2005, 204),  -- Air Force vs. Oregon State
(437, '2024-11-16', 2567, 103),  -- SMU vs. Boston College
(438, '2024-11-16', 252, 2305),  -- BYU vs. Kansas
(439, '2024-11-16', 2439, 21),  -- UNLV vs. San Diego State
(440, '2024-11-16', 55, 2229),  -- Jacksonville State vs. Florida International
(441, '2024-11-16', 98, 2348),  -- Western Kentucky vs. Louisiana Tech
(442, '2024-11-16', 38, 254),  -- Colorado vs. Utah
(443, '2024-11-16', 2429, 58),  -- Charlotte vs. South Florida
(444, '2024-11-16', 2426, 2655),  -- Navy vs. Tulane
(445, '2024-11-16', 2509, 213),  -- Purdue vs. Penn State
(446, '2024-11-16', 275, 2483),  -- Wisconsin vs. Oregon
(447, '2024-11-16', 167, 265),  -- New Mexico vs. Washington State
(448, '2024-11-16', 36, 2751),  -- Colorado State vs. Wyoming
(449, '2024-11-16', 120, 164),  -- Maryland vs. Rutgers
(450, '2024-11-16', 277, 239),  -- West Virginia vs. Baylor
(451, '2024-11-19', 2309, 2006),  -- Kent State vs. Akron
(452, '2024-11-19', 193, 2459),  -- Miami (OH) vs. Northern Illinois
(453, '2024-11-19', 2117, 2711),  -- Central Michigan vs. Western Michigan
(454, '2024-11-20', 2199, 2084),  -- Eastern Michigan vs. Buffalo
(455, '2024-11-20', 2649, 195),  -- Toledo vs. Ohio
(456, '2024-11-21', 59, 152),  -- Georgia Tech vs. NC State
(457, '2024-11-22', 2636, 218),  -- UT San Antonio vs. Temple
(458, '2024-11-23', 2393, 166),  -- Middle Tennessee vs. New Mexico State
(459, '2024-11-23', 2440, 2005),  -- Nevada vs. Air Force
(460, '2024-11-23', 127, 2509),  -- Michigan State vs. Purdue
(461, '2024-11-23', 55, 2534),  -- Jacksonville State vs. Sam Houston State
(462, '2024-11-23', 183, 41),  -- Syracuse vs. Connecticut
(463, '2024-11-23', 197, 2641),  -- Oklahoma State vs. Texas Tech
(464, '2024-11-23', 254, 66),  -- Utah vs. Iowa State
(465, '2024-11-23', 164, 356),  -- Rutgers vs. Illinois
(466, '2024-11-23', 248, 239),  -- Houston vs. Baylor
(467, '2024-11-23', 204, 265),  -- Oregon State vs. Washington State
(468, '2024-11-23', 9, 252),  -- Arizona State vs. BYU
(469, '2024-11-23', 328, 21),  -- Utah State vs. San Diego State
(470, '2024-11-23', 2306, 2132),  -- Kansas State vs. Cincinnati
(471, '2024-11-23', 2050, 189),  -- Ball State vs. Bowling Green
(472, '2024-11-23', 2305, 38),  -- Kansas vs. Colorado
(473, '2024-11-23', 87, 349),  -- Notre Dame vs. Army
(474, '2024-11-23', 277, 2116),  -- West Virginia vs. UCF
(475, '2024-11-23', 249, 151),  -- North Texas vs. East Carolina
(476, '2024-11-23', 23, 2439),  -- San Jos├⌐ State vs. UNLV
(477, '2024-11-23', 26, 30),  -- UCLA vs. USC
(478, '2024-11-23', 130, 77),  -- Michigan vs. Northwestern
(479, '2024-11-23', 103, 153),  -- Boston College vs. North Carolina
(480, '2024-11-23', 150, 259),  -- Duke vs. Virginia Tech
(481, '2024-11-23', 25, 24),  -- California vs. Stanford
(482, '2024-11-23', 2390, 154),  -- Miami vs. Wake Forest
(483, '2024-11-23', 2628, 12),  -- TCU vs. Arizona
(484, '2024-11-23', 2226, 2429),  -- Florida Atlantic vs. Charlotte
(485, '2024-11-23', 135, 213),  -- Minnesota vs. Penn State
(486, '2024-11-23', 5, 242),  -- UAB vs. Rice
(487, '2024-11-23', 2335, 98),  -- Liberty vs. Western Kentucky
(488, '2024-11-23', 194, 84),  -- Ohio State vs. Indiana
(489, '2024-11-23', 258, 2567),  -- Virginia vs. SMU
(490, '2024-11-23', 158, 275),  -- Nebraska vs. Wisconsin
(491, '2024-11-23', 97, 221),  -- Louisville vs. Pittsburgh
(492, '2024-11-23', 58, 202),  -- South Florida vs. Tulsa
(493, '2024-11-23', 2751, 68),  -- Wyoming vs. Boise State
(494, '2024-11-23', 120, 2294),  -- Maryland vs. Iowa
(495, '2024-11-23', 278, 36),  -- Fresno State vs. Colorado State
(496, '2024-11-26', 2006, 2649),  -- Akron vs. Toledo
(497, '2024-11-26', 2084, 2309),  -- Buffalo vs. Kent State
(498, '2024-11-28', 2655, 235),  -- Tulane vs. Memphis
(499, '2024-11-29', 189, 193),  -- Bowling Green vs. Miami (OH)
(500, '2024-11-29', 2116, 254),  -- UCF vs. Utah
(501, '2024-11-29', 38, 197),  -- Colorado vs. Oklahoma State
(502, '2024-11-29', 195, 2050),  -- Ohio vs. Ball State
(503, '2024-11-29', 2294, 158),  -- Iowa vs. Nebraska
(504, '2024-11-30', 84, 2509),  -- Indiana vs. Purdue
(505, '2024-11-30', 2483, 264),  -- Oregon vs. Washington
(506, '2024-11-30', 194, 130),  -- Ohio State vs. Michigan
(507, '2024-11-30', 66, 2306),  -- Iowa State vs. Kansas State
(508, '2024-11-30', 2641, 277),  -- Texas Tech vs. West Virginia
(509, '2024-11-30', 349, 2636),  -- Army vs. UT San Antonio
(510, '2024-11-30', 265, 2751),  -- Washington State vs. Wyoming
(511, '2024-11-30', 26, 278),  -- UCLA vs. Fresno State
(512, '2024-11-30', 30, 87),  -- USC vs. Notre Dame
(513, '2024-11-30', 77, 356),  -- Northwestern vs. Illinois
(514, '2024-11-30', 62, 167),  -- Hawai'i vs. New Mexico
(515, '2024-11-30', 2459, 2117),  -- Northern Illinois vs. Central Michigan
(516, '2024-11-30', 151, 2426),  -- East Carolina vs. Navy
(517, '2024-11-30', 275, 135),  -- Wisconsin vs. Minnesota
(518, '2024-11-30', 21, 2005),  -- San Diego State vs. Air Force
(519, '2024-11-30', 113, 41),  -- UMass vs. Connecticut
(520, '2024-11-30', 2711, 2199),  -- Western Michigan vs. Eastern Michigan
(521, '2024-11-30', 183, 2390),  -- Syracuse vs. Miami
(522, '2024-11-30', 23, 24),  -- San Jos├⌐ State vs. Stanford
(523, '2024-11-30', 218, 249),  -- Temple vs. North Texas
(524, '2024-11-30', 239, 2305),  -- Baylor vs. Kansas
(525, '2024-11-30', 36, 328),  -- Colorado State vs. Utah State
(526, '2024-11-30', 153, 152),  -- North Carolina vs. NC State
(527, '2024-11-30', 2567, 25),  -- SMU vs. California
(528, '2024-11-30', 259, 258),  -- Virginia Tech vs. Virginia
(529, '2024-11-30', 98, 55),  -- Western Kentucky vs. Jacksonville State
(530, '2024-11-30', 2429, 5),  -- Charlotte vs. UAB
(531, '2024-11-30', 2439, 2440),  -- UNLV vs. Nevada
(532, '2024-11-30', 154, 150),  -- Wake Forest vs. Duke
(533, '2024-11-30', 242, 58),  -- Rice vs. South Florida
(534, '2024-11-30', 12, 9),  -- Arizona vs. Arizona State
(535, '2024-11-30', 2132, 2628),  -- Cincinnati vs. TCU
(536, '2024-11-30', 252, 248),  -- BYU vs. Houston
(537, '2024-11-30', 202, 2226),  -- Tulsa vs. Florida Atlantic
(538, '2024-11-30', 68, 204),  -- Boise State vs. Oregon State
(539, '2024-11-30', 103, 221),  -- Boston College vs. Pittsburgh
(540, '2024-11-30', 2534, 2335),  -- Sam Houston State vs. Liberty
(541, '2024-11-30', 166, 2638),  -- New Mexico State vs. UTEP
(542, '2024-11-30', 213, 120),  -- Penn State vs. Maryland
(543, '2024-11-30', 2229, 2393),  -- Florida International vs. Middle Tennessee
(544, '2024-11-30', 127, 164);  -- Michigan State vs. Rutgers

INSERT INTO `ODDS` (odds_id, home_win_odds, away_win_odds) VALUES
(1, 1.58, 1.33), 
(2, 2.97, 1.53), 
(3, 2.54, 2.66), 
(4, 2.16, 2.31), 
(5, 1.44, 2.43), 
(6, 1.85, 2.09), 
(7, 1.95, 1.6), 
(8, 1.56, 1.87), 
(9, 1.24, 2.52), 
(10, 2.4, 2.69), 
(11, 1.53, 1.59), 
(12, 2.09, 1.54), 
(13, 2.6, 1.65), 
(14, 1.1, 2.41), 
(15, 1.54, 2), 
(16, 1.03, 2.12), 
(17, 1.92, 1.61), 
(18, 2.23, 1.32), 
(19, 1.48, 1.85), 
(20, 2.72, 1.75), 
(21, 1.41, 2.32), 
(22, 1.52, 1.59), 
(23, 1.29, 2.75), 
(24, 2.34, 1.1), 
(25, 2.25, 1.5), 
(26, 1.27, 1.09), 
(27, 2.87, 2.88), 
(28, 2.55, 1.56), 
(29, 1.32, 1.7), 
(30, 2.84, 1.19), 
(31, 2.07, 2.08), 
(32, 2.41, 1.49), 
(33, 1.29, 2.35), 
(34, 2.37, 1.6), 
(35, 2.63, 1.42), 
(36, 1.9, 1.34), 
(37, 2.99, 2.45), 
(38, 1.28, 2.54), 
(39, 2.71, 1.51), 
(40, 1.12, 2.81), 
(41, 2.77, 2.16), 
(42, 1.12, 2.64), 
(43, 1.87, 1.47), 
(44, 2.33, 1.04), 
(45, 2.66, 2.59), 
(46, 1.46, 2.88), 
(47, 1.06, 2.82), 
(48, 2.34, 1.67), 
(49, 1.45, 2.28), 
(50, 1.24, 1.49), 
(51, 1.14, 1.69), 
(52, 2.57, 1.5), 
(53, 1.73, 2.56), 
(54, 1.15, 2.61), 
(55, 1.11, 1.48), 
(56, 1.11, 1.81), 
(57, 1.17, 1.39), 
(58, 2.25, 2.2), 
(59, 1.68, 2.06), 
(60, 2.45, 2.04), 
(61, 1.96, 1.52), 
(62, 1.13, 1.93), 
(63, 1.21, 1.8), 
(64, 1.72, 2.75), 
(65, 1.74, 1.14), 
(66, 2.64, 2.36), 
(67, 1.67, 1.59), 
(68, 2.47, 2.33), 
(69, 2.24, 1.75), 
(70, 1.27, 1.78), 
(71, 1.35, 1.52), 
(72, 2.75, 1.32), 
(73, 1.09, 2.64), 
(74, 2.65, 2.24), 
(75, 2.08, 2.14), 
(76, 1.35, 1.24), 
(77, 1.15, 1.29), 
(78, 2.7, 2.65), 
(79, 2.1, 1.84), 
(80, 2.76, 1.44), 
(81, 2.45, 2.87), 
(82, 1.78, 1.11), 
(83, 1.15, 1.38), 
(84, 2.51, 2.95), 
(85, 2.47, 1.2), 
(86, 1.37, 2.7), 
(87, 2.56, 2.6), 
(88, 2.78, 2.29), 
(89, 1.39, 1.01), 
(90, 1.68, 1.4), 
(91, 2.84, 2.48), 
(92, 1.85, 2.21), 
(93, 1.3, 2.5), 
(94, 2.8, 2.04), 
(95, 2.29, 2.65), 
(96, 2.93, 1.31), 
(97, 2.7, 1.61), 
(98, 1.51, 2.51), 
(99, 1.62, 1.69), 
(100, 2.93, 2.82), 
(101, 2.01, 1.49), 
(102, 1.84, 1.88), 
(103, 1.09, 2.41), 
(104, 1.07, 1.94), 
(105, 2.18, 1.37), 
(106, 2.47, 2.22), 
(107, 1.05, 1.97), 
(108, 2.97, 1.07), 
(109, 2.6, 1.91), 
(110, 1.08, 1.71), 
(111, 1.31, 1.18), 
(112, 1.48, 2.67), 
(113, 2.35, 1.49), 
(114, 1.51, 1.45), 
(115, 2.48, 2.7), 
(116, 1.02, 2.02), 
(117, 2.86, 2.33), 
(118, 2.54, 1.49), 
(119, 1.72, 1.08), 
(120, 2.45, 2.55), 
(121, 1.31, 1.49), 
(122, 1.46, 2.73), 
(123, 2.27, 1.78), 
(124, 2.75, 1.85), 
(125, 2.53, 2.58), 
(126, 2, 2.26), 
(127, 2.76, 2.61), 
(128, 1.55, 2), 
(129, 2.92, 1.47), 
(130, 2.48, 1.07), 
(131, 1.61, 2.73), 
(132, 2.95, 1.63), 
(133, 2.58, 2.05), 
(134, 2.95, 2.19), 
(135, 2.47, 2.15), 
(136, 1.55, 1.96), 
(137, 1.85, 2.12), 
(138, 1.43, 1.29), 
(139, 1.36, 1.61), 
(140, 2.72, 1.72), 
(141, 1.18, 2.91), 
(142, 1.95, 2.97), 
(143, 2.15, 2.51), 
(144, 2.84, 1.11), 
(145, 1.69, 2.12), 
(146, 1.97, 1.07), 
(147, 2.58, 2.88), 
(148, 1.81, 1.26), 
(149, 2.74, 2.68), 
(150, 1.07, 1.75), 
(151, 1.48, 2.87), 
(152, 1.2, 1.16), 
(153, 2.77, 2.48), 
(154, 1.15, 2.52), 
(155, 1.92, 1.78), 
(156, 2.35, 2.01), 
(157, 1.25, 2.11), 
(158, 2.16, 1.7), 
(159, 2.58, 1.35), 
(160, 1.76, 2.01), 
(161, 1.95, 2.41), 
(162, 1.46, 2.08), 
(163, 1.47, 1.44), 
(164, 1.85, 1.8), 
(165, 2.27, 2.72), 
(166, 2.12, 2.1), 
(167, 2.61, 2.45), 
(168, 2.05, 2.52), 
(169, 1.62, 2.14), 
(170, 2.43, 2.93), 
(171, 2.96, 2.88), 
(172, 1.74, 2.55), 
(173, 2.42, 2.15), 
(174, 2.83, 2.14), 
(175, 2.7, 1.71), 
(176, 1.7, 1.25), 
(177, 2.2, 1.81), 
(178, 2.94, 1.5), 
(179, 2.8, 1.8), 
(180, 1.18, 2.55), 
(181, 2.24, 1.83), 
(182, 2.06, 1.81), 
(183, 1.58, 1.81), 
(184, 1.81, 2.05), 
(185, 2.94, 1.41), 
(186, 2.18, 2.65), 
(187, 1.14, 1.55), 
(188, 1.01, 1.47), 
(189, 2.88, 1.65), 
(190, 2.11, 1.3), 
(191, 1.25, 1.21), 
(192, 2.92, 2.56), 
(193, 2.93, 1.34), 
(194, 1.25, 1.6), 
(195, 2.49, 2.73), 
(196, 2.71, 1.77), 
(197, 1.45, 1.43), 
(198, 1.77, 2), 
(199, 1.38, 1.95), 
(200, 2.44, 2.08), 
(201, 1.73, 1.46), 
(202, 2.04, 2.24), 
(203, 2.13, 2.84), 
(204, 2.56, 1.99), 
(205, 1.7, 1.17), 
(206, 1.91, 2.34), 
(207, 1.98, 2.03), 
(208, 1.23, 1.42), 
(209, 2.68, 1.64), 
(210, 2.42, 2.02), 
(211, 2.37, 1.92), 
(212, 2.84, 2.09), 
(213, 1.26, 2.6), 
(214, 1.78, 2.12), 
(215, 2.12, 1.77), 
(216, 1.26, 1.39), 
(217, 2.97, 1.47), 
(218, 1.88, 2.81), 
(219, 1.09, 2.67), 
(220, 2.03, 2.2), 
(221, 2.77, 1.33), 
(222, 1.63, 2.31), 
(223, 1.99, 1.31), 
(224, 1.73, 2.52), 
(225, 1.17, 1.32), 
(226, 1.75, 1.38), 
(227, 2.19, 1.35), 
(228, 1.78, 2.01), 
(229, 1.52, 2.13), 
(230, 1.48, 2.85), 
(231, 2.01, 2.25), 
(232, 1.64, 1.13), 
(233, 2.56, 1.83), 
(234, 1.51, 2.69), 
(235, 2.67, 1.42), 
(236, 2.42, 1.3), 
(237, 1.75, 2.65), 
(238, 2.07, 1.81), 
(239, 1.24, 1.8), 
(240, 2.89, 1.12), 
(241, 2.15, 2.88), 
(242, 1.83, 1.94), 
(243, 1.76, 2.33), 
(244, 1.38, 2.9), 
(245, 1.83, 1.03), 
(246, 2.96, 1.46), 
(247, 1.59, 1.57), 
(248, 1.44, 2.17), 
(249, 2.74, 1.67), 
(250, 1.46, 1.19), 
(251, 2.96, 1.04), 
(252, 2.68, 2.27), 
(253, 1.76, 1.15), 
(254, 2.81, 1.1), 
(255, 2.54, 1.04), 
(256, 2.78, 1.33), 
(257, 2.8, 1.54), 
(258, 2.08, 1.74), 
(259, 1.77, 2.16), 
(260, 2.63, 2.93), 
(261, 2.43, 1.94), 
(262, 2.77, 2.74), 
(263, 1.69, 2.58), 
(264, 2.83, 2.22), 
(265, 1.01, 1.41), 
(266, 1.22, 2.91), 
(267, 1.44, 2.8), 
(268, 2.3, 1.9), 
(269, 2.47, 1.89), 
(270, 1.51, 1.36), 
(271, 1.57, 1.04), 
(272, 2.11, 1.55), 
(273, 1.88, 2.03), 
(274, 2.94, 1.57), 
(275, 1.53, 1.45), 
(276, 1.72, 2.13), 
(277, 2.22, 1.56), 
(278, 2.33, 2.93), 
(279, 2.95, 1.45), 
(280, 2.49, 2.85), 
(281, 1.2, 1.61), 
(282, 1.38, 1.59), 
(283, 2.03, 1.88), 
(284, 1.5, 2.19), 
(285, 1.83, 2.82), 
(286, 2.83, 2.47), 
(287, 1.31, 1.9), 
(288, 2.11, 1.33), 
(289, 1.77, 1.74), 
(290, 2.43, 2.87), 
(291, 2.5, 1.04), 
(292, 1.29, 1.15), 
(293, 1.8, 1.21), 
(294, 2.7, 2.3), 
(295, 1.77, 1.35), 
(296, 1.95, 2.54), 
(297, 1.04, 3), 
(298, 1.32, 2.51), 
(299, 1.02, 1.19), 
(300, 2.94, 2.91), 
(301, 1.86, 2.99), 
(302, 2.38, 1.04), 
(303, 1.93, 2.42), 
(304, 2.95, 1.19), 
(305, 2.03, 2.27), 
(306, 2.15, 2.56), 
(307, 1.01, 2.29), 
(308, 2.69, 2.17), 
(309, 2.46, 1.75), 
(310, 1.19, 2.49), 
(311, 2.45, 2.95), 
(312, 1.15, 1.31), 
(313, 2.69, 2.14), 
(314, 1.12, 2.24), 
(315, 1.84, 1.57), 
(316, 1.39, 2.9), 
(317, 1.32, 1.8), 
(318, 1.12, 2.88), 
(319, 2.58, 1.6), 
(320, 2.63, 2.87), 
(321, 1.92, 2.52), 
(322, 2.48, 1.85), 
(323, 2.37, 1.34), 
(324, 2.66, 2.55), 
(325, 2.24, 1.9), 
(326, 1.02, 1.85), 
(327, 1.99, 2.39), 
(328, 1.76, 1.9), 
(329, 1.56, 2.96), 
(330, 2.18, 2.83), 
(331, 1.49, 1.14), 
(332, 1.67, 2.18), 
(333, 2.32, 1.87), 
(334, 1.49, 1.26), 
(335, 2.78, 2.99), 
(336, 1.44, 2.31), 
(337, 2.91, 1.45), 
(338, 2.64, 2.69), 
(339, 1.23, 2.92), 
(340, 2.13, 1.36), 
(341, 2.75, 2.18), 
(342, 1.03, 2.22), 
(343, 2.76, 2.42), 
(344, 2.08, 2.26), 
(345, 1.59, 1.6), 
(346, 2.27, 1.64), 
(347, 2.56, 1.99), 
(348, 2.09, 2.13), 
(349, 2.43, 1.26), 
(350, 2.46, 2.87), 
(351, 1.07, 1.16), 
(352, 1.64, 2.69), 
(353, 1.02, 2.51), 
(354, 2.16, 1.97), 
(355, 2.08, 2.35), 
(356, 2.54, 2.05), 
(357, 1.92, 2.35), 
(358, 1.74, 2.09), 
(359, 2.27, 2.08), 
(360, 2.74, 1.24), 
(361, 2.23, 2.13), 
(362, 1.71, 1.83), 
(363, 2.7, 2.41), 
(364, 1.16, 2.45), 
(365, 1.05, 1.88), 
(366, 1.57, 2.42), 
(367, 1.67, 2.8), 
(368, 1.68, 1.02), 
(369, 1.84, 1.84), 
(370, 1.24, 2.83), 
(371, 2.51, 1.98), 
(372, 2.64, 1.99), 
(373, 1.9, 1.81), 
(374, 1.71, 1.8), 
(375, 2.69, 2.44), 
(376, 2.87, 1.45), 
(377, 2.85, 2.97), 
(378, 1.69, 1.98), 
(379, 1.61, 2.86), 
(380, 2.43, 2.75), 
(381, 1.02, 2.98), 
(382, 1.56, 1.1), 
(383, 2.07, 2.12), 
(384, 1.46, 2.03), 
(385, 1.07, 2.05), 
(386, 1.88, 2.13), 
(387, 1.51, 1.58), 
(388, 2.69, 2.89), 
(389, 2.33, 1.34), 
(390, 2.89, 1.19), 
(391, 2.84, 2.64), 
(392, 2.16, 1.74), 
(393, 1.83, 2.36), 
(394, 1.61, 2.37), 
(395, 2.47, 2.12), 
(396, 2.96, 2.83), 
(397, 2.77, 2.91), 
(398, 1.27, 2.3), 
(399, 1.08, 2.05), 
(400, 1.56, 2.61), 
(401, 2.32, 2.64), 
(402, 2.84, 2.29), 
(403, 1.15, 2), 
(404, 1.95, 2.26), 
(405, 2.58, 1.37), 
(406, 1.74, 1.43), 
(407, 1.75, 1.33), 
(408, 2.56, 2.72), 
(409, 2.72, 2.86), 
(410, 2.85, 2.25), 
(411, 1.71, 1.88), 
(412, 2.85, 2.17), 
(413, 1.77, 2.95), 
(414, 1.59, 1.61), 
(415, 2.3, 1.6), 
(416, 1.01, 2.01), 
(417, 2.22, 1.9), 
(418, 1.93, 2.31), 
(419, 1.26, 1.34), 
(420, 2.45, 1.07), 
(421, 2.35, 1.15), 
(422, 2.72, 2.13), 
(423, 1.29, 2.91), 
(424, 1.81, 2.87), 
(425, 1.38, 1.4), 
(426, 1.81, 2.97), 
(427, 2.53, 1.89), 
(428, 2.08, 2.41), 
(429, 1.06, 2.75), 
(430, 1.44, 1.76), 
(431, 2.53, 1.81), 
(432, 2.83, 2.03), 
(433, 1.56, 2.74), 
(434, 1.69, 1.71), 
(435, 1.7, 2.71), 
(436, 2.42, 1.74), 
(437, 2.32, 1.33), 
(438, 2.87, 2.57), 
(439, 2.45, 2.23), 
(440, 1.41, 1.84), 
(441, 1.97, 2.22), 
(442, 1.04, 1.3), 
(443, 2.31, 2.89), 
(444, 2.98, 2.68), 
(445, 2.25, 1.42), 
(446, 1.46, 1.77), 
(447, 1.39, 1.82), 
(448, 2.66, 1.16), 
(449, 1.95, 1.16), 
(450, 1.82, 2.18), 
(451, 1.52, 1.88), 
(452, 1.97, 1.41), 
(453, 1.28, 1.97), 
(454, 2.01, 2.7), 
(455, 1.24, 2.85), 
(456, 2.76, 2.04), 
(457, 2.07, 2.74), 
(458, 1.82, 1.1), 
(459, 2.45, 2.04), 
(460, 2.11, 1.43), 
(461, 2.81, 2.45), 
(462, 2.18, 2.52), 
(463, 1.7, 1.88), 
(464, 2.63, 1.31), 
(465, 1.29, 2.96), 
(466, 1.41, 2.97), 
(467, 1.52, 1.74), 
(468, 2.51, 2.9), 
(469, 1.09, 2.72), 
(470, 2.83, 2.23), 
(471, 2.03, 1.54), 
(472, 1.01, 2.63), 
(473, 2.38, 1.6), 
(474, 1.61, 1.66), 
(475, 1.99, 1.78), 
(476, 2.02, 2.3), 
(477, 2.36, 1.01), 
(478, 1.57, 2.24), 
(479, 2.71, 2.05), 
(480, 2.5, 1.58), 
(481, 1.02, 2.38), 
(482, 2.64, 2.05), 
(483, 1.1, 1.51), 
(484, 1.05, 2.07), 
(485, 1.35, 1.96), 
(486, 2.6, 1.96), 
(487, 1.41, 2.17), 
(488, 2.17, 2.49), 
(489, 2.91, 2.13), 
(490, 1.43, 2.64), 
(491, 2.68, 1.6), 
(492, 1.77, 1.43), 
(493, 1.85, 1.36), 
(494, 1.75, 2.15), 
(495, 1.35, 2.25), 
(496, 1.66, 1.24), 
(497, 2.05, 1.96), 
(498, 1.17, 1.45), 
(499, 2.5, 2.37), 
(500, 1.44, 1.04), 
(501, 2.8, 2.81), 
(502, 1.8, 2.61), 
(503, 2.14, 2.99), 
(504, 3, 1.63), 
(505, 2.66, 1.13), 
(506, 2.82, 1.95), 
(507, 2.71, 2.82), 
(508, 1.52, 2.42), 
(509, 2.46, 1.31), 
(510, 1.44, 1.02), 
(511, 1.1, 2.67), 
(512, 2.46, 1.14), 
(513, 2.85, 2.14), 
(514, 1.35, 2.3), 
(515, 2.1, 1.22), 
(516, 1.85, 1.75), 
(517, 2.52, 2.63), 
(518, 1.07, 2.4), 
(519, 2.17, 2.69), 
(520, 2.46, 2.38), 
(521, 1.22, 2.22), 
(522, 2.53, 2.93), 
(523, 2.55, 2.96), 
(524, 2.35, 1.44), 
(525, 1.16, 2.96), 
(526, 2.3, 2.8), 
(527, 2.12, 2.92), 
(528, 1.07, 1.93), 
(529, 2.86, 1.93), 
(530, 1.19, 2.01), 
(531, 1.7, 2.57), 
(532, 2.81, 1.42), 
(533, 2.84, 2.82), 
(534, 2.01, 1.77), 
(535, 2.76, 2.7), 
(536, 2.52, 1.22), 
(537, 2.68, 2.98), 
(538, 2.66, 1.07), 
(539, 1.71, 1.16), 
(540, 1.8, 2.63), 
(541, 1.63, 1.53), 
(542, 2.62, 2.03), 
(543, 2.48, 1.75), 
(544, 2.97, 1.13);


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

DELIMITER //

CREATE PROCEDURE payout_bets(IN _game_id INT)
BEGIN
  DECLARE winning_team_id INT;
  DECLARE home_team_id INT;
  DECLARE away_team_id INT;

  SELECT winner_id, home_team_id, away_team_id 
  INTO winning_team_id, home_team_id, away_team_id 
  FROM GAME 
  WHERE game_id = _game_id;

  UPDATE USER U
  JOIN BETS_ON B ON U.user_id = B.user_id
  SET U.balance = U.balance + B.payout
  WHERE B.game_id = _game_id 
  AND ((B.bet_type = 'Home Win' AND winning_team_id = home_team_id)
  OR   (B.bet_type = 'Away Win' AND winning_team_id = away_win_odds));
END //

DELIMETER ;

DELIMITER //

CREATE TRIGGER after_winner_id_update
AFTER UPDATE ON GAME
FOR EACH ROW
BEGIN

  IF NEW.winning_team_id <> OLD.winning_team_id THEN

    CALL determine_payout(NEW.game_id);
  END IF;
END //

DELIMITER ;