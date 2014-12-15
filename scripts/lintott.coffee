# Description:
#   Uses Foursquare to find the BBC's Chris Lintott
#
# Dependencies:
#   None
#
# Commands:
#   locate lintott
#
# Author:
#   ttfnrob

module.exports = (robot) ->
  robot.respond /locate lintott/i, (msg) ->
    msg.http("https://api.foursquare.com/v2/users/self/checkins?oauth_token=MBED45EKO3PRI550U4BYVURBUEFRQTVVYQJMVVKSHRPKQ13W&v=20141210")
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          place = json.response.checkins.items[0].venue.name
          type = json.response.checkins.items[0].venue.categories[0].name
          text = ".@chrislintott last spotted at #{place}, which is a #{type}"
        catch error
          text = "No info found"
        msg.send text