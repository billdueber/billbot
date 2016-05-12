require 'slack-ruby-bot'
require_relative 'billbot_base'

module BillBot
  class Platform < SlackRubyBot::Commands::Base
    extend BillBot::Base
    match /the platform/i

    def self.call(client, data, match)
      sayz(data, "Build the platform. Extend the platform. *BE the platform*")
    end

  end
end
