# Description:
#   All teh GIFS
#
# Dependencies:
#   "jsdom" : ">0.2.1"
#   "request" : ""
#
# Commands:
#   Drupal.org url - Show details about a drupal.org page or issue
#
# Author:
#   ttfnrob

request = require 'request'
jsdom = require 'jsdom'
jquery = 'http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'

module.exports = (robot) ->      
  # scrape (already retrieved) HTML
  # selectors: an array of jquery selectors
  # callback: function that takes scrape results
  scrape = (body, selectors, callback) ->
    jsdom.env body, [jquery], (errors, window) ->
      # use jquery to run selector and return the elements
      callback (window.$(selector).text().trim() for selector in selectors)

  # fetch a drupal.org page using http scraping
  getGIF = (msg) ->
    theObject = msg.match[1]
    url = "http://giphy.com/search/space-#{theObject}"
    msg.send url
    request {url: url, headers: {'User-Agent': 'hubot'}}, (err, res, body) ->
      if err
        console.log "Errors getting url: #{url}"
        return   
      # find the gif
      scrape body, ['.gifs-gif'], (result) ->
        msg.send result

  # listen for page links
  robot.hear /gif (.*)/, getGIF