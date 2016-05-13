require 'slack-ruby-bot'
require 'slack-ruby-client'

require_relative 'lib/billbot_base'


SlackRubyBot::Client.logger.level = Logger::WARN


# Load up the stuff. The bot apparently finds the
# subclasses just through loading. I should see how
# it does that...

require_relative 'lib/platform'
require_relative 'lib/htexpand'
require_relative 'lib/about'

# Nothing to see here; I'm not even sure I need it rather than
# just SlackRubyBot.run
#
# But, even so, it's a shell where I can put other stuff.

class BillBot::Bot < SlackRubyBot::Bot
  extend BillBot::Base

  match /huzzah/i do |client, data, _match|
    sayz(data, 'http://giphy.com/gifs/community-things-2xO491sY6f0cM')
  end



end

BillBot::Bot.run


