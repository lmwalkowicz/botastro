urlFormEncode = (str) ->
  escape(str)
    .replace(new RegExp('\\+','g'),'%2B')
    .replace(new RegExp('%20','g'),'+')

module.exports = (robot) ->
  robot.respond /galaxy this (.*)/i, (msg) ->
    try
      text = msg.match[1]

      msg.http("http://writing.galaxyzoo.org")
        .header('Content-Type', 'application/x-www-form-urlencoded')
        .post("text=#{urlFormEncode(text)}") (err,res,body)->
          image_id = res.headers.location.match(/http\:\/\/writing\.galaxyzoo\.org\/([0-9a-zA-z]+)\//)[1]
          image_url = "http://mygalaxies.s3.amazonaws.com/#{image_id}.png"
          msg.send image_url
    catch
      msg.send "The galaxies are not playing nice today."
