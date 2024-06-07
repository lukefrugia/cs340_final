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
(2005, 'Air Force', 'Falcons ', 1),
(2006, 'Akron', 'Zips ', 1),
(333, 'Alabama', 'Crimson Tide ', 1),
(2026, 'Appalachian State', 'Mountaineers ', 1),
(12, 'Arizona', 'Wildcats ', 1),
(9, 'Arizona State', 'Sun Devils ', 1),
(8, 'Arkansas', 'Razorbacks ', 1),
(2032, 'Arkansas State', 'Red Wolves ', 1),
(349, 'Army', 'Black Knights ', 1),
(2, 'Auburn', 'Tigers ', 1),
(2050, 'Ball State', 'Cardinals ', 1),
(239, 'Baylor', 'Bears ', 1),
(68, 'Boise State', 'Broncos ', 1),
(103, 'Boston College', 'Eagles ', 1),
(189, 'Bowling Green', 'Falcons ', 1),
(2084, 'Buffalo', 'Bulls ', 1),
(252, 'BYU', 'Cougars ', 1),
(25, 'California', 'Golden Bears ', 1),
(2117, 'Central Michigan', 'Chippewas ', 1),
(2429, 'Charlotte', '49ers ', 1),
(2132, 'Cincinnati', 'Bearcats ', 1),
(228, 'Clemson', 'Tigers ', 1),
(324, 'Coastal Carolina', 'Chanticleers ', 1),
(38, 'Colorado', 'Buffaloes ', 1),
(36, 'Colorado State', 'Rams ', 1),
(41, 'Connecticut', 'Huskies ', 1),
(150, 'Duke', 'Blue Devils ', 1),
(151, 'East Carolina', 'Pirates ', 1),
(2199, 'Eastern Michigan', 'Eagles ', 1),
(57, 'Florida', 'Gators ', 1),
(2226, 'Florida Atlantic', 'Owls ', 1),
(2229, 'Florida International', 'Golden Panthers ', 1),
(52, 'Florida State', 'Seminoles ', 1),
(278, 'Fresno State', 'Bulldogs ', 1),
(61, 'Georgia', 'Bulldogs ', 1),
(290, 'Georgia Southern', 'Eagles ', 1),
(2247, 'Georgia State', 'Panthers ', 1),
(59, 'Georgia Tech', 'Yellow Jackets ', 1),
(62, 'Hawaii', 'Rainbow Warriors ', 1),
(248, 'Houston', 'Cougars ', 1),
(356, 'Illinois', 'Fighting Illini ', 1),
(84, 'Indiana', 'Hoosiers ', 1),
(2294, 'Iowa', 'Hawkeyes ', 1),
(66, 'Iowa State', 'Cyclones ', 1),
(55, 'Jacksonville State', 'Gamecocks ', 1),
(256, 'James Madison', 'Dukes ', 1),
(2305, 'Kansas', 'Jayhawks ', 1),
(2306, 'Kansas State', 'Wildcats ', 1),
(2309, 'Kent State', 'Golden Flashes ', 1),
(96, 'Kentucky', 'Wildcats ', 1),
(2335, 'Liberty', 'Flames ', 1),
(309, 'Louisiana', 'Ragin Cajuns ', 1),
(2433, 'Louisiana Monroe', 'Warhawks ', 1),
(2348, 'Louisiana Tech', 'Bulldogs ', 1),
(97, 'Louisville', 'Cardinals ', 1),
(99, 'LSU', 'Tigers ', 1),
(276, 'Marshall', 'Thundering Herd ', 1),
(120, 'Maryland', 'Terrapins ', 1),
(235, 'Memphis', 'Tigers ', 1),
(2390, 'Miami', 'Hurricanes ', 1),
(193, 'Miami (OH)', 'RedHawks ', 1),
(130, 'Michigan', 'Wolverines ', 1),
(127, 'Michigan State', 'Spartans ', 1),
(2393, 'Middle Tennessee', 'Blue Raiders ', 1),
(135, 'Minnesota', 'Golden Gophers ', 1),
(344, 'Mississippi State', 'Bulldogs ', 1),
(142, 'Missouri', 'Tigers ', 1),
(2426, 'Navy', 'Midshipmen ', 1),
(152, 'NC State', 'Wolfpack ', 1),
(158, 'Nebraska', 'Cornhuskers ', 1),
(2440, 'Nevada', 'Wolf Pack ', 1),
(167, 'New Mexico', 'Lobos ', 1),
(166, 'New Mexico State', 'Aggies ', 1),
(153, 'North Carolina', 'Tar Heels ', 1),
(2459, 'Northern Illinois', 'Huskies ', 1),
(249, 'North Texas', 'Mean Green ', 1),
(77, 'Northwestern', 'Wildcats ', 1),
(87, 'Notre Dame', 'Fighting Irish ', 1),
(195, 'Ohio', 'Bobcats ', 1),
(194, 'Ohio State', 'Buckeyes ', 1),
(201, 'Oklahoma', 'Sooners ', 1),
(197, 'Oklahoma State', 'Cowboys ', 1),
(295, 'Old Dominion', 'Monarchs ', 1),
(145, 'Ole Miss', 'Rebels ', 1),
(2483, 'Oregon', 'Ducks ', 1),
(204, 'Oregon State', 'Beavers ', 1),
(213, 'Penn State', 'Nittany Lions ', 1),
(221, 'Pittsburgh', 'Panthers ', 1),
(2509, 'Purdue', 'Boilermakers ', 1),
(242, 'Rice', 'Owls ', 1),
(164, 'Rutgers', 'Scarlet Knights ', 1),
(2534, 'Sam Houston State', 'Bearkats ', 1),
(21, 'San Diego State', 'Aztecs ', 1),
(23, 'San Jos├⌐ State', 'Spartans ', 1),
(2567, 'SMU', 'Mustangs ', 1),
(6, 'South Alabama', 'Jaguars ', 1),
(2579, 'South Carolina', 'Gamecocks ', 1),
(2572, 'Southern Mississippi', 'Golden Eagles ', 1),
(58, 'South Florida', 'Bulls ', 1),
(24, 'Stanford', 'Cardinal ', 1),
(183, 'Syracuse', 'Orange ', 1),
(2628, 'TCU', 'Horned Frogs ', 1),
(218, 'Temple', 'Owls ', 1),
(2633, 'Tennessee', 'Volunteers ', 1),
(251, 'Texas', 'Longhorns ', 1),
(245, 'Texas A&M', 'Aggies ', 1),
(326, 'Texas State', 'Bobcats ', 1),
(2641, 'Texas Tech', 'Red Raiders ', 1),
(2649, 'Toledo', 'Rockets ', 1),
(2653, 'Troy', 'Trojans ', 1),
(2655, 'Tulane', 'Green Wave ', 1),
(202, 'Tulsa', 'Golden Hurricane ', 1),
(5, 'UAB', 'Blazers ', 1),
(2116, 'UCF', 'Knights ', 1),
(26, 'UCLA', 'Bruins ', 1),
(113, 'UMass', 'Minutemen ', 1),
(2439, 'UNLV', 'Rebels ', 1),
(30, 'USC', 'Trojans ', 1),
(254, 'Utah', 'Utes ', 1),
(328, 'Utah State', 'Aggies ', 1),
(2638, 'UTEP', 'Miners ', 1),
(2636, 'UT San Antonio', 'Roadrunners ', 1),
(238, 'Vanderbilt', 'Commodores ', 1),
(258, 'Virginia', 'Cavaliers ', 1),
(259, 'Virginia Tech', 'Hokies ', 1),
(154, 'Wake Forest', 'Demon Deacons ', 1),
(264, 'Washington', 'Huskies ', 1),
(265, 'Washington State', 'Cougars ', 1),
(98, 'Western Kentucky', 'Hilltoppers ', 1),
(2711, 'Western Michigan', 'Broncos ', 1),
(277, 'West Virginia', 'Mountaineers ', 1),
(275, 'Wisconsin', 'Badgers ', 1),
(2751, 'Wyoming', 'Cowboys ', 1);

INSERT INTO `GAME` (game_id, game_date, home_team_id, away_team_id) VALUES
(1, '2024-08-24', 167 , 147 ),  -- New Mexico vs. Montana State
(2, '2024-08-24', 62 , 2169 ),  -- Hawai'i vs. Delaware State
(3, '2024-08-24', 2440 , 2567 ),  -- Nevada vs. SMU
(4, '2024-08-24', 59 , 52 ),  -- Georgia Tech vs. Florida State
(5, '2024-08-29', 2117 , 2115 ),  -- Central Michigan vs. Central Connecticut
(6, '2024-08-29', 2649 , 2184 ),  -- Toledo vs. Duquesne
(7, '2024-08-29', 23 , 16 ),  -- San Jos├⌐ State vs. Sacramento State
(8, '2024-08-29', 2116 , 160 ),  -- UCF vs. New Hampshire
(9, '2024-08-29', 135 , 153 ),  -- Minnesota vs. North Carolina
(10, '2024-08-29', 202 , 2466 ),  -- Tulsa vs. Northwestern State
(11, '2024-08-29', 152 , 2717 ),  -- NC State vs. Western Carolina
(12, '2024-08-29', 2655 , 2545 ),  -- Tulane vs. Southeastern Louisiana
(13, '2024-08-29', 5 , 2016 ),  -- UAB vs. Alcorn State
(14, '2024-08-29', 189 , 2230 ),  -- Bowling Green vs. Fordham
(15, '2024-08-29', 254 , 253 ),  -- Utah vs. Southern Utah
(16, '2024-08-29', 154 , 2448 ),  -- Wake Forest vs. North Carolina A&T
(17, '2024-08-29', 2305 , 2815 ),  -- Kansas vs. Lindenwood
(18, '2024-08-29', 356 , 2197 ),  -- Illinois vs. Eastern Illinois
(19, '2024-08-29', 2084 , 322 ),  -- Buffalo vs. Lafayette
(20, '2024-08-29', 8 , 2029 ),  -- Arkansas vs. Arkansas-Pine Bluff
(21, '2024-08-30', 38 , 2449 ),  -- Colorado vs. North Dakota State
(22, '2024-08-30', 142 , 93 ),  -- Missouri vs. Murray State
(23, '2024-08-30', 2433 , 2296 ),  -- Louisiana Monroe vs. Jackson State
(24, '2024-08-30', 150 , 2210 ),  -- Duke vs. Elon
(25, '2024-08-30', 349 , 2329 ),  -- Army vs. Lehigh
(26, '2024-08-30', 201 , 218 ),  -- Oklahoma vs. Temple
(27, '2024-08-31', 24 , 2628 ),  -- Stanford vs. TCU
(28, '2024-08-31', 248 , 2439 ),  -- Houston vs. UNLV
(29, '2024-08-31', 77 , 193 ),  -- Northwestern vs. Miami (OH)
(30, '2024-08-31', 183 , 195 ),  -- Syracuse vs. Ohio
(31, '2024-08-31', 221 , 2309 ),  -- Pittsburgh vs. Kent State
(32, '2024-08-31', 194 , 2006 ),  -- Ohio State vs. Akron
(33, '2024-08-31', 275 , 2711 ),  -- Wisconsin vs. Western Michigan
(34, '2024-08-31', 113 , 2199 ),  -- UMass vs. Eastern Michigan
(35, '2024-08-31', 238 , 259 ),  -- Vanderbilt vs. Virginia Tech
(36, '2024-08-31', 290 , 68 ),  -- Georgia Southern vs. Boise State
(37, '2024-08-31', 9 , 2751 ),  -- Arizona State vs. Wyoming
(38, '2024-08-31', 12 , 167 ),  -- Arizona vs. New Mexico
(39, '2024-08-31', 130 , 278 ),  -- Michigan vs. Fresno State
(40, '2024-08-31', 2483 , 70 ),  -- Oregon vs. Idaho
(41, '2024-08-31', 2653 , 2440 ),  -- Troy vs. Nevada
(42, '2024-08-31', 277 , 213 ),  -- West Virginia vs. Penn State
(43, '2024-08-31', 328 , 2523 ),  -- Utah State vs. Robert Morris
(44, '2024-08-31', 166 , 2546 ),  -- New Mexico State vs. Southeast Missouri State
(45, '2024-08-31', 2306 , 2630 ),  -- Kansas State vs. UT Martin
(46, '2024-08-31', 2393 , 2635 ),  -- Middle Tennessee vs. Tennessee Tech
(47, '2024-08-31', 2335 , 2097 ),  -- Liberty vs. Campbell
(48, '2024-08-31', 2636 , 338 ),  -- UT San Antonio vs. Kennesaw State
(49, '2024-08-31', 2641 , 2000 ),  -- Texas Tech vs. Abilene Christian
(50, '2024-08-31', 97 , 2046 ),  -- Louisville vs. Austin Peay
(51, '2024-08-31', 344 , 2198 ),  -- Mississippi State vs. Eastern Kentucky
(52, '2024-08-31', 235 , 2453 ),  -- Memphis vs. North Alabama
(53, '2024-08-31', 239 , 2627 ),  -- Baylor vs. Tarleton State
(54, '2024-08-31', 84 , 2229 ),  -- Indiana vs. Florida International
(55, '2024-08-31', 158 , 2638 ),  -- Nebraska vs. UTEP
(56, '2024-08-31', 62 , 26 ),  -- Hawai'i vs. UCLA
(57, '2024-08-31', 2429 , 256 ),  -- Charlotte vs. James Madison
(58, '2024-08-31', 2579 , 295 ),  -- South Carolina vs. Old Dominion
(59, '2024-08-31', 55 , 324 ),  -- Jacksonville State vs. Coastal Carolina
(60, '2024-08-31', 59 , 2247 ),  -- Georgia Tech vs. Georgia State
(61, '2024-08-31', 96 , 2572 ),  -- Kentucky vs. Southern Mississippi
(62, '2024-08-31', 2426 , 2083 ),  -- Navy vs. Bucknell
(63, '2024-08-31', 326 , 2320 ),  -- Texas State vs. Lamar
(64, '2024-08-31', 2 , 2010 ),  -- Auburn vs. Alabama A&M
(65, '2024-08-31', 58 , 2065 ),  -- South Florida vs. Bethune-Cookman
(66, '2024-08-31', 309 , 2755 ),  -- Louisiana vs. Grambling
(67, '2024-08-31', 120 , 41 ),  -- Maryland vs. Connecticut
(68, '2024-08-31', 258 , 257 ),  -- Virginia vs. Richmond
(69, '2024-08-31', 276 , 2619 ),  -- Marshall vs. Stony Brook
(70, '2024-08-31', 25 , 302 ),  -- California vs. UC Davis
(71, '2024-08-31', 2132 , 119 ),  -- Cincinnati vs. Towson
(72, '2024-08-31', 204 , 304 ),  -- Oregon State vs. Idaho State
(73, '2024-08-31', 265 , 2502 ),  -- Washington State vs. Portland State
(74, '2024-08-31', 264 , 2692 ),  -- Washington vs. Weber State
(75, '2024-08-31', 164 , 47 ),  -- Rutgers vs. Howard
(76, '2024-08-31', 151 , 2450 ),  -- East Carolina vs. Norfolk State
(77, '2024-08-31', 66 , 155 ),  -- Iowa State vs. North Dakota
(78, '2024-08-31', 2005 , 2771 ),  -- Air Force vs. Merrimack
(79, '2024-08-31', 197 , 2571 ),  -- Oklahoma State vs. South Dakota State
(80, '2024-08-31', 2294 , 2287 ),  -- Iowa vs. Illinois State
(81, '2024-08-31', 2509 , 282 ),  -- Purdue vs. Indiana State
(82, '2024-08-31', 252 , 79 ),  -- BYU vs. Southern Illinois
(83, '2024-08-31', 2459 , 2710 ),  -- Northern Illinois vs. Western Illinois
(84, '2024-08-31', 127 , 2226 ),  -- Michigan State vs. Florida Atlantic
(85, '2024-08-31', 6 , 249 ),  -- South Alabama vs. North Texas
(86, '2024-08-31', 242 , 2534 ),  -- Rice vs. Sam Houston State
(87, '2024-08-31', 21 , 2837 ),  -- San Diego State vs. Texas A&M-Commerce
(88, '2024-08-31', 2026 , 2193 ),  -- Appalachian State vs. East Tennessee State
(89, '2024-08-31', 2567 , 2277 ),  -- SMU vs. Houston Christian
(90, '2024-08-31', 2633 , 236 ),  -- Tennessee vs. Chattanooga
(91, '2024-08-31', 145 , 231 ),  -- Ole Miss vs. Furman
(92, '2024-08-31', 2348 , 2447 ),  -- Louisiana Tech vs. Nicholls
(93, '2024-08-31', 228 , 61 ),  -- Clemson vs. Georgia
(94, '2024-08-31', 57 , 2390 ),  -- Florida vs. Miami
(95, '2024-08-31', 251 , 36 ),  -- Texas vs. Colorado State
(96, '2024-08-31', 2032 , 2110 ),  -- Arkansas State vs. Central Arkansas
(97, '2024-08-31', 333 , 98 ),  -- Alabama vs. Western Kentucky
(98, '2024-08-31', 245 , 87 ),  -- Texas A&M vs. Notre Dame
(99, '2024-09-01', 30 , 99 ),  -- USC vs. LSU
(100, '2024-09-02', 52 , 103 ),  -- Florida State vs. Boston College
(101, '2024-09-06', 2567 , 252 ),  -- SMU vs. BYU
(102, '2024-09-07', 254 , 239 ),  -- Utah vs. Baylor
(103, '2024-09-07', 61 , 2635 ),  -- Georgia vs. Tennessee Tech
(104, '2024-09-07', 201 , 248 ),  -- Oklahoma vs. Houston
(105, '2024-09-07', 213 , 189 ),  -- Penn State vs. Bowling Green
(106, '2024-09-07', 278 , 16 ),  -- Fresno State vs. Sacramento State
(107, '2024-09-07', 2655 , 2306 ),  -- Tulane vs. Kansas State
(108, '2024-09-07', 245 , 2377 ),  -- Texas A&M vs. McNeese
(109, '2024-09-07', 2638 , 253 ),  -- UTEP vs. Southern Utah
(110, '2024-09-07', 333 , 58 ),  -- Alabama vs. South Florida
(111, '2024-09-07', 2649 , 113 ),  -- Toledo vs. UMass
(112, '2024-09-07', 145 , 2393 ),  -- Ole Miss vs. Middle Tennessee
(113, '2024-09-07', 2229 , 2117 ),  -- Florida International vs. Central Michigan
(114, '2024-09-07', 295 , 151 ),  -- Old Dominion vs. East Carolina
(115, '2024-09-07', 120 , 127 ),  -- Maryland vs. Michigan State
(116, '2024-09-07', 197 , 8 ),  -- Oklahoma State vs. Arkansas
(117, '2024-09-07', 2 , 25 ),  -- Auburn vs. California
(118, '2024-09-07', 166 , 2335 ),  -- New Mexico State vs. Liberty
(119, '2024-09-07', 9 , 344 ),  -- Arizona State vs. Mississippi State
(120, '2024-09-07', 153 , 2429 ),  -- North Carolina vs. Charlotte
(121, '2024-09-07', 249 , 2617 ),  -- North Texas vs. Stephen F. Austin
(122, '2024-09-07', 87 , 2459 ),  -- Notre Dame vs. Northern Illinois
(123, '2024-09-07', 2005 , 23 ),  -- Air Force vs. San Jos├⌐ State
(124, '2024-09-07', 142 , 2084 ),  -- Missouri vs. Buffalo
(125, '2024-09-07', 158 , 38 ),  -- Nebraska vs. Colorado
(126, '2024-09-07', 21 , 204 ),  -- San Diego State vs. Oregon State
(127, '2024-09-07', 2032 , 202 ),  -- Arkansas State vs. Tulsa
(128, '2024-09-07', 259 , 276 ),  -- Virginia Tech vs. Marshall
(129, '2024-09-07', 2440 , 290 ),  -- Nevada vs. Georgia Southern
(130, '2024-09-07', 2426 , 218 ),  -- Navy vs. Temple
(131, '2024-09-07', 228 , 2026 ),  -- Clemson vs. Appalachian State
(132, '2024-09-07', 195 , 6 ),  -- Ohio vs. South Alabama
(133, '2024-09-07', 98 , 2198 ),  -- Western Kentucky vs. Eastern Kentucky
(134, '2024-09-07', 2483 , 68 ),  -- Oregon vs. Boise State
(135, '2024-09-07', 97 , 55 ),  -- Louisville vs. Jacksonville State
(136, '2024-09-07', 324 , 2729 ),  -- Coastal Carolina vs. William & Mary
(137, '2024-09-07', 326 , 2636 ),  -- Texas State vs. UT San Antonio
(138, '2024-09-07', 154 , 258 ),  -- Wake Forest vs. Virginia
(139, '2024-09-07', 24 , 13 ),  -- Stanford vs. Cal Poly
(140, '2024-09-07', 77 , 150 ),  -- Northwestern vs. Duke
(141, '2024-09-07', 36 , 2458 ),  -- Colorado State vs. Northern Colorado
(142, '2024-09-07', 2628 , 2341 ),  -- TCU vs. Long Island University
(143, '2024-09-07', 12 , 2464 ),  -- Arizona vs. Northern Arizona
(144, '2024-09-07', 2226 , 349 ),  -- Florida Atlantic vs. Army
(145, '2024-09-07', 164 , 2006 ),  -- Rutgers vs. Akron
(146, '2024-09-07', 275 , 233 ),  -- Wisconsin vs. South Dakota
(147, '2024-09-07', 2751 , 70 ),  -- Wyoming vs. Idaho
(148, '2024-09-07', 41 , 2771 ),  -- Connecticut vs. Merrimack
(149, '2024-09-07', 130 , 251 ),  -- Michigan vs. Texas
(150, '2024-09-07', 2433 , 5 ),  -- Louisiana Monroe vs. UAB
(151, '2024-09-07', 338 , 309 ),  -- Kennesaw State vs. Louisiana
(152, '2024-09-07', 30 , 328 ),  -- USC vs. Utah State
(153, '2024-09-07', 2132 , 221 ),  -- Cincinnati vs. Pittsburgh
(154, '2024-09-07', 235 , 2653 ),  -- Memphis vs. Troy
(155, '2024-09-07', 2309 , 2598 ),  -- Kent State vs. St Francis (PA)
(156, '2024-09-07', 2390 , 50 ),  -- Miami vs. Florida A&M
(157, '2024-09-07', 238 , 2016 ),  -- Vanderbilt vs. Alcorn State
(158, '2024-09-07', 356 , 2305 ),  -- Illinois vs. Kansas
(159, '2024-09-07', 99 , 2447 ),  -- LSU vs. Nicholls
(160, '2024-09-07', 84 , 2710 ),  -- Indiana vs. Western Illinois
(161, '2024-09-07', 242 , 2640 ),  -- Rice vs. Texas Southern
(162, '2024-09-07', 2439 , 3101 ),  -- UNLV vs. Utah Tech
(163, '2024-09-07', 277 , 399 ),  -- West Virginia vs. Albany
(164, '2024-09-07', 2247 , 236 ),  -- Georgia State vs. Chattanooga
(165, '2024-09-07', 265 , 2641 ),  -- Washington State vs. Texas Tech
(166, '2024-09-07', 194 , 2711 ),  -- Ohio State vs. Western Michigan
(167, '2024-09-07', 256 , 2241 ),  -- James Madison vs. Gardner-Webb
(168, '2024-09-07', 2294 , 66 ),  -- Iowa vs. Iowa State
(169, '2024-09-07', 135 , 227 ),  -- Minnesota vs. Rhode Island
(170, '2024-09-07', 2050 , 2623 ),  -- Ball State vs. Missouri State
(171, '2024-09-07', 2572 , 2545 ),  -- Southern Mississippi vs. Southeastern Louisiana
(172, '2024-09-07', 2116 , 2534 ),  -- UCF vs. Sam Houston State
(173, '2024-09-07', 183 , 59 ),  -- Syracuse vs. Georgia Tech
(174, '2024-09-07', 264 , 2199 ),  -- Washington vs. Eastern Michigan
(175, '2024-09-07', 103 , 2184 ),  -- Boston College vs. Duquesne
(176, '2024-09-07', 57 , 2535 ),  -- Florida vs. Samford
(177, '2024-09-07', 96 , 2579 ),  -- Kentucky vs. South Carolina
(178, '2024-09-07', 152 , 2633 ),  -- NC State vs. Tennessee
(179, '2024-09-12', 6 , 2466 ),  -- South Alabama vs. Northwestern State
(180, '2024-09-12', 326 , 9 ),  -- Texas State vs. Arizona State
(181, '2024-09-13', 2306 , 12 ),  -- Kansas State vs. Arizona
(182, '2024-09-14', 135 , 2440 ),  -- Minnesota vs. Nevada
(183, '2024-09-14', 2084 , 113 ),  -- Buffalo vs. UMass
(184, '2024-09-14', 77 , 2197 ),  -- Northwestern vs. Eastern Illinois
(185, '2024-09-14', 2429 , 2241 ),  -- Charlotte vs. Gardner-Webb
(186, '2024-09-14', 251 , 2636 ),  -- Texas vs. UT San Antonio
(187, '2024-09-14', 23 , 338 ),  -- San Jos├⌐ State vs. Kennesaw State
(188, '2024-09-14', 356 , 2117 ),  -- Illinois vs. Central Michigan
(189, '2024-09-14', 154 , 145 ),  -- Wake Forest vs. Ole Miss
(190, '2024-09-14', 275 , 333 ),  -- Wisconsin vs. Alabama
(191, '2024-09-14', 2247 , 238 ),  -- Georgia State vs. Vanderbilt
(192, '2024-09-14', 142 , 103 ),  -- Missouri vs. Boston College
(193, '2024-09-14', 8 , 5 ),  -- Arkansas vs. UAB
(194, '2024-09-14', 2509 , 87 ),  -- Purdue vs. Notre Dame
(195, '2024-09-14', 295 , 259 ),  -- Old Dominion vs. Virginia Tech
(196, '2024-09-14', 158 , 2460 ),  -- Nebraska vs. Northern Iowa
(197, '2024-09-14', 344 , 2649 ),  -- Mississippi State vs. Toledo
(198, '2024-09-14', 290 , 2569 ),  -- Georgia Southern vs. South Carolina State
(199, '2024-09-14', 153 , 2428 ),  -- North Carolina vs. North Carolina Central
(200, '2024-09-14', 59 , 2678 ),  -- Georgia Tech vs. VMI
(201, '2024-09-14', 195 , 2415 ),  -- Ohio vs. Morgan State
(202, '2024-09-14', 2628 , 2116 ),  -- TCU vs. UCF
(203, '2024-09-14', 193 , 2132 ),  -- Miami (OH) vs. Cincinnati
(204, '2024-09-14', 202 , 197 ),  -- Tulsa vs. Oklahoma State
(205, '2024-09-14', 2751 , 252 ),  -- Wyoming vs. BYU
(206, '2024-09-14', 150 , 41 ),  -- Duke vs. Connecticut
(207, '2024-09-14', 127 , 2504 ),  -- Michigan State vs. Prairie View
(208, '2024-09-14', 2711 , 2065 ),  -- Western Michigan vs. Bethune-Cookman
(209, '2024-09-14', 278 , 166 ),  -- Fresno State vs. New Mexico State
(210, '2024-09-14', 221 , 277 ),  -- Pittsburgh vs. West Virginia
(211, '2024-09-14', 2633 , 2309 ),  -- Tennessee vs. Kent State
(212, '2024-09-14', 2006 , 2142 ),  -- Akron vs. Colgate
(213, '2024-09-14', 2294 , 2653 ),  -- Iowa vs. Troy
(214, '2024-09-14', 130 , 2032 ),  -- Michigan vs. Arkansas State
(215, '2024-09-14', 2641 , 249 ),  -- Texas Tech vs. North Texas
(216, '2024-09-14', 151 , 2026 ),  -- East Carolina vs. Appalachian State
(217, '2024-09-14', 218 , 324 ),  -- Temple vs. Coastal Carolina
(218, '2024-09-14', 248 , 242 ),  -- Houston vs. Rice
(219, '2024-09-14', 2 , 167 ),  -- Auburn vs. New Mexico
(220, '2024-09-14', 239 , 2005 ),  -- Baylor vs. Air Force
(221, '2024-09-14', 204 , 2483 ),  -- Oregon State vs. Oregon
(222, '2024-09-14', 25 , 21 ),  -- California vs. San Diego State
(223, '2024-09-14', 265 , 264 ),  -- Washington State vs. Washington
(224, '2024-09-14', 328 , 254 ),  -- Utah State vs. Utah
(225, '2024-09-14', 36 , 38 ),  -- Colorado State vs. Colorado
(226, '2024-09-14', 2390 , 2050 ),  -- Miami vs. Ball State
(227, '2024-09-14', 2305 , 2439 ),  -- Kansas vs. UNLV
(228, '2024-09-14', 2572 , 58 ),  -- Southern Mississippi vs. South Florida
(229, '2024-09-14', 2534 , 62 ),  -- Sam Houston State vs. Hawai'i
(230, '2024-09-14', 2335 , 2638 ),  -- Liberty vs. UTEP
(231, '2024-09-14', 258 , 120 ),  -- Virginia vs. Maryland
(232, '2024-09-14', 152 , 2348 ),  -- NC State vs. Louisiana Tech
(233, '2024-09-14', 2199 , 55 ),  -- Eastern Michigan vs. Jacksonville State
(234, '2024-09-14', 2226 , 2229 ),  -- Florida Atlantic vs. Florida International
(235, '2024-09-14', 2393 , 98 ),  -- Middle Tennessee vs. Western Kentucky
(236, '2024-09-14', 26 , 84 ),  -- UCLA vs. Indiana
(237, '2024-09-14', 201 , 2655 ),  -- Oklahoma vs. Tulane
(238, '2024-09-14', 52 , 235 ),  -- Florida State vs. Memphis
(239, '2024-09-14', 2579 , 99 ),  -- South Carolina vs. LSU
(240, '2024-09-14', 57 , 245 ),  -- Florida vs. Texas A&M
(241, '2024-09-14', 96 , 61 ),  -- Kentucky vs. Georgia
(242, '2024-09-19', 2026 , 6 ),  -- Appalachian State vs. South Alabama
(243, '2024-09-20', 183 , 24 ),  -- Syracuse vs. Stanford
(244, '2024-09-21', 265 , 23 ),  -- Washington State vs. San Jos├⌐ State
(245, '2024-09-21', 2393 , 150 ),  -- Middle Tennessee vs. Duke
(246, '2024-09-21', 228 , 152 ),  -- Clemson vs. NC State
(247, '2024-09-21', 2229 , 2405 ),  -- Florida International vs. Monmouth
(248, '2024-09-21', 2534 , 166 ),  -- Sam Houston State vs. New Mexico State
(249, '2024-09-21', 55 , 2572 ),  -- Jacksonville State vs. Southern Mississippi
(250, '2024-09-21', 167 , 278 ),  -- New Mexico vs. Fresno State
(251, '2024-09-21', 2641 , 9 ),  -- Texas Tech vs. Arizona State
(252, '2024-09-21', 251 , 2433 ),  -- Texas vs. Louisiana Monroe
(253, '2024-09-21', 135 , 2294 ),  -- Minnesota vs. Iowa
(254, '2024-09-21', 197 , 254 ),  -- Oklahoma State vs. Utah
(255, '2024-09-21', 2440 , 331 ),  -- Nevada vs. Eastern Washington
(256, '2024-09-21', 2348 , 202 ),  -- Louisiana Tech vs. Tulsa
(257, '2024-09-21', 98 , 2649 ),  -- Western Kentucky vs. Toledo
(258, '2024-09-21', 309 , 2655 ),  -- Louisiana vs. Tulane
(259, '2024-09-21', 2117 , 2050 ),  -- Central Michigan vs. Ball State
(260, '2024-09-21', 344 , 57 ),  -- Mississippi State vs. Florida
(261, '2024-09-21', 2459 , 2084 ),  -- Northern Illinois vs. Buffalo
(262, '2024-09-21', 213 , 2309 ),  -- Penn State vs. Kent State
(263, '2024-09-21', 66 , 2032 ),  -- Iowa State vs. Arkansas State
(264, '2024-09-21', 52 , 25 ),  -- Florida State vs. California
(265, '2024-09-21', 130 , 30 ),  -- Michigan vs. USC
(266, '2024-09-21', 38 , 239 ),  -- Colorado vs. Baylor
(267, '2024-09-21', 2579 , 2006 ),  -- South Carolina vs. Akron
(268, '2024-09-21', 158 , 356 ),  -- Nebraska vs. Illinois
(269, '2024-09-21', 99 , 26 ),  -- LSU vs. UCLA
(270, '2024-09-21', 68 , 2502 ),  -- Boise State vs. Portland State
(271, '2024-09-21', 62 , 2460 ),  -- Hawai'i vs. Northern Iowa
(272, '2024-09-21', 2567 , 2628 ),  -- SMU vs. TCU
(273, '2024-09-21', 221 , 2754 ),  -- Pittsburgh vs. Youngstown State
(274, '2024-09-21', 218 , 328 ),  -- Temple vs. Utah State
(275, '2024-09-21', 113 , 2681 ),  -- UMass vs. Wagner
(276, '2024-09-21', 245 , 189 ),  -- Texas A&M vs. Bowling Green
(277, '2024-09-21', 252 , 2306 ),  -- BYU vs. Kansas State
(278, '2024-09-21', 2199 , 2598 ),  -- Eastern Michigan vs. St Francis (PA)
(279, '2024-09-21', 2132 , 248 ),  -- Cincinnati vs. Houston
(280, '2024-09-21', 96 , 195 ),  -- Kentucky vs. Ohio
(281, '2024-09-21', 2653 , 50 ),  -- Troy vs. Florida A&M
(282, '2024-09-21', 41 , 2226 ),  -- Connecticut vs. Florida Atlantic
(283, '2024-09-21', 194 , 276 ),  -- Ohio State vs. Marshall
(284, '2024-09-21', 103 , 127 ),  -- Boston College vs. Michigan State
(285, '2024-09-21', 2636 , 2277 ),  -- UT San Antonio vs. Houston Christian
(286, '2024-09-21', 2 , 8 ),  -- Auburn vs. Arkansas
(287, '2024-09-21', 36 , 2638 ),  -- Colorado State vs. UTEP
(288, '2024-09-21', 2426 , 235 ),  -- Navy vs. Memphis
(289, '2024-09-21', 153 , 256 ),  -- North Carolina vs. James Madison
(290, '2024-09-21', 204 , 2509 ),  -- Oregon State vs. Purdue
(291, '2024-09-21', 84 , 2429 ),  -- Indiana vs. Charlotte
(292, '2024-09-21', 277 , 2305 ),  -- West Virginia vs. Kansas
(293, '2024-09-21', 349 , 242 ),  -- Army vs. Rice
(294, '2024-09-21', 58 , 2390 ),  -- South Florida vs. Miami
(295, '2024-09-21', 249 , 2751 ),  -- North Texas vs. Wyoming
(296, '2024-09-21', 87 , 193 ),  -- Notre Dame vs. Miami (OH)
(297, '2024-09-21', 2335 , 151 ),  -- Liberty vs. East Carolina
(298, '2024-09-21', 259 , 164 ),  -- Virginia Tech vs. Rutgers
(299, '2024-09-21', 201 , 2633 ),  -- Oklahoma vs. Tennessee
(300, '2024-09-21', 264 , 77 ),  -- Washington vs. Northwestern
(301, '2024-09-21', 97 , 59 ),  -- Louisville vs. Georgia Tech
(302, '2024-09-21', 120 , 222 ),  -- Maryland vs. Villanova
(303, '2024-09-21', 145 , 290 ),  -- Ole Miss vs. Georgia Southern
(304, '2024-09-21', 324 , 258 ),  -- Coastal Carolina vs. Virginia
(305, '2024-09-21', 142 , 238 ),  -- Missouri vs. Vanderbilt
(306, '2024-09-26', 218 , 349 ),  -- Temple vs. Army
(307, '2024-09-27', 2390 , 259 ),  -- Miami vs. Virginia Tech
(308, '2024-09-28', 254 , 12 ),  -- Utah vs. Arizona
(309, '2024-09-28', 30 , 275 ),  -- USC vs. Wisconsin
(310, '2024-09-28', 338 , 2630 ),  -- Kennesaw State vs. UT Martin
(311, '2024-09-28', 2305 , 2628 ),  -- Kansas vs. TCU
(312, '2024-09-28', 183 , 107 ),  -- Syracuse vs. Holy Cross
(313, '2024-09-28', 2309 , 2199 ),  -- Kent State vs. Eastern Michigan
(314, '2024-09-28', 2226 , 2681 ),  -- Florida Atlantic vs. Wagner
(315, '2024-09-28', 2653 , 2433 ),  -- Troy vs. Louisiana Monroe
(316, '2024-09-28', 5 , 2426 ),  -- UAB vs. Navy
(317, '2024-09-28', 2534 , 326 ),  -- Sam Houston State vs. Texas State
(318, '2024-09-28', 154 , 309 ),  -- Wake Forest vs. Louisiana
(319, '2024-09-28', 195 , 2006 ),  -- Ohio vs. Akron
(320, '2024-09-28', 130 , 135 ),  -- Michigan vs. Minnesota
(321, '2024-09-28', 99 , 6 ),  -- LSU vs. South Alabama
(322, '2024-09-28', 242 , 2429 ),  -- Rice vs. Charlotte
(323, '2024-09-28', 145 , 96 ),  -- Ole Miss vs. Kentucky
(324, '2024-09-28', 189 , 295 ),  -- Bowling Green vs. Old Dominion
(325, '2024-09-28', 166 , 167 ),  -- New Mexico State vs. New Mexico
(326, '2024-09-28', 2509 , 158 ),  -- Purdue vs. Nebraska
(327, '2024-09-28', 2567 , 52 ),  -- SMU vs. Florida State
(328, '2024-09-28', 2247 , 290 ),  -- Georgia State vs. Georgia Southern
(329, '2024-09-28', 2751 , 2005 ),  -- Wyoming vs. Air Force
(330, '2024-09-28', 2026 , 2335 ),  -- Appalachian State vs. Liberty
(331, '2024-09-28', 26 , 2483 ),  -- UCLA vs. Oregon
(332, '2024-09-28', 2439 , 278 ),  -- UNLV vs. Fresno State
(333, '2024-09-28', 68 , 265 ),  -- Boise State vs. Washington State
(334, '2024-09-28', 164 , 264 ),  -- Rutgers vs. Washington
(335, '2024-09-28', 256 , 2050 ),  -- James Madison vs. Ball State
(336, '2024-09-28', 2117 , 21 ),  -- Central Michigan vs. San Diego State
(337, '2024-09-28', 249 , 202 ),  -- North Texas vs. Tulsa
(338, '2024-09-28', 2116 , 38 ),  -- UCF vs. Colorado
(339, '2024-09-28', 41 , 2084 ),  -- Connecticut vs. Buffalo
(340, '2024-09-28', 193 , 113 ),  -- Miami (OH) vs. UMass
(341, '2024-09-28', 152 , 2459 ),  -- NC State vs. Northern Illinois
(342, '2024-09-28', 228 , 24 ),  -- Clemson vs. Stanford
(343, '2024-09-28', 251 , 344 ),  -- Texas vs. Mississippi State
(344, '2024-09-28', 87 , 97 ),  -- Notre Dame vs. Louisville
(345, '2024-09-28', 245 , 8 ),  -- Texas A&M vs. Arkansas
(346, '2024-09-28', 127 , 194 ),  -- Michigan State vs. Ohio State
(347, '2024-09-28', 213 , 356 ),  -- Penn State vs. Illinois
(348, '2024-09-28', 84 , 120 ),  -- Indiana vs. Maryland
(349, '2024-09-28', 235 , 2393 ),  -- Memphis vs. Middle Tennessee
(350, '2024-09-28', 2229 , 2348 ),  -- Florida International vs. Louisiana Tech
(351, '2024-09-28', 151 , 2636 ),  -- East Carolina vs. UT San Antonio
(352, '2024-09-28', 103 , 98 ),  -- Boston College vs. Western Kentucky
(353, '2024-09-28', 2655 , 58 ),  -- Tulane vs. South Florida
(354, '2024-09-28', 2641 , 2132 ),  -- Texas Tech vs. Cincinnati
(355, '2024-09-28', 239 , 252 ),  -- Baylor vs. BYU
(356, '2024-09-28', 2306 , 197 ),  -- Kansas State vs. Oklahoma State
(357, '2024-09-28', 276 , 2711 ),  -- Marshall vs. Western Michigan
(358, '2024-09-28', 2 , 201 ),  -- Auburn vs. Oklahoma
(359, '2024-09-28', 150 , 153 ),  -- Duke vs. North Carolina
(360, '2024-09-28', 248 , 66 ),  -- Houston vs. Iowa State
(361, '2024-09-28', 333 , 61 ),  -- Alabama vs. Georgia
(362, '2024-10-03', 2638 , 2534 ),  -- UTEP vs. Sam Houston State
(363, '2024-10-03', 2653 , 326 ),  -- Troy vs. Texas State
(364, '2024-10-04', 338 , 55 ),  -- Kennesaw State vs. Jacksonville State
(365, '2024-10-04', 2628 , 248 ),  -- TCU vs. Houston
(366, '2024-10-05', 158 , 164 ),  -- Nebraska vs. Rutgers
(367, '2024-10-05', 324 , 295 ),  -- Coastal Carolina vs. Old Dominion
(368, '2024-10-05', 2649 , 193 ),  -- Toledo vs. Miami (OH)
(369, '2024-10-05', 264 , 130 ),  -- Washington vs. Michigan
(370, '2024-10-05', 2459 , 113 ),  -- Northern Illinois vs. UMass
(371, '2024-10-05', 276 , 2026 ),  -- Marshall vs. Appalachian State
(372, '2024-10-05', 197 , 277 ),  -- Oklahoma State vs. West Virginia
(373, '2024-10-05', 24 , 259 ),  -- Stanford vs. Virginia Tech
(374, '2024-10-05', 97 , 2567 ),  -- Louisville vs. SMU
(375, '2024-10-05', 275 , 2509 ),  -- Wisconsin vs. Purdue
(376, '2024-10-05', 2032 , 6 ),  -- Arkansas State vs. South Alabama
(377, '2024-10-05', 25 , 2390 ),  -- California vs. Miami
(378, '2024-10-05', 5 , 2655 ),  -- UAB vs. Tulane
(379, '2024-10-05', 77 , 84 ),  -- Northwestern vs. Indiana
(380, '2024-10-05', 204 , 36 ),  -- Oregon State vs. Colorado State
(381, '2024-10-05', 2006 , 189 ),  -- Akron vs. Bowling Green
(382, '2024-10-05', 2579 , 145 ),  -- South Carolina vs. Ole Miss
(383, '2024-10-05', 61 , 2 ),  -- Georgia vs. Auburn
(384, '2024-10-05', 245 , 142 ),  -- Texas A&M vs. Missouri
(385, '2024-10-05', 152 , 154 ),  -- NC State vs. Wake Forest
(386, '2024-10-05', 2429 , 151 ),  -- Charlotte vs. East Carolina
(387, '2024-10-05', 238 , 333 ),  -- Vanderbilt vs. Alabama
(388, '2024-10-05', 41 , 218 ),  -- Connecticut vs. Temple
(389, '2024-10-05', 12 , 2641 ),  -- Arizona vs. Texas Tech
(390, '2024-10-05', 2005 , 2426 ),  -- Air Force vs. Navy
(391, '2024-10-05', 2483 , 127 ),  -- Oregon vs. Michigan State
(392, '2024-10-05', 2433 , 256 ),  -- Louisiana Monroe vs. James Madison
(393, '2024-10-05', 8 , 2633 ),  -- Arkansas vs. Tennessee
(394, '2024-10-05', 258 , 103 ),  -- Virginia vs. Boston College
(395, '2024-10-05', 68 , 328 ),  -- Boise State vs. Utah State
(396, '2024-10-05', 9 , 2305 ),  -- Arizona State vs. Kansas
(397, '2024-10-05', 2572 , 309 ),  -- Southern Mississippi vs. Louisiana
(398, '2024-10-05', 202 , 349 ),  -- Tulsa vs. Army
(399, '2024-10-05', 153 , 221 ),  -- North Carolina vs. Pittsburgh
(400, '2024-10-05', 52 , 228 ),  -- Florida State vs. Clemson
(401, '2024-10-05', 57 , 2116 ),  -- Florida vs. UCF
(402, '2024-10-05', 2439 , 183 ),  -- UNLV vs. Syracuse
(403, '2024-10-05', 23 , 2440 ),  -- San Jos├⌐ State vs. Nevada
(404, '2024-10-05', 213 , 26 ),  -- Penn State vs. UCLA
(405, '2024-10-05', 21 , 62 ),  -- San Diego State vs. Hawai'i
(406, '2024-10-05', 135 , 30 ),  -- Minnesota vs. USC
(407, '2024-10-05', 2050 , 2711 ),  -- Ball State vs. Western Michigan
(408, '2024-10-05', 66 , 239 ),  -- Iowa State vs. Baylor
(409, '2024-10-05', 194 , 2294 ),  -- Ohio State vs. Iowa
(410, '2024-10-05', 59 , 150 ),  -- Georgia Tech vs. Duke
(411, '2024-10-09', 55 , 166 ),  -- Jacksonville State vs. New Mexico State
(412, '2024-10-09', 2335 , 2229 ),  -- Liberty vs. Florida International
(413, '2024-10-10', 98 , 2638 ),  -- Western Kentucky vs. UTEP
(414, '2024-10-10', 256 , 324 ),  -- James Madison vs. Coastal Carolina
(415, '2024-10-10', 2348 , 2393 ),  -- Louisiana Tech vs. Middle Tennessee
(416, '2024-10-11', 9 , 254 ),  -- Arizona State vs. Utah
(417, '2024-10-11', 58 , 235 ),  -- South Florida vs. Memphis
(418, '2024-10-12', 62 , 68 ),  -- Hawai'i vs. Boise State
(419, '2024-10-12', 2309 , 2050 ),  -- Kent State vs. Ball State
(420, '2024-10-12', 189 , 2459 ),  -- Bowling Green vs. Northern Illinois
(421, '2024-10-12', 154 , 228 ),  -- Wake Forest vs. Clemson
(422, '2024-10-12', 153 , 59 ),  -- North Carolina vs. Georgia Tech
(423, '2024-10-12', 38 , 2306 ),  -- Colorado vs. Kansas State
(424, '2024-10-12', 201 , 251 ),  -- Oklahoma vs. Texas
(425, '2024-10-12', 277 , 66 ),  -- West Virginia vs. Iowa State
(426, '2024-10-12', 113 , 142 ),  -- UMass vs. Missouri
(427, '2024-10-12', 152 , 183 ),  -- NC State vs. Syracuse
(428, '2024-10-12', 2084 , 2649 ),  -- Buffalo vs. Toledo
(429, '2024-10-12', 167 , 2005 ),  -- New Mexico vs. Air Force
(430, '2024-10-12', 2751 , 21 ),  -- Wyoming vs. San Diego State
(431, '2024-10-12', 328 , 2439 ),  -- Utah State vs. UNLV
(432, '2024-10-12', 36 , 23 ),  -- Colorado State vs. San Jos├⌐ State
(433, '2024-10-12', 258 , 97 ),  -- Virginia vs. Louisville
(434, '2024-10-12', 2483 , 194 ),  -- Oregon vs. Ohio State
(435, '2024-10-12', 30 , 213 ),  -- USC vs. Penn State
(436, '2024-10-12', 164 , 275 ),  -- Rutgers vs. Wisconsin
(437, '2024-10-12', 26 , 135 ),  -- UCLA vs. Minnesota
(438, '2024-10-12', 120 , 77 ),  -- Maryland vs. Northwestern
(439, '2024-10-12', 356 , 2509 ),  -- Illinois vs. Purdue
(440, '2024-10-12', 333 , 2579 ),  -- Alabama vs. South Carolina
(441, '2024-10-12', 242 , 2636 ),  -- Rice vs. UT San Antonio
(442, '2024-10-12', 252 , 12 ),  -- BYU vs. Arizona
(443, '2024-10-12', 87 , 24 ),  -- Notre Dame vs. Stanford
(444, '2024-10-12', 221 , 25 ),  -- Pittsburgh vs. California
(445, '2024-10-12', 2440 , 204 ),  -- Nevada vs. Oregon State
(446, '2024-10-12', 2294 , 264 ),  -- Iowa vs. Washington
(447, '2024-10-12', 278 , 265 ),  -- Fresno State vs. Washington State
(448, '2024-10-12', 290 , 276 ),  -- Georgia Southern vs. Marshall
(449, '2024-10-12', 2247 , 295 ),  -- Georgia State vs. Old Dominion
(450, '2024-10-12', 309 , 2026 ),  -- Louisiana vs. Appalachian State
(451, '2024-10-12', 326 , 2032 ),  -- Texas State vs. Arkansas State
(452, '2024-10-12', 2433 , 2572 ),  -- Louisiana Monroe vs. Southern Mississippi
(453, '2024-10-12', 2633 , 57 ),  -- Tennessee vs. Florida
(454, '2024-10-12', 2116 , 2132 ),  -- UCF vs. Cincinnati
(455, '2024-10-12', 349 , 5 ),  -- Army vs. UAB
(456, '2024-10-12', 96 , 238 ),  -- Kentucky vs. Vanderbilt
(457, '2024-10-12', 99 , 145 ),  -- LSU vs. Ole Miss
(458, '2024-10-12', 61 , 344 ),  -- Georgia vs. Mississippi State
(459, '2024-10-12', 2199 , 193 ),  -- Eastern Michigan vs. Miami (OH)
(460, '2024-10-12', 2117 , 195 ),  -- Central Michigan vs. Ohio
(461, '2024-10-12', 2226 , 249 ),  -- Florida Atlantic vs. North Texas
(462, '2024-10-12', 2711 , 2006 ),  -- Western Michigan vs. Akron
(463, '2024-10-15', 166 , 2348 ),  -- New Mexico State vs. Louisiana Tech
(464, '2024-10-15', 2393 , 338 ),  -- Middle Tennessee vs. Kennesaw State
(465, '2024-10-15', 6 , 2653 ),  -- South Alabama vs. Troy
(466, '2024-10-16', 2534 , 98 ),  -- Sam Houston State vs. Western Kentucky
(467, '2024-10-16', 2638 , 2229 ),  -- UTEP vs. Florida International
(468, '2024-10-17', 276 , 2247 ),  -- Marshall vs. Georgia State
(469, '2024-10-17', 259 , 103 ),  -- Virginia Tech vs. Boston College
(470, '2024-10-18', 252 , 197 ),  -- BYU vs. Oklahoma State
(471, '2024-10-18', 150 , 52 ),  -- Duke vs. Florida State
(472, '2024-10-19', 12 , 38 ),  -- Arizona vs. Colorado
(473, '2024-10-19', 25 , 152 ),  -- California vs. NC State
(474, '2024-10-19', 41 , 154 ),  -- Connecticut vs. Wake Forest
(475, '2024-10-19', 344 , 245 ),  -- Mississippi State vs. Texas A&M
(476, '2024-10-19', 120 , 30 ),  -- Maryland vs. USC
(477, '2024-10-19', 97 , 2390 ),  -- Louisville vs. Miami
(478, '2024-10-19', 251 , 61 ),  -- Texas vs. Georgia
(479, '2024-10-19', 164 , 26 ),  -- Rutgers vs. UCLA
(480, '2024-10-19', 328 , 167 ),  -- Utah State vs. New Mexico
(481, '2024-10-19', 59 , 87 ),  -- Georgia Tech vs. Notre Dame
(482, '2024-10-19', 2572 , 2032 ),  -- Southern Mississippi vs. Arkansas State
(483, '2024-10-19', 265 , 62 ),  -- Washington State vs. Hawai'i
(484, '2024-10-19', 228 , 258 ),  -- Clemson vs. Virginia
(485, '2024-10-19', 142 , 2 ),  -- Missouri vs. Auburn
(486, '2024-10-19', 254 , 2628 ),  -- Utah vs. TCU
(487, '2024-10-19', 2084 , 2711 ),  -- Buffalo vs. Western Michigan
(488, '2024-10-19', 24 , 2567 ),  -- Stanford vs. SMU
(489, '2024-10-19', 295 , 326 ),  -- Old Dominion vs. Texas State
(490, '2024-10-19', 238 , 2050 ),  -- Vanderbilt vs. Ball State
(491, '2024-10-19', 23 , 2751 ),  -- San Jos├⌐ State vs. Wyoming
(492, '2024-10-19', 2199 , 2117 ),  -- Eastern Michigan vs. Central Michigan
(493, '2024-10-19', 2005 , 36 ),  -- Air Force vs. Colorado State
(494, '2024-10-19', 290 , 256 ),  -- Georgia Southern vs. James Madison
(495, '2024-10-19', 77 , 275 ),  -- Northwestern vs. Wisconsin
(496, '2024-10-19', 2459 , 2649 ),  -- Northern Illinois vs. Toledo
(497, '2024-10-19', 324 , 309 ),  -- Coastal Carolina vs. Louisiana
(498, '2024-10-19', 2509 , 2483 ),  -- Purdue vs. Oregon
(499, '2024-10-19', 2440 , 278 ),  -- Nevada vs. Fresno State
(500, '2024-10-19', 218 , 202 ),  -- Temple vs. Tulsa
(501, '2024-10-19', 127 , 2294 ),  -- Michigan State vs. Iowa
(502, '2024-10-19', 235 , 249 ),  -- Memphis vs. North Texas
(503, '2024-10-19', 2426 , 2429 ),  -- Navy vs. Charlotte
(504, '2024-10-19', 349 , 151 ),  -- Army vs. East Carolina
(505, '2024-10-19', 8 , 99 ),  -- Arkansas vs. LSU
(506, '2024-10-19', 2305 , 248 ),  -- Kansas vs. Houston
(507, '2024-10-19', 2636 , 2226 ),  -- UT San Antonio vs. Florida Atlantic
(508, '2024-10-19', 2132 , 9 ),  -- Cincinnati vs. Arizona State
(509, '2024-10-19', 66 , 2116 ),  -- Iowa State vs. UCF
(510, '2024-10-19', 58 , 5 ),  -- South Florida vs. UAB
(511, '2024-10-19', 356 , 130 ),  -- Illinois vs. Michigan
(512, '2024-10-19', 193 , 195 ),  -- Miami (OH) vs. Ohio
(513, '2024-10-19', 2655 , 242 ),  -- Tulane vs. Rice
(514, '2024-10-19', 189 , 2309 ),  -- Bowling Green vs. Kent State
(515, '2024-10-19', 57 , 96 ),  -- Florida vs. Kentucky
(516, '2024-10-19', 204 , 2439 ),  -- Oregon State vs. UNLV
(517, '2024-10-19', 84 , 158 ),  -- Indiana vs. Nebraska
(518, '2024-10-19', 2633 , 333 ),  -- Tennessee vs. Alabama
(519, '2024-10-19', 2641 , 239 ),  -- Texas Tech vs. Baylor
(520, '2024-10-19', 201 , 2579 ),  -- Oklahoma vs. South Carolina
(521, '2024-10-19', 277 , 2306 ),  -- West Virginia vs. Kansas State
(522, '2024-10-22', 2229 , 2534 ),  -- Florida International vs. Sam Houston State
(523, '2024-10-22', 2348 , 2638 ),  -- Louisiana Tech vs. UTEP
(524, '2024-10-23', 55 , 2393 ),  -- Jacksonville State vs. Middle Tennessee
(525, '2024-10-23', 338 , 2335 ),  -- Kennesaw State vs. Liberty
(526, '2024-10-24', 221 , 183 ),  -- Pittsburgh vs. Syracuse
(527, '2024-10-24', 295 , 290 ),  -- Old Dominion vs. Georgia Southern
(528, '2024-10-25', 103 , 97 ),  -- Boston College vs. Louisville
(529, '2024-10-26', 278 , 23 ),  -- Fresno State vs. San Jos├⌐ State
(530, '2024-10-26', 6 , 2433 ),  -- South Alabama vs. Louisiana Monroe
(531, '2024-10-26', 2026 , 2247 ),  -- Appalachian State vs. Georgia State
(532, '2024-10-26', 2439 , 68 ),  -- UNLV vs. Boise State
(533, '2024-10-26', 2751 , 328 ),  -- Wyoming vs. Utah State
(534, '2024-10-26', 202 , 2636 ),  -- Tulsa vs. UT San Antonio
(535, '2024-10-26', 194 , 158 ),  -- Ohio State vs. Nebraska
(536, '2024-10-26', 151 , 218 ),  -- East Carolina vs. Temple
(537, '2024-10-26', 245 , 99 ),  -- Texas A&M vs. LSU
(538, '2024-10-26', 2006 , 2199 ),  -- Akron vs. Eastern Michigan
(539, '2024-10-26', 2294 , 77 ),  -- Iowa vs. Northwestern
(540, '2024-10-26', 96 , 2 ),  -- Kentucky vs. Auburn
(541, '2024-10-26', 344 , 8 ),  -- Mississippi State vs. Arkansas
(542, '2024-10-26', 150 , 2567 ),  -- Duke vs. SMU
(543, '2024-10-26', 249 , 2655 ),  -- North Texas vs. Tulane
(544, '2024-10-26', 193 , 2117 ),  -- Miami (OH) vs. Central Michigan
(545, '2024-10-26', 2050 , 2459 ),  -- Ball State vs. Northern Illinois
(546, '2024-10-26', 275 , 213 ),  -- Wisconsin vs. Penn State
(547, '2024-10-26', 195 , 2084 ),  -- Ohio vs. Buffalo
(548, '2024-10-26', 30 , 164 ),  -- USC vs. Rutgers
(549, '2024-10-26', 235 , 2429 ),  -- Memphis vs. Charlotte
(550, '2024-10-26', 135 , 120 ),  -- Minnesota vs. Maryland
(551, '2024-10-26', 130 , 127 ),  -- Michigan vs. Michigan State
(552, '2024-10-26', 2390 , 52 ),  -- Miami vs. Florida State
(553, '2024-10-26', 113 , 2681 ),  -- UMass vs. Wagner
(554, '2024-10-26', 24 , 154 ),  -- Stanford vs. Wake Forest
(555, '2024-10-26', 2426 , 87 ),  -- Navy vs. Notre Dame
(556, '2024-10-26', 259 , 59 ),  -- Virginia Tech vs. Georgia Tech
(557, '2024-10-26', 258 , 153 ),  -- Virginia vs. North Carolina
(558, '2024-10-26', 62 , 2440 ),  -- Hawai'i vs. Nevada
(559, '2024-10-26', 25 , 204 ),  -- California vs. Oregon State
(560, '2024-10-26', 2483 , 356 ),  -- Oregon vs. Illinois
(561, '2024-10-26', 2649 , 189 ),  -- Toledo vs. Bowling Green
(562, '2024-10-26', 248 , 254 ),  -- Houston vs. Utah
(563, '2024-10-26', 38 , 2132 ),  -- Colorado vs. Cincinnati
(564, '2024-10-26', 239 , 197 ),  -- Baylor vs. Oklahoma State
(565, '2024-10-26', 2116 , 252 ),  -- UCF vs. BYU
(566, '2024-10-26', 84 , 264 ),  -- Indiana vs. Washington
(567, '2024-10-26', 21 , 265 ),  -- San Diego State vs. Washington State
(568, '2024-10-26', 41 , 242 ),  -- Connecticut vs. Rice
(569, '2024-10-26', 145 , 201 ),  -- Ole Miss vs. Oklahoma
(570, '2024-10-26', 238 , 251 ),  -- Vanderbilt vs. Texas
(571, '2024-10-26', 2628 , 2641 ),  -- TCU vs. Texas Tech
(572, '2024-10-26', 2306 , 2305 ),  -- Kansas State vs. Kansas
(573, '2024-10-26', 36 , 167 ),  -- Colorado State vs. New Mexico
(574, '2024-10-26', 12 , 277 ),  -- Arizona vs. West Virginia
(575, '2024-10-26', 333 , 142 ),  -- Alabama vs. Missouri
(576, '2024-10-26', 2032 , 2653 ),  -- Arkansas State vs. Troy
(577, '2024-10-26', 256 , 2572 ),  -- James Madison vs. Southern Mississippi
(578, '2024-10-26', 2711 , 2309 ),  -- Western Michigan vs. Kent State
(579, '2024-10-29', 2534 , 2348 ),  -- Sam Houston State vs. Louisiana Tech
(580, '2024-10-29', 326 , 309 ),  -- Texas State vs. Louisiana
(581, '2024-10-29', 2229 , 166 ),  -- Florida International vs. New Mexico State
(582, '2024-10-30', 2335 , 55 ),  -- Liberty vs. Jacksonville State
(583, '2024-10-30', 98 , 338 ),  -- Western Kentucky vs. Kennesaw State
(584, '2024-10-31', 2429 , 2655 ),  -- Charlotte vs. Tulane
(585, '2024-11-01', 2226 , 58 ),  -- Florida Atlantic vs. South Florida
(586, '2024-11-02', 68 , 21 ),  -- Boise State vs. San Diego State
(587, '2024-11-02', 2026 , 295 ),  -- Appalachian State vs. Old Dominion
(588, '2024-11-02', 5 , 202 ),  -- UAB vs. Tulsa
(589, '2024-11-02', 248 , 2306 ),  -- Houston vs. Kansas State
(590, '2024-11-02', 2199 , 2649 ),  -- Eastern Michigan vs. Toledo
(591, '2024-11-02', 2006 , 2084 ),  -- Akron vs. Buffalo
(592, '2024-11-02', 8 , 145 ),  -- Arkansas vs. Ole Miss
(593, '2024-11-02', 167 , 2751 ),  -- New Mexico vs. Wyoming
(594, '2024-11-02', 127 , 84 ),  -- Michigan State vs. Indiana
(595, '2024-11-02', 130 , 2483 ),  -- Michigan vs. Oregon
(596, '2024-11-02', 2440 , 36 ),  -- Nevada vs. Colorado State
(597, '2024-11-02', 349 , 2005 ),  -- Army vs. Air Force
(598, '2024-11-02', 201 , 311 ),  -- Oklahoma vs. Maine
(599, '2024-11-02', 2653 , 324 ),  -- Troy vs. Coastal Carolina
(600, '2024-11-02', 239 , 2628 ),  -- Baylor vs. TCU
(601, '2024-11-02', 2636 , 235 ),  -- UT San Antonio vs. Memphis
(602, '2024-11-02', 2633 , 96 ),  -- Tennessee vs. Kentucky
(603, '2024-11-02', 344 , 113 ),  -- Mississippi State vs. UMass
(604, '2024-11-02', 2638 , 2393 ),  -- UTEP vs. Middle Tennessee
(605, '2024-11-02', 2 , 238 ),  -- Auburn vs. Vanderbilt
(606, '2024-11-02', 41 , 2247 ),  -- Connecticut vs. Georgia State
(607, '2024-11-02', 264 , 30 ),  -- Washington vs. USC
(608, '2024-11-02', 228 , 97 ),  -- Clemson vs. Louisville
(609, '2024-11-02', 6 , 290 ),  -- South Alabama vs. Georgia Southern
(610, '2024-11-02', 183 , 259 ),  -- Syracuse vs. Virginia Tech
(611, '2024-11-02', 2579 , 245 ),  -- South Carolina vs. Texas A&M
(612, '2024-11-02', 2116 , 12 ),  -- UCF vs. Arizona
(613, '2024-11-02', 197 , 9 ),  -- Oklahoma State vs. Arizona State
(614, '2024-11-02', 213 , 194 ),  -- Penn State vs. Ohio State
(615, '2024-11-02', 2567 , 221 ),  -- SMU vs. Pittsburgh
(616, '2024-11-02', 66 , 2641 ),  -- Iowa State vs. Texas Tech
(617, '2024-11-02', 2294 , 275 ),  -- Iowa vs. Wisconsin
(618, '2024-11-02', 276 , 2433 ),  -- Marshall vs. Louisiana Monroe
(619, '2024-11-02', 356 , 135 ),  -- Illinois vs. Minnesota
(620, '2024-11-02', 2509 , 77 ),  -- Purdue vs. Northwestern
(621, '2024-11-02', 242 , 2426 ),  -- Rice vs. Navy
(622, '2024-11-02', 278 , 62 ),  -- Fresno State vs. Hawai'i
(623, '2024-11-02', 52 , 153 ),  -- Florida State vs. North Carolina
(624, '2024-11-02', 158 , 26 ),  -- Nebraska vs. UCLA
(625, '2024-11-02', 152 , 24 ),  -- NC State vs. Stanford
(626, '2024-11-02', 2390 , 150 ),  -- Miami vs. Duke
(627, '2024-11-02', 61 , 57 ),  -- Georgia vs. Florida
(628, '2024-11-05', 2117 , 189 ),  -- Central Michigan vs. Bowling Green
(629, '2024-11-05', 2050 , 193 ),  -- Ball State vs. Miami (OH)
(630, '2024-11-06', 2711 , 2459 ),  -- Western Michigan vs. Northern Illinois
(631, '2024-11-06', 2309 , 195 ),  -- Kent State vs. Ohio
(632, '2024-11-07', 151 , 2226 ),  -- East Carolina vs. Florida Atlantic
(633, '2024-11-07', 324 , 2026 ),  -- Coastal Carolina vs. Appalachian State
(634, '2024-11-08', 235 , 242 ),  -- Memphis vs. Rice
(635, '2024-11-08', 154 , 25 ),  -- Wake Forest vs. California
(636, '2024-11-09', 68 , 2440 ),  -- Boise State vs. Nevada
(637, '2024-11-09', 26 , 2294 ),  -- UCLA vs. Iowa
(638, '2024-11-09', 2655 , 218 ),  -- Tulane vs. Temple
(639, '2024-11-09', 164 , 135 ),  -- Rutgers vs. Minnesota
(640, '2024-11-09', 58 , 2426 ),  -- South Florida vs. Navy
(641, '2024-11-09', 166 , 98 ),  -- New Mexico State vs. Western Kentucky
(642, '2024-11-09', 84 , 130 ),  -- Indiana vs. Michigan
(643, '2024-11-09', 2483 , 120 ),  -- Oregon vs. Maryland
(644, '2024-11-09', 204 , 23 ),  -- Oregon State vs. San Jos├⌐ State
(645, '2024-11-09', 2641 , 38 ),  -- Texas Tech vs. Colorado
(646, '2024-11-09', 62 , 2439 ),  -- Hawai'i vs. UNLV
(647, '2024-11-09', 213 , 264 ),  -- Penn State vs. Washington
(648, '2024-11-09', 2005 , 278 ),  -- Air Force vs. Fresno State
(649, '2024-11-09', 2572 , 276 ),  -- Southern Mississippi vs. Marshall
(650, '2024-11-09', 21 , 167 ),  -- San Diego State vs. New Mexico
(651, '2024-11-09', 2393 , 2335 ),  -- Middle Tennessee vs. Liberty
(652, '2024-11-09', 256 , 2247 ),  -- James Madison vs. Georgia State
(653, '2024-11-09', 265 , 328 ),  -- Washington State vs. Utah State
(654, '2024-11-09', 2433 , 326 ),  -- Louisiana Monroe vs. Texas State
(655, '2024-11-09', 309 , 2032 ),  -- Louisiana vs. Arkansas State
(656, '2024-11-09', 103 , 183 ),  -- Boston College vs. Syracuse
(657, '2024-11-09', 2132 , 277 ),  -- Cincinnati vs. West Virginia
(658, '2024-11-09', 238 , 2579 ),  -- Vanderbilt vs. South Carolina
(659, '2024-11-09', 251 , 57 ),  -- Texas vs. Florida
(660, '2024-11-09', 5 , 41 ),  -- UAB vs. Connecticut
(661, '2024-11-09', 2305 , 66 ),  -- Kansas vs. Iowa State
(662, '2024-11-09', 142 , 201 ),  -- Missouri vs. Oklahoma
(663, '2024-11-09', 145 , 61 ),  -- Ole Miss vs. Georgia
(664, '2024-11-09', 254 , 252 ),  -- Utah vs. BYU
(665, '2024-11-09', 2628 , 197 ),  -- TCU vs. Oklahoma State
(666, '2024-11-09', 9 , 2116 ),  -- Arizona State vs. UCF
(667, '2024-11-09', 113 , 349 ),  -- UMass vs. Army
(668, '2024-11-09', 152 , 150 ),  -- NC State vs. Duke
(669, '2024-11-09', 221 , 258 ),  -- Pittsburgh vs. Virginia
(670, '2024-11-09', 59 , 2390 ),  -- Georgia Tech vs. Miami
(671, '2024-11-09', 259 , 228 ),  -- Virginia Tech vs. Clemson
(672, '2024-11-09', 87 , 52 ),  -- Notre Dame vs. Florida State
(673, '2024-11-09', 99 , 333 ),  -- LSU vs. Alabama
(674, '2024-11-09', 2633 , 344 ),  -- Tennessee vs. Mississippi State
(675, '2024-11-09', 2638 , 338 ),  -- UTEP vs. Kennesaw State
(676, '2024-11-09', 2348 , 55 ),  -- Louisiana Tech vs. Jacksonville State
(677, '2024-11-09', 194 , 2509 ),  -- Ohio State vs. Purdue
(678, '2024-11-12', 2084 , 2050 ),  -- Buffalo vs. Ball State
(679, '2024-11-12', 2649 , 2117 ),  -- Toledo vs. Central Michigan
(680, '2024-11-12', 189 , 2711 ),  -- Bowling Green vs. Western Michigan
(681, '2024-11-13', 2459 , 2006 ),  -- Northern Illinois vs. Akron
(682, '2024-11-13', 193 , 2309 ),  -- Miami (OH) vs. Kent State
(683, '2024-11-13', 195 , 2199 ),  -- Ohio vs. Eastern Michigan
(684, '2024-11-14', 202 , 151 ),  -- Tulsa vs. East Carolina
(685, '2024-11-15', 2636 , 249 ),  -- UT San Antonio vs. North Texas
(686, '2024-11-15', 12 , 248 ),  -- Arizona vs. Houston
(687, '2024-11-16', 77 , 194 ),  -- Northwestern vs. Ohio State
(688, '2024-11-16', 235 , 5 ),  -- Memphis vs. UAB
(689, '2024-11-16', 57 , 99 ),  -- Florida vs. LSU
(690, '2024-11-16', 333 , 2382 ),  -- Alabama vs. Mercer
(691, '2024-11-16', 221 , 228 ),  -- Pittsburgh vs. Clemson
(692, '2024-11-16', 87 , 258 ),  -- Notre Dame vs. Virginia
(693, '2024-11-16', 264 , 26 ),  -- Washington vs. UCLA
(694, '2024-11-16', 2306 , 9 ),  -- Kansas State vs. Arizona State
(695, '2024-11-16', 30 , 158 ),  -- USC vs. Nebraska
(696, '2024-11-16', 328 , 62 ),  -- Utah State vs. Hawai'i
(697, '2024-11-16', 276 , 324 ),  -- Marshall vs. Coastal Carolina
(698, '2024-11-16', 153 , 154 ),  -- North Carolina vs. Wake Forest
(699, '2024-11-16', 2 , 2433 ),  -- Auburn vs. Louisiana Monroe
(700, '2024-11-16', 24 , 97 ),  -- Stanford vs. Louisville
(701, '2024-11-16', 25 , 183 ),  -- California vs. Syracuse
(702, '2024-11-16', 295 , 256 ),  -- Old Dominion vs. James Madison
(703, '2024-11-16', 113 , 2335 ),  -- UMass vs. Liberty
(704, '2024-11-16', 61 , 2633 ),  -- Georgia vs. Tennessee
(705, '2024-11-16', 66 , 2132 ),  -- Iowa State vs. Cincinnati
(706, '2024-11-16', 356 , 127 ),  -- Illinois vs. Michigan State
(707, '2024-11-16', 23 , 68 ),  -- San Jos├⌐ State vs. Boise State
(708, '2024-11-16', 218 , 2226 ),  -- Temple vs. Florida Atlantic
(709, '2024-11-16', 2005 , 204 ),  -- Air Force vs. Oregon State
(710, '2024-11-16', 2567 , 103 ),  -- SMU vs. Boston College
(711, '2024-11-16', 252 , 2305 ),  -- BYU vs. Kansas
(712, '2024-11-16', 245 , 166 ),  -- Texas A&M vs. New Mexico State
(713, '2024-11-16', 2439 , 21 ),  -- UNLV vs. San Diego State
(714, '2024-11-16', 96 , 93 ),  -- Kentucky vs. Murray State
(715, '2024-11-16', 2579 , 142 ),  -- South Carolina vs. Missouri
(716, '2024-11-16', 309 , 6 ),  -- Louisiana vs. South Alabama
(717, '2024-11-16', 55 , 2229 ),  -- Jacksonville State vs. Florida International
(718, '2024-11-16', 98 , 2348 ),  -- Western Kentucky vs. Louisiana Tech
(719, '2024-11-16', 38 , 254 ),  -- Colorado vs. Utah
(720, '2024-11-16', 2429 , 58 ),  -- Charlotte vs. South Florida
(721, '2024-11-16', 2426 , 2655 ),  -- Navy vs. Tulane
(722, '2024-11-16', 8 , 251 ),  -- Arkansas vs. Texas
(723, '2024-11-16', 2509 , 213 ),  -- Purdue vs. Penn State
(724, '2024-11-16', 275 , 2483 ),  -- Wisconsin vs. Oregon
(725, '2024-11-16', 167 , 265 ),  -- New Mexico vs. Washington State
(726, '2024-11-16', 36 , 2751 ),  -- Colorado State vs. Wyoming
(727, '2024-11-16', 338 , 2534 ),  -- Kennesaw State vs. Sam Houston State
(728, '2024-11-16', 120 , 164 ),  -- Maryland vs. Rutgers
(729, '2024-11-16', 277 , 239 ),  -- West Virginia vs. Baylor
(730, '2024-11-16', 2247 , 2032 ),  -- Georgia State vs. Arkansas State
(731, '2024-11-16', 290 , 2653 ),  -- Georgia Southern vs. Troy
(732, '2024-11-16', 326 , 2572 ),  -- Texas State vs. Southern Mississippi
(733, '2024-11-19', 2309 , 2006 ),  -- Kent State vs. Akron
(734, '2024-11-19', 193 , 2459 ),  -- Miami (OH) vs. Northern Illinois
(735, '2024-11-19', 2117 , 2711 ),  -- Central Michigan vs. Western Michigan
(736, '2024-11-20', 2199 , 2084 ),  -- Eastern Michigan vs. Buffalo
(737, '2024-11-20', 2649 , 195 ),  -- Toledo vs. Ohio
(738, '2024-11-21', 59 , 152 ),  -- Georgia Tech vs. NC State
(739, '2024-11-22', 2636 , 218 ),  -- UT San Antonio vs. Temple
(740, '2024-11-23', 57 , 145 ),  -- Florida vs. Ole Miss
(741, '2024-11-23', 309 , 2653 ),  -- Louisiana vs. Troy
(742, '2024-11-23', 2 , 245 ),  -- Auburn vs. Texas A&M
(743, '2024-11-23', 344 , 142 ),  -- Mississippi State vs. Missouri
(744, '2024-11-23', 2393 , 166 ),  -- Middle Tennessee vs. New Mexico State
(745, '2024-11-23', 324 , 290 ),  -- Coastal Carolina vs. Georgia Southern
(746, '2024-11-23', 2440 , 2005 ),  -- Nevada vs. Air Force
(747, '2024-11-23', 127 , 2509 ),  -- Michigan State vs. Purdue
(748, '2024-11-23', 295 , 276 ),  -- Old Dominion vs. Marshall
(749, '2024-11-23', 55 , 2534 ),  -- Jacksonville State vs. Sam Houston State
(750, '2024-11-23', 183 , 41 ),  -- Syracuse vs. Connecticut
(751, '2024-11-23', 197 , 2641 ),  -- Oklahoma State vs. Texas Tech
(752, '2024-11-23', 2026 , 256 ),  -- Appalachian State vs. James Madison
(753, '2024-11-23', 254 , 66 ),  -- Utah vs. Iowa State
(754, '2024-11-23', 164 , 356 ),  -- Rutgers vs. Illinois
(755, '2024-11-23', 2579 , 2747 ),  -- South Carolina vs. Wofford
(756, '2024-11-23', 248 , 239 ),  -- Houston vs. Baylor
(757, '2024-11-23', 204 , 265 ),  -- Oregon State vs. Washington State
(758, '2024-11-23', 9 , 252 ),  -- Arizona State vs. BYU
(759, '2024-11-23', 328 , 21 ),  -- Utah State vs. San Diego State
(760, '2024-11-23', 2306 , 2132 ),  -- Kansas State vs. Cincinnati
(761, '2024-11-23', 2050 , 189 ),  -- Ball State vs. Bowling Green
(762, '2024-11-23', 2305 , 38 ),  -- Kansas vs. Colorado
(763, '2024-11-23', 87 , 349 ),  -- Notre Dame vs. Army
(764, '2024-11-23', 277 , 2116 ),  -- West Virginia vs. UCF
(765, '2024-11-23', 249 , 151 ),  -- North Texas vs. East Carolina
(766, '2024-11-23', 23 , 2439 ),  -- San Jos├⌐ State vs. UNLV
(767, '2024-11-23', 26 , 30 ),  -- UCLA vs. USC
(768, '2024-11-23', 130 , 77 ),  -- Michigan vs. Northwestern
(769, '2024-11-23', 103 , 153 ),  -- Boston College vs. North Carolina
(770, '2024-11-23', 52 , 2127 ),  -- Florida State vs. Charleston Southern
(771, '2024-11-23', 150 , 259 ),  -- Duke vs. Virginia Tech
(772, '2024-11-23', 25 , 24 ),  -- California vs. Stanford
(773, '2024-11-23', 2390 , 154 ),  -- Miami vs. Wake Forest
(774, '2024-11-23', 2628 , 12 ),  -- TCU vs. Arizona
(775, '2024-11-23', 228 , 2643 ),  -- Clemson vs. The Citadel
(776, '2024-11-23', 2633 , 2638 ),  -- Tennessee vs. UTEP
(777, '2024-11-23', 61 , 113 ),  -- Georgia vs. UMass
(778, '2024-11-23', 2226 , 2429 ),  -- Florida Atlantic vs. Charlotte
(779, '2024-11-23', 251 , 96 ),  -- Texas vs. Kentucky
(780, '2024-11-23', 8 , 2348 ),  -- Arkansas vs. Louisiana Tech
(781, '2024-11-23', 99 , 238 ),  -- LSU vs. Vanderbilt
(782, '2024-11-23', 338 , 2229 ),  -- Kennesaw State vs. Florida International
(783, '2024-11-23', 201 , 333 ),  -- Oklahoma vs. Alabama
(784, '2024-11-23', 135 , 213 ),  -- Minnesota vs. Penn State
(785, '2024-11-23', 5 , 242 ),  -- UAB vs. Rice
(786, '2024-11-23', 2335 , 98 ),  -- Liberty vs. Western Kentucky
(787, '2024-11-23', 194 , 84 ),  -- Ohio State vs. Indiana
(788, '2024-11-23', 258 , 2567 ),  -- Virginia vs. SMU
(789, '2024-11-23', 158 , 275 ),  -- Nebraska vs. Wisconsin
(790, '2024-11-23', 97 , 221 ),  -- Louisville vs. Pittsburgh
(791, '2024-11-23', 58 , 202 ),  -- South Florida vs. Tulsa
(792, '2024-11-23', 2751 , 68 ),  -- Wyoming vs. Boise State
(793, '2024-11-23', 120 , 2294 ),  -- Maryland vs. Iowa
(794, '2024-11-23', 2572 , 6 ),  -- Southern Mississippi vs. South Alabama
(795, '2024-11-23', 2032 , 2433 ),  -- Arkansas State vs. Louisiana Monroe
(796, '2024-11-23', 326 , 2247 ),  -- Texas State vs. Georgia State
(797, '2024-11-23', 278 , 36 ),  -- Fresno State vs. Colorado State
(798, '2024-11-26', 2006 , 2649 ),  -- Akron vs. Toledo
(799, '2024-11-26', 2084 , 2309 ),  -- Buffalo vs. Kent State
(800, '2024-11-28', 2655 , 235 ),  -- Tulane vs. Memphis
(801, '2024-11-29', 189 , 193 ),  -- Bowling Green vs. Miami (OH)
(802, '2024-11-29', 2116 , 254 ),  -- UCF vs. Utah
(803, '2024-11-29', 6 , 326 ),  -- South Alabama vs. Texas State
(804, '2024-11-29', 38 , 197 ),  -- Colorado vs. Oklahoma State
(805, '2024-11-29', 195 , 2050 ),  -- Ohio vs. Ball State
(806, '2024-11-29', 2294 , 158 ),  -- Iowa vs. Nebraska
(807, '2024-11-30', 84 , 2509 ),  -- Indiana vs. Purdue
(808, '2024-11-30', 2483 , 264 ),  -- Oregon vs. Washington
(809, '2024-11-30', 194 , 130 ),  -- Ohio State vs. Michigan
(810, '2024-11-30', 66 , 2306 ),  -- Iowa State vs. Kansas State
(811, '2024-11-30', 99 , 201 ),  -- LSU vs. Oklahoma
(812, '2024-11-30', 245 , 251 ),  -- Texas A&M vs. Texas
(813, '2024-11-30', 2641 , 277 ),  -- Texas Tech vs. West Virginia
(814, '2024-11-30', 349 , 2636 ),  -- Army vs. UT San Antonio
(815, '2024-11-30', 265 , 2751 ),  -- Washington State vs. Wyoming
(816, '2024-11-30', 26 , 278 ),  -- UCLA vs. Fresno State
(817, '2024-11-30', 145 , 344 ),  -- Ole Miss vs. Mississippi State
(818, '2024-11-30', 30 , 87 ),  -- USC vs. Notre Dame
(819, '2024-11-30', 77 , 356 ),  -- Northwestern vs. Illinois
(820, '2024-11-30', 142 , 8 ),  -- Missouri vs. Arkansas
(821, '2024-11-30', 62 , 167 ),  -- Hawai'i vs. New Mexico
(822, '2024-11-30', 2459 , 2117 ),  -- Northern Illinois vs. Central Michigan
(823, '2024-11-30', 2653 , 2572 ),  -- Troy vs. Southern Mississippi
(824, '2024-11-30', 151 , 2426 ),  -- East Carolina vs. Navy
(825, '2024-11-30', 333 , 2 ),  -- Alabama vs. Auburn
(826, '2024-11-30', 275 , 135 ),  -- Wisconsin vs. Minnesota
(827, '2024-11-30', 21 , 2005 ),  -- San Diego State vs. Air Force
(828, '2024-11-30', 113 , 41 ),  -- UMass vs. Connecticut
(829, '2024-11-30', 2711 , 2199 ),  -- Western Michigan vs. Eastern Michigan
(830, '2024-11-30', 2348 , 338 ),  -- Louisiana Tech vs. Kennesaw State
(831, '2024-11-30', 183 , 2390 ),  -- Syracuse vs. Miami
(832, '2024-11-30', 23 , 24 ),  -- San Jos├⌐ State vs. Stanford
(833, '2024-11-30', 218 , 249 ),  -- Temple vs. North Texas
(834, '2024-11-30', 239 , 2305 ),  -- Baylor vs. Kansas
(835, '2024-11-30', 2433 , 309 ),  -- Louisiana Monroe vs. Louisiana
(836, '2024-11-30', 36 , 328 ),  -- Colorado State vs. Utah State
(837, '2024-11-30', 96 , 97 ),  -- Kentucky vs. Louisville
(838, '2024-11-30', 61 , 59 ),  -- Georgia vs. Georgia Tech
(839, '2024-11-30', 153 , 152 ),  -- North Carolina vs. NC State
(840, '2024-11-30', 2567 , 25 ),  -- SMU vs. California
(841, '2024-11-30', 259 , 258 ),  -- Virginia Tech vs. Virginia
(842, '2024-11-30', 98 , 55 ),  -- Western Kentucky vs. Jacksonville State
(843, '2024-11-30', 2429 , 5 ),  -- Charlotte vs. UAB
(844, '2024-11-30', 2439 , 2440 ),  -- UNLV vs. Nevada
(845, '2024-11-30', 154 , 150 ),  -- Wake Forest vs. Duke
(846, '2024-11-30', 242 , 58 ),  -- Rice vs. South Florida
(847, '2024-11-30', 52 , 57 ),  -- Florida State vs. Florida
(848, '2024-11-30', 12 , 9 ),  -- Arizona vs. Arizona State
(849, '2024-11-30', 2132 , 2628 ),  -- Cincinnati vs. TCU
(850, '2024-11-30', 228 , 2579 ),  -- Clemson vs. South Carolina
(851, '2024-11-30', 252 , 248 ),  -- BYU vs. Houston
(852, '2024-11-30', 202 , 2226 ),  -- Tulsa vs. Florida Atlantic
(853, '2024-11-30', 68 , 204 ),  -- Boise State vs. Oregon State
(854, '2024-11-30', 103 , 221 ),  -- Boston College vs. Pittsburgh
(855, '2024-11-30', 290 , 2026 ),  -- Georgia Southern vs. Appalachian State
(856, '2024-11-30', 2534 , 2335 ),  -- Sam Houston State vs. Liberty
(857, '2024-11-30', 166 , 2638 ),  -- New Mexico State vs. UTEP
(858, '2024-11-30', 213 , 120 ),  -- Penn State vs. Maryland
(859, '2024-11-30', 2247 , 324 ),  -- Georgia State vs. Coastal Carolina
(860, '2024-11-30', 2229 , 2393 ),  -- Florida International vs. Middle Tennessee
(861, '2024-11-30', 2032 , 295 ),  -- Arkansas State vs. Old Dominion
(862, '2024-11-30', 127 , 164 ),  -- Michigan State vs. Rutgers
(863, '2024-11-30', 256 , 276 ),  -- James Madison vs. Marshall
(864, '2024-11-30', 238 , 2633 );  -- Vanderbilt vs. Tennessee

INSERT INTO `ODDS` (odds_id, home_win_odds, away_win_odds) VALUES
(1, 1.39, 2.43), 
(2, 1.83, 1.54), 
(3, 1.43, 1.99), 
(4, 1.31, 2.1), 
(5, 2.61, 2.14), 
(6, 1.61, 2.42), 
(7, 2.13, 2.81), 
(8, 2.62, 1.64), 
(9, 2.63, 1.54), 
(10, 2.21, 1.98), 
(11, 2.43, 2.06), 
(12, 1.9, 2.8), 
(13, 2.63, 1.66), 
(14, 1.16, 1.63), 
(15, 2.55, 1.96), 
(16, 1.85, 2.13), 
(17, 2.37, 2.83), 
(18, 1.35, 1.29), 
(19, 2.02, 1.21), 
(20, 1.35, 1.71), 
(21, 1.29, 1.54), 
(22, 2.8, 2.64), 
(23, 1.31, 2.01), 
(24, 2.64, 1.42), 
(25, 1.43, 1.02), 
(26, 2.06, 2.64), 
(27, 2.88, 2.96), 
(28, 2.57, 1.31), 
(29, 1.33, 2.89), 
(30, 2.57, 2.1), 
(31, 1.57, 1.84), 
(32, 1.34, 2.91), 
(33, 1.06, 1.45), 
(34, 2.98, 1.18), 
(35, 1.95, 2.82), 
(36, 2.58, 2.15), 
(37, 2.46, 2.86), 
(38, 2.35, 2.27), 
(39, 2.34, 1.47), 
(40, 1.9, 1.77), 
(41, 1.82, 1.82), 
(42, 2.33, 2.03), 
(43, 1.63, 1.71), 
(44, 2.33, 1.57), 
(45, 1.75, 1.79), 
(46, 1.64, 1.95), 
(47, 2, 2.2), 
(48, 2.34, 1.72), 
(49, 2.41, 1.44), 
(50, 2.21, 2.86), 
(51, 1.42, 1.67), 
(52, 1.89, 1.03), 
(53, 1.51, 2.12), 
(54, 2.81, 1.37), 
(55, 1.39, 2.52), 
(56, 2.49, 2.95), 
(57, 2.12, 1.67), 
(58, 2.19, 1.29), 
(59, 2.66, 1.5), 
(60, 2.16, 1.01), 
(61, 1.51, 2.76), 
(62, 1.5, 2.77), 
(63, 1.02, 2), 
(64, 1.85, 2.76), 
(65, 2.83, 1.3), 
(66, 1.05, 2.07), 
(67, 1.26, 1.92), 
(68, 1.61, 1.47), 
(69, 2.92, 2.55), 
(70, 1.75, 2.4), 
(71, 1.18, 2.24), 
(72, 2.14, 1.56), 
(73, 2.8, 1.52), 
(74, 1.12, 1.15), 
(75, 1.97, 2.68), 
(76, 1.52, 2.71), 
(77, 2.29, 2.14), 
(78, 1.83, 1.11), 
(79, 2.63, 1.76), 
(80, 1.44, 1.93), 
(81, 1.97, 1.4), 
(82, 1.63, 1), 
(83, 2.2, 1.07), 
(84, 1.29, 1.52), 
(85, 1.55, 1.93), 
(86, 1.35, 1.38), 
(87, 2.21, 2.7), 
(88, 2.61, 1.49), 
(89, 2.18, 2.45), 
(90, 2.36, 1.91), 
(91, 2.94, 2.13), 
(92, 2.78, 1.21), 
(93, 1.92, 2.06), 
(94, 1.94, 1.87), 
(95, 1.84, 1.62), 
(96, 2.1, 2.72), 
(97, 1.36, 2.29), 
(98, 2.26, 2.39), 
(99, 2.06, 2.02), 
(100, 1.41, 2.06), 
(101, 1.52, 1.98), 
(102, 2.25, 1.46), 
(103, 2.81, 1.39), 
(104, 1.59, 2.23), 
(105, 2.77, 2.38), 
(106, 1.5, 1.3), 
(107, 1.2, 1.85), 
(108, 2.52, 1.04), 
(109, 2, 2.75), 
(110, 1.64, 1.79), 
(111, 2.77, 1.81), 
(112, 2.16, 2.37), 
(113, 2.66, 2.17), 
(114, 2.26, 2.14), 
(115, 2.93, 2.92), 
(116, 1.48, 1.68), 
(117, 1.77, 2.31), 
(118, 2.05, 1.24), 
(119, 2.28, 1.85), 
(120, 2.14, 1.99), 
(121, 2.02, 2.1), 
(122, 1.29, 2.81), 
(123, 1.25, 2.87), 
(124, 2.73, 1.92), 
(125, 2.92, 2.6), 
(126, 2.45, 2.28), 
(127, 1.1, 2.46), 
(128, 1.82, 2.31), 
(129, 1.63, 2.2), 
(130, 2.92, 2.98), 
(131, 1.63, 1.33), 
(132, 2.4, 2.79), 
(133, 2.11, 2.13), 
(134, 2.89, 1.5), 
(135, 1.23, 1.13), 
(136, 1.67, 1.22), 
(137, 2.9, 1.89), 
(138, 2.53, 1.99), 
(139, 1.5, 1.52), 
(140, 1.25, 2.32), 
(141, 2.69, 1.94), 
(142, 1.49, 1.04), 
(143, 1.52, 1.08), 
(144, 1.15, 2.41), 
(145, 1.6, 2.67), 
(146, 1.65, 1.69), 
(147, 1.39, 2.65), 
(148, 1.38, 1.73), 
(149, 2.1, 1.16), 
(150, 2.45, 1.12), 
(151, 2.23, 1.22), 
(152, 2.04, 2.08), 
(153, 1.95, 2.74), 
(154, 2.48, 1.09), 
(155, 2.55, 1.15), 
(156, 1.41, 3), 
(157, 1.18, 2.3), 
(158, 1.1, 1.97), 
(159, 1.92, 2.87), 
(160, 1.65, 1.24), 
(161, 1.86, 1.93), 
(162, 1.29, 2.25), 
(163, 1.84, 1.03), 
(164, 2.87, 2), 
(165, 1.18, 1.18), 
(166, 1.68, 1.24), 
(167, 2.7, 1.1), 
(168, 1.93, 2.22), 
(169, 1.41, 2.36), 
(170, 2.29, 2.72), 
(171, 1.13, 1.14), 
(172, 2.94, 2.71), 
(173, 1.75, 2.63), 
(174, 2.07, 1.84), 
(175, 1.24, 2.79), 
(176, 2.17, 2.21), 
(177, 2.85, 2), 
(178, 2.28, 2.95), 
(179, 1.83, 1.08), 
(180, 1.38, 2.97), 
(181, 2.92, 2.33), 
(182, 2.29, 2.87), 
(183, 1.15, 1.5), 
(184, 2.79, 2.79), 
(185, 2.1, 2.2), 
(186, 2.66, 1.78), 
(187, 2.25, 2.8), 
(188, 2.42, 2.09), 
(189, 2.9, 1.74), 
(190, 1.61, 1.2), 
(191, 2.55, 1.9), 
(192, 2.8, 2.68), 
(193, 2.08, 2.22), 
(194, 2.34, 1.03), 
(195, 2.03, 1.09), 
(196, 2.11, 1.51), 
(197, 1.7, 1.21), 
(198, 1.11, 1.81), 
(199, 1.17, 1.59), 
(200, 1.78, 1.28), 
(201, 1.34, 1.36), 
(202, 2.61, 1.49), 
(203, 1.79, 1.96), 
(204, 2.43, 2.3), 
(205, 1.24, 2.89), 
(206, 2.77, 1.27), 
(207, 1.61, 2.44), 
(208, 2.79, 2.84), 
(209, 1.11, 2.91), 
(210, 2.44, 2.32), 
(211, 2.75, 1.38), 
(212, 2.21, 1.32), 
(213, 2.63, 2.35), 
(214, 2.38, 2.35), 
(215, 1.2, 2.98), 
(216, 1.4, 1.02), 
(217, 2.98, 1.23), 
(218, 1.87, 2.78), 
(219, 1.19, 1.47), 
(220, 2.17, 2.25), 
(221, 2.68, 1.74), 
(222, 1.09, 2.2), 
(223, 1.48, 2.54), 
(224, 1.18, 1.26), 
(225, 2.09, 1.44), 
(226, 1.96, 1.82), 
(227, 2.24, 1.52), 
(228, 2.65, 1.08), 
(229, 1.79, 2.58), 
(230, 2.03, 1.54), 
(231, 2.16, 2.65), 
(232, 1.32, 1.23), 
(233, 1.14, 1.04), 
(234, 2.79, 1.98), 
(235, 2.87, 1.32), 
(236, 2.24, 2.23), 
(237, 2.03, 1.49), 
(238, 2.21, 1.41), 
(239, 1.53, 2.97), 
(240, 2.25, 2.08), 
(241, 1.6, 2.39), 
(242, 2.94, 2.1), 
(243, 1.1, 1.9), 
(244, 2.1, 1.27), 
(245, 2.02, 1.96), 
(246, 1.81, 2.75), 
(247, 2.13, 1.43), 
(248, 2.69, 2.94), 
(249, 2.52, 2.47), 
(250, 2.23, 1.29), 
(251, 2.72, 2.29), 
(252, 1.57, 2.35), 
(253, 1.59, 2.26), 
(254, 1.29, 1.04), 
(255, 1.24, 2.86), 
(256, 2.94, 1.71), 
(257, 2.43, 1.21), 
(258, 1.36, 2.89), 
(259, 2.47, 2.91), 
(260, 1.36, 1.21), 
(261, 1.92, 2.83), 
(262, 2.1, 2.42), 
(263, 1.43, 2.22), 
(264, 1.71, 1.2), 
(265, 1.09, 2.32), 
(266, 1.64, 1.61), 
(267, 2.36, 1.64), 
(268, 1.65, 1.18), 
(269, 2.3, 2.84), 
(270, 2.25, 2.27), 
(271, 1.08, 1.75), 
(272, 2.36, 1.21), 
(273, 1.18, 2.91), 
(274, 1.14, 1.07), 
(275, 1.13, 2.77), 
(276, 1.97, 2.41), 
(277, 1.05, 2.78), 
(278, 1.17, 2.62), 
(279, 1.63, 2.76), 
(280, 2.11, 1.93), 
(281, 2.41, 1.43), 
(282, 1.49, 2.95), 
(283, 2.67, 1.68), 
(284, 1.82, 1.73), 
(285, 1.82, 1.18), 
(286, 2.26, 2.21), 
(287, 1.33, 2.67), 
(288, 1.26, 2.96), 
(289, 2.28, 1.37), 
(290, 1.69, 2.78), 
(291, 2.83, 1.17), 
(292, 2.13, 1.4), 
(293, 1.3, 2.27), 
(294, 1.35, 2.16), 
(295, 2.7, 2.82), 
(296, 2.05, 1.08), 
(297, 2.98, 1.29), 
(298, 1.56, 1.83), 
(299, 2.03, 2.68), 
(300, 2.43, 2.05), 
(301, 1.25, 2.27), 
(302, 2, 1.59), 
(303, 1.77, 1.41), 
(304, 1.72, 1.87), 
(305, 2.89, 2.96), 
(306, 1.8, 2.63), 
(307, 1.1, 1.83), 
(308, 1.4, 1.12), 
(309, 2.55, 2.01), 
(310, 2.64, 1.14), 
(311, 2.79, 1.21), 
(312, 2.11, 2.82), 
(313, 1.45, 2.3), 
(314, 1.12, 2.03), 
(315, 2.76, 1.9), 
(316, 2.04, 2), 
(317, 2.29, 1.86), 
(318, 2.39, 2.53), 
(319, 1.41, 1.59), 
(320, 1.18, 2.57), 
(321, 1.95, 2.23), 
(322, 2.87, 2.93), 
(323, 2.08, 2.93), 
(324, 2.72, 2.45), 
(325, 2.13, 1.42), 
(326, 2.02, 2.62), 
(327, 1.38, 2.85), 
(328, 1.85, 1.19), 
(329, 1.51, 2.64), 
(330, 2.95, 1.64), 
(331, 2.45, 2.57), 
(332, 1.08, 1.96), 
(333, 2.53, 1.77), 
(334, 1.04, 2.9), 
(335, 2.53, 2.88), 
(336, 2.27, 1.31), 
(337, 1.32, 2.37), 
(338, 2.83, 1.99), 
(339, 2.68, 1.46), 
(340, 1.8, 1.35), 
(341, 2.38, 2.98), 
(342, 2.47, 1.32), 
(343, 2.54, 2.42), 
(344, 2.13, 1.58), 
(345, 2.82, 1.94), 
(346, 2.5, 1.28), 
(347, 2.1, 2.82), 
(348, 1.96, 1.91), 
(349, 1.93, 2.57), 
(350, 2.09, 2.83), 
(351, 2.04, 1.88), 
(352, 1.46, 1.38), 
(353, 2.16, 1), 
(354, 2.72, 1.66), 
(355, 2.64, 1.64), 
(356, 2.96, 2.33), 
(357, 2.85, 2.3), 
(358, 2.59, 2.5), 
(359, 1.81, 1.82), 
(360, 2.6, 1.45), 
(361, 1.9, 2.13), 
(362, 2.78, 1.43), 
(363, 2.48, 2.46), 
(364, 2.56, 1.05), 
(365, 2.31, 1.54), 
(366, 1.85, 2.48), 
(367, 2.39, 1.3), 
(368, 1.16, 1.58), 
(369, 1.19, 2.53), 
(370, 2.07, 2.48), 
(371, 2.14, 1.36), 
(372, 2.33, 1.81), 
(373, 2.71, 2.67), 
(374, 1.93, 1.83), 
(375, 1.59, 1.16), 
(376, 2.05, 1.57), 
(377, 2.51, 1.05), 
(378, 1.29, 2.48), 
(379, 1.09, 1.95), 
(380, 1.61, 1.63), 
(381, 1.89, 2.45), 
(382, 2.41, 2.54), 
(383, 2.79, 2.11), 
(384, 1.35, 1.75), 
(385, 2.88, 2.8), 
(386, 2.63, 2.04), 
(387, 1.03, 1.47), 
(388, 2.58, 2.01), 
(389, 2.17, 2.49), 
(390, 2.42, 2.2), 
(391, 2.17, 2.59), 
(392, 1.03, 2.23), 
(393, 1.32, 2.19), 
(394, 1.04, 1.71), 
(395, 2.71, 2.77), 
(396, 2.51, 2.28), 
(397, 2.22, 2.03), 
(398, 1.08, 1.01), 
(399, 1.25, 2.62), 
(400, 2.22, 2.06), 
(401, 1.59, 2.23), 
(402, 1.18, 1.8), 
(403, 2.7, 2.98), 
(404, 2.77, 1.59), 
(405, 1.83, 1.05), 
(406, 1.87, 2.49), 
(407, 2.66, 2.36), 
(408, 2.63, 2.64), 
(409, 1.85, 1.5), 
(410, 1.49, 1.95), 
(411, 2.5, 2.3), 
(412, 2.68, 1.42), 
(413, 2.03, 1.56), 
(414, 1.35, 2.09), 
(415, 2.5, 2.9), 
(416, 2.35, 2.77), 
(417, 1.14, 1.68), 
(418, 2.13, 2.72), 
(419, 1.94, 1.16), 
(420, 1.98, 2.16), 
(421, 1.45, 2.83), 
(422, 1.45, 2.08), 
(423, 1.96, 2.38), 
(424, 2.6, 1.95), 
(425, 1.54, 1.5), 
(426, 1.78, 1.2), 
(427, 2.76, 2.64), 
(428, 2.83, 1.56), 
(429, 2.82, 1.17), 
(430, 1.26, 1.8), 
(431, 1.71, 1.23), 
(432, 2.37, 1.11), 
(433, 2.51, 1.38), 
(434, 1.04, 2.5), 
(435, 1.47, 1.05), 
(436, 1.97, 1.9), 
(437, 2.25, 1.83), 
(438, 2.94, 2.47), 
(439, 1.92, 2.17), 
(440, 1.67, 1.5), 
(441, 1.96, 1.49), 
(442, 2.29, 1.45), 
(443, 1.43, 2.15), 
(444, 2.02, 1.71), 
(445, 1.2, 2.12), 
(446, 2.6, 2.92), 
(447, 2.1, 1.49), 
(448, 1.25, 1.6), 
(449, 1.85, 2.11), 
(450, 1.5, 1.25), 
(451, 1.34, 1.37), 
(452, 2.42, 2.65), 
(453, 1.01, 1.48), 
(454, 1.83, 2.37), 
(455, 2.71, 2.93), 
(456, 1.65, 1.54), 
(457, 1.74, 1.35), 
(458, 1.87, 2.12), 
(459, 1.81, 1.6), 
(460, 2.28, 1.6), 
(461, 2.22, 2.65), 
(462, 1.12, 2.41), 
(463, 2.48, 1.41), 
(464, 1.16, 2.46), 
(465, 1.08, 2.89), 
(466, 2.97, 1.75), 
(467, 1.24, 1.95), 
(468, 2.76, 2.88), 
(469, 1.07, 2.86), 
(470, 1.42, 1.58), 
(471, 1.66, 2.39), 
(472, 2.92, 1.96), 
(473, 2.67, 2.02), 
(474, 1.62, 1.27), 
(475, 2.68, 1.28), 
(476, 2.39, 2.63), 
(477, 2.99, 1.48), 
(478, 2.18, 1.99), 
(479, 1.7, 1.87), 
(480, 1.97, 2.54), 
(481, 2.57, 1.87), 
(482, 1.66, 1.45), 
(483, 2.86, 1.76), 
(484, 2.64, 1.4), 
(485, 1.82, 1.8), 
(486, 2.31, 1.44), 
(487, 1.94, 2.27), 
(488, 1.01, 2.61), 
(489, 2.43, 2.28), 
(490, 1.63, 2.11), 
(491, 2.02, 1.57), 
(492, 2.38, 1.2), 
(493, 2.04, 1.8), 
(494, 2.75, 2.06), 
(495, 1, 2.13), 
(496, 2.18, 2.58), 
(497, 2.67, 2.23), 
(498, 2.49, 2.19), 
(499, 1.67, 2.86), 
(500, 1.51, 1.87), 
(501, 1.08, 1.56), 
(502, 1.02, 1.99), 
(503, 2.03, 1.39), 
(504, 1.75, 1.4), 
(505, 2.86, 1.4), 
(506, 2.34, 1.08), 
(507, 2.41, 1.37), 
(508, 2.72, 1.92), 
(509, 2.15, 1.67), 
(510, 1.62, 2.55), 
(511, 1.65, 1.9), 
(512, 2.57, 2.86), 
(513, 1.94, 2.56), 
(514, 2.38, 2), 
(515, 1.7, 1.62), 
(516, 1.87, 1.96), 
(517, 2.04, 2.04), 
(518, 1.39, 1.66), 
(519, 2.7, 1.42), 
(520, 2.51, 2.31), 
(521, 2.59, 2.99), 
(522, 2.36, 2.45), 
(523, 2.22, 1.58), 
(524, 2.34, 2.6), 
(525, 2.09, 1.74), 
(526, 2.12, 1.82), 
(527, 2.33, 2.63), 
(528, 2.24, 1.96), 
(529, 2.35, 2.94), 
(530, 1.56, 2.66), 
(531, 1.53, 2.61), 
(532, 1.42, 1.59), 
(533, 2.41, 1.16), 
(534, 2.46, 2.82), 
(535, 1.41, 2.53), 
(536, 2.84, 2.61), 
(537, 2.32, 1.38), 
(538, 1.05, 2.84), 
(539, 1.34, 2.16), 
(540, 1.24, 2.74), 
(541, 1.71, 1.14), 
(542, 1.38, 1.18), 
(543, 2.64, 2.93), 
(544, 1.43, 2.68), 
(545, 2.25, 1.74), 
(546, 2.7, 2.14), 
(547, 2.35, 2.79), 
(548, 2.55, 1.17), 
(549, 1.19, 1.53), 
(550, 1.93, 1.63), 
(551, 1.73, 1.66), 
(552, 2.79, 1.57), 
(553, 1.14, 2.18), 
(554, 2.99, 1.07), 
(555, 1.14, 2.55), 
(556, 1.02, 2.67), 
(557, 2.37, 1.97), 
(558, 2.44, 2.28), 
(559, 2.55, 1.13), 
(560, 2.77, 2.95), 
(561, 1.01, 2.82), 
(562, 1.88, 1.75), 
(563, 2.5, 2.09), 
(564, 2.69, 1.48), 
(565, 2.57, 1.98), 
(566, 1.76, 2.3), 
(567, 2.12, 1.02), 
(568, 1.94, 2.58), 
(569, 1.94, 1.54), 
(570, 1.17, 1.54), 
(571, 1.93, 1.66), 
(572, 1.62, 1.7), 
(573, 1.28, 3), 
(574, 3, 2.6), 
(575, 2.69, 2.57), 
(576, 1.18, 1.62), 
(577, 2.81, 2.02), 
(578, 1.2, 1.73), 
(579, 1.05, 2.8), 
(580, 1.72, 1.92), 
(581, 2.51, 1.67), 
(582, 2.58, 1.59), 
(583, 2.71, 2.13), 
(584, 2.35, 2.12), 
(585, 1.11, 1.64), 
(586, 2.28, 2.22), 
(587, 2.54, 2.92), 
(588, 2.8, 1.59), 
(589, 2.13, 2.48), 
(590, 2.4, 2.96), 
(591, 2.76, 1.8), 
(592, 1.34, 2.64), 
(593, 1.59, 1.7), 
(594, 2.3, 1.49), 
(595, 2.27, 2.41), 
(596, 1.95, 2.92), 
(597, 1.69, 2.9), 
(598, 1.42, 3), 
(599, 1.67, 1.11), 
(600, 1.55, 2.02), 
(601, 1.44, 1.82), 
(602, 2.97, 2.75), 
(603, 1.37, 1.75), 
(604, 2.97, 1.49), 
(605, 2.18, 2.94), 
(606, 1.15, 1.72), 
(607, 2.61, 2.03), 
(608, 1.26, 1.23), 
(609, 1.07, 1.64), 
(610, 1.51, 2.97), 
(611, 1.07, 1.07), 
(612, 1.88, 1.38), 
(613, 1.64, 2.7), 
(614, 2.61, 1.43), 
(615, 2.3, 2.89), 
(616, 1.06, 1.46), 
(617, 2.74, 2.07), 
(618, 2.2, 1.29), 
(619, 1.21, 2.77), 
(620, 2.34, 2.03), 
(621, 2.1, 1.75), 
(622, 2.29, 2.08), 
(623, 2.01, 2.07), 
(624, 1.31, 1.41), 
(625, 1.71, 1.94), 
(626, 1.31, 2.44), 
(627, 1.26, 1.66), 
(628, 2.73, 2.13), 
(629, 1.33, 2.72), 
(630, 2.11, 2.76), 
(631, 2.34, 2.77), 
(632, 2.81, 1.85), 
(633, 1.55, 2.27), 
(634, 2.36, 2.46), 
(635, 2.6, 2.43), 
(636, 2.7, 2.28), 
(637, 2.07, 1.9), 
(638, 2.44, 1.43), 
(639, 1.54, 2.19), 
(640, 1.12, 1.7), 
(641, 2.23, 2.01), 
(642, 2.06, 2.34), 
(643, 1.85, 1.91), 
(644, 2.83, 1.71), 
(645, 2.39, 1.44), 
(646, 1.15, 2.44), 
(647, 2.03, 2.43), 
(648, 1.87, 1.78), 
(649, 2.92, 1.86), 
(650, 2.89, 2.45), 
(651, 1.1, 1.76), 
(652, 1.61, 1.52), 
(653, 2.25, 1.45), 
(654, 1.99, 2.65), 
(655, 1.97, 2.9), 
(656, 2.44, 1.7), 
(657, 2.41, 2.52), 
(658, 1.4, 2.42), 
(659, 2.92, 1.24), 
(660, 1.95, 2.85), 
(661, 1.11, 1.96), 
(662, 1.75, 1.72), 
(663, 2.15, 2.02), 
(664, 1.28, 1.41), 
(665, 2.08, 2.32), 
(666, 2.62, 1.85), 
(667, 1.6, 2.89), 
(668, 1.9, 2.58), 
(669, 2.03, 1.57), 
(670, 1.89, 1.1), 
(671, 1.07, 1.48), 
(672, 2.73, 2.95), 
(673, 2.79, 2.09), 
(674, 1.04, 2.36), 
(675, 2.23, 1.39), 
(676, 2.68, 1.81), 
(677, 1.64, 2.24), 
(678, 2.13, 1.44), 
(679, 2.84, 1.74), 
(680, 2.86, 1.33), 
(681, 2.76, 2.65), 
(682, 2.82, 2.41), 
(683, 2.08, 2.46), 
(684, 2.48, 2.6), 
(685, 2.56, 2.81), 
(686, 2.61, 1.14), 
(687, 1.99, 1.16), 
(688, 1.1, 1.37), 
(689, 2.37, 1.86), 
(690, 1.35, 1.76), 
(691, 2.97, 1.71), 
(692, 2.25, 2.7), 
(693, 1.26, 2.87), 
(694, 1.41, 2.23), 
(695, 2.75, 2.35), 
(696, 2.35, 2.71), 
(697, 2.76, 2.63), 
(698, 2.54, 1.65), 
(699, 2.77, 2.39), 
(700, 2.81, 2.38), 
(701, 2.24, 2.34), 
(702, 2.77, 1.65), 
(703, 2.36, 2.29), 
(704, 1.38, 2.04), 
(705, 1.65, 2.62), 
(706, 1.95, 1.38), 
(707, 1.11, 2.85), 
(708, 1.5, 2.29), 
(709, 1.81, 1.46), 
(710, 1.48, 1.53), 
(711, 1.82, 1.38), 
(712, 2.32, 2.84), 
(713, 2.42, 1.51), 
(714, 1.76, 1.82), 
(715, 2.61, 1.69), 
(716, 2.24, 2.62), 
(717, 2.27, 1.83), 
(718, 2.04, 1.68), 
(719, 1.94, 1.85), 
(720, 1.9, 1.29), 
(721, 2.67, 2.51), 
(722, 1.42, 2.17), 
(723, 2.07, 1.2), 
(724, 2.62, 2.62), 
(725, 2.18, 2.96), 
(726, 1.2, 2.96), 
(727, 1.24, 1.33), 
(728, 2.63, 1.41), 
(729, 1.77, 1.84), 
(730, 2.09, 1.16), 
(731, 2.99, 2.04), 
(732, 1.98, 1.54), 
(733, 2.75, 2.96), 
(734, 1.97, 2.49), 
(735, 2.12, 1.52), 
(736, 1.53, 1.69), 
(737, 1.03, 2.14), 
(738, 2.57, 2.57), 
(739, 2.54, 1.2), 
(740, 2.93, 2.34), 
(741, 2.23, 1.45), 
(742, 2.28, 2.59), 
(743, 1.71, 1.41), 
(744, 2.01, 2.08), 
(745, 2.58, 2.89), 
(746, 2.87, 1.52), 
(747, 2.29, 1.79), 
(748, 1.1, 1.3), 
(749, 1.19, 1.06), 
(750, 2.84, 2.76), 
(751, 2.93, 2.28), 
(752, 1.39, 2.62), 
(753, 1.58, 1.07), 
(754, 1.37, 2.03), 
(755, 1.91, 1.58), 
(756, 2.68, 2.28), 
(757, 1.68, 2.27), 
(758, 1.27, 1.12), 
(759, 1.15, 1.88), 
(760, 1.29, 2.67), 
(761, 1.45, 2.43), 
(762, 1.17, 2.97), 
(763, 2.92, 1.6), 
(764, 1.16, 1.04), 
(765, 1.39, 2.87), 
(766, 1.01, 1.33), 
(767, 2.21, 1.82), 
(768, 1.88, 2.88), 
(769, 1.76, 1.86), 
(770, 1.71, 2.13), 
(771, 2.8, 2.56), 
(772, 1.28, 2.64), 
(773, 1.92, 1.58), 
(774, 2.24, 1.78), 
(775, 1.32, 1.72), 
(776, 1.84, 1.45), 
(777, 1.26, 2.48), 
(778, 2.91, 1.9), 
(779, 1.99, 2.2), 
(780, 1.55, 2.15), 
(781, 2.21, 2.12), 
(782, 1.34, 1.53), 
(783, 1.97, 2.63), 
(784, 2.32, 2.63), 
(785, 1.59, 2.77), 
(786, 2.06, 1.96), 
(787, 1.48, 1.81), 
(788, 2.45, 1.22), 
(789, 2.25, 2.09), 
(790, 1.37, 1.16), 
(791, 2.06, 2.02), 
(792, 2.96, 2.57), 
(793, 1.22, 2.47), 
(794, 2.71, 1.13), 
(795, 1.04, 1.67), 
(796, 2.34, 1.37), 
(797, 2.65, 1.99), 
(798, 1.98, 2.48), 
(799, 1.21, 2.91), 
(800, 1.02, 1.1), 
(801, 2.35, 1.15), 
(802, 1.35, 1.32), 
(803, 1.79, 1.4), 
(804, 2.44, 2.34), 
(805, 2.34, 2.96), 
(806, 1.29, 2.8), 
(807, 2.42, 1.15), 
(808, 1.11, 2.61), 
(809, 1.56, 2.69), 
(810, 2.1, 2.42), 
(811, 1.97, 1.11), 
(812, 1.17, 1.92), 
(813, 1.97, 1.29), 
(814, 2.5, 2), 
(815, 2.95, 1.37), 
(816, 2.76, 2.55), 
(817, 2.48, 2.06), 
(818, 1.89, 1.68), 
(819, 2.82, 2.6), 
(820, 2.03, 1.74), 
(821, 1.63, 1.22), 
(822, 2.51, 2.39), 
(823, 1.24, 1.26), 
(824, 1.16, 1.24), 
(825, 2.1, 1.55), 
(826, 2.66, 2.3), 
(827, 2.79, 2.74), 
(828, 1.26, 2.33), 
(829, 2.11, 2.42), 
(830, 1.88, 2.6), 
(831, 2.47, 2.08), 
(832, 2.4, 1.14), 
(833, 1.8, 2.59), 
(834, 2.93, 2.25), 
(835, 1.4, 1.05), 
(836, 2.31, 1.86), 
(837, 2.64, 2.85), 
(838, 1.27, 1.99), 
(839, 2.89, 1.24), 
(840, 2.16, 1.5), 
(841, 2.73, 1.38), 
(842, 2.88, 2.18), 
(843, 1.69, 2.3), 
(844, 1.47, 1.73), 
(845, 2.69, 1.29), 
(846, 1.25, 2.4), 
(847, 1.91, 2.97), 
(848, 1.62, 1.82), 
(849, 2.34, 2.41), 
(850, 1.47, 2.73), 
(851, 2.65, 2.04), 
(852, 1.33, 2.77), 
(853, 1.45, 2.33), 
(854, 1.68, 2.39), 
(855, 1.44, 2.88), 
(856, 2.77, 2.08), 
(857, 1.13, 2.33), 
(858, 2.32, 1.68), 
(859, 1.23, 2.37), 
(860, 2.73, 1.56), 
(861, 1.32, 1.03), 
(862, 1.41, 1.48), 
(863, 1.38, 1.78), 
(864, 1.25, 1.92);


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