# Description:
#   Uses WU tp get some basic astronomical statuses like moon and sunrise/sunset
#
# Dependencies:
#   None
#
# Commands:
#   sunset <place>
#   sunrise <place>
#
# Author:
#   ttfnrob
#encode html

module.exports = (robot) ->

  escape = (txt) -> 
    txt.replace(/&/g,'&amp;' ).replace(/</g,'&lt;').replace(/"/g,'&quot;').replace(/'/g,'&#039;')

  robot.respond /sunrise (.*)/i, (msg) ->
    thePlace = escape(msg.match[1])
    msg.http("http://api.wunderground.com/api/e8e7b4a228c3d96d/astronomy/q/#{escape(thePlace)}.json")
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          hour = json.sun_phase.sunrise.hour
          minute = json.sun_phase.sunrise.minute
          text = "#{hour}:#{minute}"
        catch error
          text = "No info found"
        msg.send text

  robot.respond /sunset (.*)/i, (msg) ->
    thePlace = escape(msg.match[1])
    msg.http("http://api.wunderground.com/api/e8e7b4a228c3d96d/astronomy/q/#{escape(thePlace)}.json")
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          hour = json.sun_phase.sunset.hour
          minute = json.sun_phase.sunset.minute
          text = "#{hour}:#{minute}"
        catch error
          text = "No info found"
        msg.send text

  robot.respond /moonphase/i, (msg) ->
    thePlace = escape(msg.match[1])
    msg.http("http://api.wunderground.com/api/e8e7b4a228c3d96d/astronomy/q/Chicago.json")
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          text = "#{json.moon_phase.phaseofMoon}"
        catch error
          text = "No info found"
        msg.send text