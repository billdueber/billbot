require 'slack-ruby-bot'
require_relative 'billbot_base'
require_relative 'htitem'

module BillBot
  class HTExpand < SlackRubyBot::Commands::Base
    extend BillBot::Base

    scan HTItem::SCANPAT do |client, data, matches|
      return if data['msg'] && data['msg']['do_not_unfurl_links']
      ids = matches.uniq
      ids.each do |id| #   matches.uniq.each do |id|
        if check_and_set_timeout_time(id)
          begin
            item = HTItem.new(id)
            sayz(data, ">>> _#{item.full_title}_\n rights: `#{item.rights}`, orig: #{item.orig}. Last updated #{item.last_update_date_string}\n#{item.ht_links}")
          rescue HTItem::BadHTIDError => e
            sayz(data, e.message)
          end

        end

      end
    end

  end
end
