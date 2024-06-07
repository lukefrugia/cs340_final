var cfb = require("cfb.js");
var defaultClient = cfb.ApiClient.instance;

function formatStartDate(dateString) {
  const date = new Date(dateString);
  const year = date.getUTCFullYear();
  const month = String(date.getUTCMonth() + 1).padStart(2, "0");
  const day = String(date.getUTCDate()).padStart(2, "0");
  return `${year}-${month}-${day}`;
}

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

function getRandomNumber() {
  // Generate a random number between 1 and 3
  const randomNum = Math.random() * (3 - 1) + 1;
  // Round to two decimal places
  return Math.round(randomNum * 100) / 100;
}

async function main() {
  // Configure API key authorization: ApiKeyAuth
  var ApiKeyAuth = defaultClient.authentications["ApiKeyAuth"];
  ApiKeyAuth.apiKey =
    "Bearer OrwrkpYuFYulO/kRid2HhP3H3YClfg8jTkRetWdF9C4+klJeZb7NbNj94uVypQs7";
  // Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
  // ApiKeyAuth.apiKeyPrefix = "Bearer ";

  var apiInstance = new cfb.TeamsApi();

  var id = 0;
  let ids = [];
  let conferences = [
    "ACC",
    "American Athletic",
    "Big 12",
    "Big Ten",
    "Conference USA",
    "FBS Independents",
    "Mid-American",
    "Mountain West",
    "Pac-12",
  ];
  var opts = {
    year: 2024, // Number | Year filter
  };

  console.log("INSERT INTO `LEAGUE` (league_id, name, sport) VALUES");

  conferences.forEach((conference) => {
    id += 1;
    console.log("(" + id + ", '" + conference + "', 'Football'), ");
  });

  i = 0;

  console.log("INSERT INTO `TEAM` (team_id, city, name, league_id) VALUES");

  await apiInstance.getTeams(opts).then(
    async function (data) {
      const jsonData = JSON.stringify(data, null, 2);
      const teamData = JSON.parse(jsonData);
      teamData.forEach((team) => {
        if (team.id < 3000) {
          const check = conferences.indexOf(team.conference);
          if (check != -1) {
            ids.push(team.id);
            console.log(
              "(" +
                team.id +
                ", '" +
                team.school +
                "', '" +
                team.mascot +
                "', " +
                (check + 1) +
                "),"
            );
          }
        }
      });

      console.log(
        "INSERT INTO `GAME` (game_id, game_date, home_team_id, away_team_id) VALUES"
      );

      var apiInstance = new cfb.GamesApi();
      // teamData.forEach((team) => {
      team = teamData[0];

      var year = 2024; // Year filter for games

      var opts = {
        team: team.name, // Team name
        home: team.name, // Home team filter
        seasonType: "regular", // Season type filter (regular or postseason)
      };

      await apiInstance.getGames(year, opts).then(
        function (data) {
          const jsonData = JSON.stringify(data, null, 2);
          const gameData = JSON.parse(jsonData);
          gameData.forEach((game) => {
            const date = formatStartDate(game.startDate);

            // I know this is the worst way to do this. I'm lazy
            ids.forEach((i) => {
              if (i === game.awayId) {
                ids.forEach((i) => {
                  if (i === game.homeId) {
                    id += 1;
                    console.log(
                      "(" +
                        id +
                        ", '" +
                        date +
                        "', " +
                        game.homeId +
                        ", " +
                        game.awayId +
                        "),  -- " +
                        game.homeTeam +
                        " vs. " +
                        game.awayTeam
                    );
                  }
                });
              }
            });
          });
        },
        function (error) {
          console.error(error);
        }
      );
    },
    // },
    function (error) {
      console.error(error);
    }
  );

  console.log(
    "INSERT INTO `ODDS` (odds_id, home_win_odds, away_win_odds) VALUES"
  );
  for (let i = 1; i <= id; i++) {
    console.log(
      "(" + i + ", " + getRandomNumber() + ", " + getRandomNumber() + "), "
    ); // Perform your actions here
  }
}

main();
