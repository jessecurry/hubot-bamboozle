# Description
#   A Bamboozle Cafe specials provider for the Hubots.
#
# Configuration:
#   None
#
# Commands:
#   hubot bamboozle me - displays the special for the day
#
# Author:
#   jessecurry

module.exports = (robot) ->
  robot.respond /bamboozle me\b/i, (msg) ->
    robot.http("http://bamboozlecafe.com/bamboozle-cafe-daily-specials/")
      .header('Accept', 'text/html')
      .get() (err, res, body) ->
        # if response.getHeader('Content-Type') isnt 'text/html'
        #   msg.send "I can't help you out right now :("
        #   return
        specials = []

        cheerio = require('cheerio')
        $ = cheerio.load(body,
          normalizeWhitespace: true
          xmlMode: false
          decodeEntities: true
        )

        $(".quickiemenu").each (i, elem) ->
          specials[i] =
            day: $(this).find('.quickietitle').text()
            meal: $(this).find('.quickiedesc').text()

        for i in [0...specials.length]
          special = specials[i]
          msg.send "*#{special.day}:* #{special.meal}"
