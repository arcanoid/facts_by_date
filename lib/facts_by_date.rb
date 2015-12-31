require "facts_by_date/version"

module FactsByDate
  class Generator
    ROOT = File.expand_path("../..", __FILE__)

    def self.facts_for_today(options = {})
      converted_date = Date.today
      facts = []

      if File.exist?("#{ROOT}/data/#{converted_date.month}/#{converted_date.day}.json")
        file = File.read("#{ROOT}/data/#{converted_date.month}/#{converted_date.day}.json")
        data_hash = JSON.parse(file)

        facts = data_hash[0]['facts']

        # if size option is provided retrieve information only for that size
        if options[:size].present?
          facts.take(options[:size])
        else
          facts
        end
      else
        []
      end
    end

    def self.facts_for_specific_date(date, options = {})
      begin
        converted_date = Date.parse(date)

        if File.exist?("#{ROOT}/data/#{converted_date.month}/#{converted_date.day}.json")
          file = File.read("#{ROOT}/data/#{converted_date.month}/#{converted_date.day}.json")
          data_hash = JSON.parse(file)

          facts = data_hash[0]['facts']

          # if size option is provided retrieve information only for that size
          if options[:size].present?
            facts.take(options[:size])
          else
            facts
          end
        else
          []
        end
      rescue ArgumentError
        []
      end
    end
  end
end
