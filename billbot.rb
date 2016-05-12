require 'slack-ruby-bot'
require 'slack-ruby-client'

require_relative 'lib/htitem'


SlackRubyBot::Client.logger.level = Logger::WARN


# Load up the stuff

require_relative 'lib/platform'
require_relative 'lib/htexpand'

class BillBot::Bot < SlackRubyBot::Bot

end

BillBot::Bot.run
