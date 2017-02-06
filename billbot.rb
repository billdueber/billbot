require 'slack-ruby-bot'
require 'slack-ruby-client'
require 'date'

require_relative 'lib/billbot_base'


SlackRubyBot::Client.logger.level = Logger::WARN


# Load up the stuff. The bot apparently finds the
# subclasses just through loading. I should see how
# it does that...

require_relative 'lib/htexpand'
require_relative 'lib/about'
require_relative 'lib/marc_language'

require_relative 'lib/platform'
require_relative 'lib/huzzah'
require_relative 'lib/metadata'
require_relative 'lib/ocr'

# Nothing to see here; I'm not even sure I need it rather than
# just SlackRubyBot.run
#
# But, even so, it's a shell where I can put other stuff.

SlackRubyBot::Config.allow_message_loops = false

class BillBot::Bot < SlackRubyBot::Bot

  extend BillBot::Base


  help do
    title 'BillBot'
    desc "If I see something that looks
like a HathiTrust identifier (e.g., mdp.39015018652357), I'll turn it into something more useful."

    command '%lang <code or string>' do
      desc "Search the MARC languages mapping"
    end
  end


end

BillBot::Bot.run


