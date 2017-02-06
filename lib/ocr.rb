require 'slack-ruby-bot'
require_relative 'billbot_base'

module BillBot
  class OCR < SlackRubyBot::Commands::Base
    extend BillBot::Base
    match /ocr/i

    RESPONSES = [
        "The OCR engine thought this Jackson Pollack painting was Arabic.",
        "I think the OCR was done with its eyes closed.",
        "OCR! Gimme an 'O'! <0>! Gimme a 'C'! <E>! Gimme an 'R'! <K>!",
        "The OCR engine thought this Arabic text was a Jackson Pollack painting.",
        "I think the OCR was drunk that day.",
        "OCR would be a lot easier if everyone would just speak 'Merican.",
        "OCR is like a two-year-old playing piano. The amazing thing is that it happens at all.",
        "We've got the 'optical' and 'character' part down. That last bit is harder.",
    ]

    def self.call(client, data, match)
      if check_and_set_timeout_time(:ocr)
        sayz(data, RESPONSES.shuffle.first)
      end
    end

  end
end
