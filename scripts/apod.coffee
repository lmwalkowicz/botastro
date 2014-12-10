# Description:
#   APOD grabber
#
# Dependencies:
#   None
#
# Commands:
#   apod bomb <i> - get i random APOD images
#   apod me - get a random APOD image
#   apod <YYYMMDD> - gets APOD for a given date
#
# Author:
#   ttfnrob

apod_data = "https://raw.githubusercontent.com/slowe/apod/master/apod.json"

module.exports = (robot) ->
  robot.respond /apod me/i, (msg) ->
    msg.http(apod_data)
      .get() (err, res, body) ->
        apods = JSON.parse(body).apod
        r = Math.floor(Math.random() * (apods.length + 1))
        img = apods[r].image
        msg.send img

  robot.respond /apod bomb( (\d+))?/i, (msg) ->
    count = msg.match[2]-1 || 5
    msg.http(apod_data)
      .get() (err, res, body) ->
        apods = JSON.parse(body).apod
        end = 0
        loop
          r = Math.floor(Math.random() * (apods.length + 1))
          img = apods[r].image
          unless img==undefined
            msg.send img
            end++
            break if end>count

  robot.respond /apod (\d{4})([0-1][0-9])([0-3][0-9])/i, (msg) ->
    yr = msg.match[1]
    mn = msg.match[2]
    dy = msg.match[3]
    date = "#{yr}-#{mn}-#{dy}"
    msg.send "Date is #{date}"
    msg.http(apod_data)
      .get() (err, res, body) ->
        apods = JSON.parse(body).apod
        selected = (apod.image for apod in apods when apod["date"] == date)
        msg.send selected

