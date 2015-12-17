# Description:
#   Scripts to monitor Azure tasks.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot azureping me <query> - Pings the specified site or locale. Options include US, CA, IE, UK, DOTD, and Outlet.
#
# Author:
#   shaun

module.exports = (robot) ->

    robot.respond /azureping( me)? (.*)/i, (msg) ->
        site = switch msg.match[2]
            when "CA" then "https://www.4imprint.ca"
            when "IE" then "https://www.4imprint.ie"
            when "UK" then "https://www.4imprint.co.uk"
            when "Outlet" then "https://outlet.4imprint.com"
            when "DOTD" then "https://promotions.4imprint.com/dealoftheday/"
            else "https://www.4imprint.com"

        msg.robot.http(site).get() (err, res, body) ->
            unless res.statusCode is 200
                msg.send "Houston, we have a problem. Status code is #{res.statusCode}"
                return

            msg.send "The site is working"
            return