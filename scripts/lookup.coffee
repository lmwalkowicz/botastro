# Description:
#   Uses lookUP (http://www.strudel.org.uk/lookUP/) to fetch basic info and data about a range of astronomical objects.
#
# Dependencies:
#   None
#
# Commands:
#   show me <object> - gives the best picture available of the current location of the object
#   tell me about <object> - Gives the category type, RA, and dec of the object
#
# Author:
#   ttfnrob

module.exports = (robot) ->
  robot.respond /show me (.*)/i, (msg) ->
    theObject = escape(msg.match[1])
    msg.http("http://www.strudel.org.uk/lookUP/json/?name=#{theObject}")
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          msg.send "#{json.image.src}\n"
        catch error
          msg.send "No info found"

  robot.respond /tell me about (.*)/i, (msg) ->
    theObject = escape(msg.match[1])
    msg.http("http://www.strudel.org.uk/lookUP/json/?name=#{theObject}")
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          msg.send "#{theObject} is a #{json.category.avmdesc}. It's at RA #{json.ra.decimal}, dec: #{json.dec.decimal}\n"
        catch error
          msg.send "No info found"