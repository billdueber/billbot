require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

module BillBot
  module Base

    SLACKCLIENT = Slack::Web::Client.new

    LONG_ENOUGH = 30 # seconds
    LastTrigger = Hash.new { 0 }

    def check_and_set_timeout_time(key, timeout=LONG_ENOUGH)
      now = Time.now
      if now - LastTrigger[key] >= timeout
        LastTrigger[key] = now
        true
      else
        false
      end
    end

    def sayz(data, txt)
      SLACKCLIENT.chat_postMessage(channel: data.channel, text: txt, as_user: true)
    end

  end
end
