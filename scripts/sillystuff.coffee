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

#    robot.hear /evil/i, (res) ->
#        imageMe robot, res, "dr%20evil", (image) ->
#            res.send "#{image.unescapedUrl}"

#    robot.respond /chew( me)? (.*)/i, (res) ->
#        imageMe robot, res, "chewbacca", (image) ->
#            res.send "#{image.unescapedUrl}"

#    robot.respond /cage( me)? (.*)/i, (res) ->
#        imageMe robot, res, "nicolas%20cage%20crazy%20face", (image) ->
#            res.send "#{image.unescapedUrl}"

#    robot.respond /what do you fear/i, (res) ->
#        imageMe robot, res, "fear%20and%20loathing%20in%las%20vegas", (image) ->
#            res.send "#{image.unescapedUrl}"

    robot.respond /you suck/i, (msg) ->
        msg.emote ":cry:"

    

#imageMe = (robot, msg, query, cb) ->
#    googleCseId = process.env.HUBOT_GOOGLE_CSE_ID
#    googleApiKey = process.env.HUBOT_GOOGLE_CSE_KEY
#    if !googleApiKey 
#       msg.robot.logger.error "Missing environment variable HUBOT_GOOGLE_CSE_KEY" 
#       msg.send "Missing server environment variable HUBOT_GOOGLE_CSE_KEY." 
#       return 

#    url = 'https://www.googleapis.com/customsearch/v1' 
#     msg.http(url) 
#       .query(q) 
#       .get() (err, res, body) -> 
#         if err 
#           if res.statusCode is 403 
#             msg.send "Daily image quota exceeded." 
#             cb('http://i.imgur.com/CzFTOkI.png') 
#           else 
#             msg.send "Encountered an error :( #{err}" 
#           return 
#         if res.statusCode isnt 200 
#           msg.send "Bad HTTP response :( #{res.statusCode}" 
#           return 
#         response = JSON.parse(body) 
#         if response?.items 
#           image = msg.random response.items 
#           cb(image.link)
#         else 
#           msg.send "Oops. I had trouble searching '#{query}'. Try later." 
#           ((error) -> 
#             msg.robot.logger.error error.message 
#             msg.robot.logger 
#               .error "(see #{error.extendedHelp})" if error.extendedHelp 
#           ) error for error in response.error.errors if response.error?.errors 