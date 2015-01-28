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
     msg.send "Sup"
