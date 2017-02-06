require 'slack-ruby-bot'
require_relative 'billbot_base'
require 'json'

module BillBot
  class Huzzah < SlackRubyBot::Commands::Base
    extend BillBot::Base

    LANGS = JSON.load(File.open('maps/marc_language.json'))


    # match /\%lang\s+([^\s\"\']+)/i
    # match /\A\s*\%lang\s*\Z/

    def self.perfect_match(key)
      if LANGS[key]
        [key, LANGS[key]]
      else
        nil
      end
    end

    match /\%lang(\s+[^\s\"\']*|\s*)\Z/i do |client, data, match|
      if match[1].strip.nil? or match[1].strip.empty?
        sayz(data, "Use: look for a MARC language-code or language name.\n Try '%lang eng' or '%lang German'")
        return
      end
      key      = match[1].strip
      keymatch = Regexp.new(key, Regexp::IGNORECASE)
      greeting = "Looking for languages matching '#{key}'\n"
      matches  = LANGS.find_all { |k, v| keymatch.match(v) }.unshift(self.perfect_match(key)).compact
      if matches.empty?
        sayz(data, greeting + "No matching langauges found")
      else
        sayz(data, greeting + matches.map { |a| a.join(' = ') }.join("\n"))
      end
    end
  end
end
