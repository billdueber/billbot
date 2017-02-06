require 'slack-ruby-bot'
require_relative 'billbot_base'

module BillBot
  class Huzzah < SlackRubyBot::Commands::Base
    extend BillBot::Base

    match /huzzah/i

    def self.call(client, data, match)
      if check_and_set_timeout_time(:platform, 60)
        sayz(data, 'http://giphy.com/gifs/community-things-2xO491sY6f0cM')
      end
    end

  end
end
