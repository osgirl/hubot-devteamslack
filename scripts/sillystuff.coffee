# Description:
#   Scripts for fun silly stuff. If you want something silly in Hubot, put it here.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot cage me - A true artist
#   hubot chew me - What a wookie!
#   hubot evil - Muhahahaha!
#   hubot you suck - whoops!
#   hubot what do you fear - this is bat country
#
# Author:
#   shaun (and hopefully others)

module.exports = (robot) ->

    robot.hear /evil/i, (res) ->
        imageMe robot, res, "dr%20evil", (image) ->
            res.send "#{image.unescapedUrl}"

    robot.respond /chew( me)? (.*)/i, (res) ->
        imageMe robot, res, "chewbacca", (image) ->
            res.send "#{image.unescapedUrl}"

    robot.respond /cage( me)? (.*)/i, (res) ->
        imageMe robot, res, "nicolas%20cage%20crazy%20face", (image) ->
            res.send "#{image.unescapedUrl}"

    robot.respond /what do you fear/i, (res) ->
        imageMe robot, res, "fear%20and%20loathing%20in%las%20vegas", (image) ->
            res.send "#{image.unescapedUrl}"

    robot.respond /you suck/i, (msg) ->
        msg.emote ":cry:"

    

imageMe = (robot, msg, query, cb) ->
    robot.http('http://ajax.googleapis.com/ajax/services/search/images')
        .query(v: "1.0", rsz: '8', q: query)
        .get() (err, res, body) ->
            images = JSON.parse(body)
            images = images.responseData.results
            image = msg.random images
            cb(image)