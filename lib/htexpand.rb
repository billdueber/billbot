require 'slack-ruby-bot'
require_relative 'billbot_base'
require_relative 'htitem'

module BillBot
  class HTExpand < SlackRubyBot::Commands::Base
    extend BillBot::Base
    scan HTItem::SCANPAT

    def self.call(client, data, matches)
      matches.each do |id, namespace|
        item = HTItem.new(id)
        sayz(data, ">>> _#{item.full_title}_\n rights: '#{item.rights}', orig: #{item.orig}\n#{item.ht_links}")
      end
    end

  end
end
