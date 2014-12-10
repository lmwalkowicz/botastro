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

# keeps track of recently displayed pages, to prevent spamming
class allTheGIFs
  constructor: (@maxage) ->
    @issues = []

  cleanup: ->
    for issue,time of @issues
      age = Math.round(((new Date()).getTime() - time) / 1000)
      if age > @maxage
        delete @issues[issue]
    return

  contains: (issue) ->
    @cleanup()
    @issues[issue]?

  add: (issue,time) ->
    time = time || (new Date()).getTime()
    @issues[issue] = time

module.exports = (robot) ->
  # how long (seconds) to wait between repeating the same link
  
  linkDelay = 30

  thegifs = new allTheGIFs linkDelay
      
  # scrape (already retrieved) HTML
  # selectors: an array of jquery selectors
  # callback: function that takes scrape results
  scrape = (body, selectors, callback) ->
    jsdom.env body, [jquery], (errors, window) ->
      # use jquery to run selector and return the elements
      callback (window.$(selector).text().trim() for selector in selectors)

  # fetch a drupal.org page using http scraping
  fetchPage = (msg) ->
    theObject = msg.match[1]
    url = "http://giphy.com/search/space-#{theObject}"
    msg.send url
    thegifs.add url
    request {url: url, headers: {'User-Agent': 'hubot'}}, (err, res, body) ->
      if err
        console.log "Errors getting url: #{url}"
        return   
      # check if this is an issue or non-issue page 
      scrape body, ['#gif'], (result) ->
        msg.send result
        if result[0] != ''
          outputIssue msg, url, body
        else if result[1] != ''
          outputPage msg, url, body
        else
          console.log "Errors scraping url: #{url}"

  # outputs info about a d.o issue, given a scrape response
  outputIssue = (msg, url, body) ->
    scrape body,
      [
        '#gif'                                                     
      ], 
      (results) ->
        msg.send "#{url} => #{results[0]}"

  # listen for page links
  robot.hear /gif (.*)/, fetchPage