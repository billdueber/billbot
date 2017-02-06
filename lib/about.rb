require 'slack-ruby-bot'
require_relative 'billbot_base'

module BillBot
  class About < SlackRubyBot::Commands::Base
    extend BillBot::Base
    command 'about'
    match(/^(?<bot>[[:alnum:][:punct:]@<>]*)$/u)


    def self.call(client, data, match)
      sayz(data, "I'm just a simple bot Bill Dueber made. If I see something that looks
like a HathiTrust identifier (e.g., mdp.39015018652357), I'll turn it into something more useful.")
    end

  end
end
