require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

module BillBot
  module Base

    SLACKCLIENT = Slack::Web::Client.new

    def sayz(data, txt)
      SLACKCLIENT.chat_postMessage(channel: data.channel, text: txt, as_user: true)
    end

  end
end
