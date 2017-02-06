require 'slack-ruby-bot'
require_relative 'billbot_base'

module BillBot
  class MetaData <  SlackRubyBot::Bot
    extend BillBot::Base

    RESPONSES = [
        "Jeez. Enough with the metadata.",
        "Metadata. Pft. It's just 'data', people.",
        "The hardcore stuff is 'metaldata'.",
        "Metadata? When we have full text? That's so cute!",
        "Luckily, the accuracy of the metadata is without doubt. NOT!",
        "Try to represent the date range 1889-1891 in a MARC record, and *then* talk to me about metadata",
        "I love library metadata, where 'unique identifier' means neither of those things.",
        "If you pronouce it 'MAY-tah-day-tah', you're a bad person, and we hate you",
        "I can index the metadata very fast. See, it's paucity is a *feature*!",
        'Stupid MARC. "How do I find the title" should *not* be a hard question!',
        "Is that like, data about data?",
        "I never metadata I didn't like.",
    ]

    match /metadata/i do |client, data, match|
      if check_and_set_timeout_time(:metadata)
        sayz(data, RESPONSES.shuffle.first)
      end
    end

  end
end
