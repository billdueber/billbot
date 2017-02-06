require 'slack-ruby-bot'
require_relative 'billbot_base'

module BillBot
  class Platform < SlackRubyBot::Bot
    extend BillBot::Base
    match /the platform/i do |client, data, match|
      if check_and_set_timeout_time(:platform)
        sayz(data, "Build the platform. Extend the platform. *BE the platform*")
      end
    end

  end
end
