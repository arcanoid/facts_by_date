require "facts_by_date/version"

module FactsByDate
  class Generator
    ROOT = File.expand_path("../..", __FILE__)

    def self.facts_for_today(options = {})
      converted_date = Date.today
      facts = []

      if File.exist?("#{ROOT}/data/facts/#{converted_date.month}/#{converted_date.day}.json")
        file = File.read("#{ROOT}/data/facts/#{converted_date.month}/#{converted_date.day}.json")
        data_hash = JSON.parse(file)

        facts = data_hash[0]['facts']

        # if size option is provided retrieve information only for that size
        if options[:size].nil?
          facts
        else
          facts.take(options[:size])
        end
      else
        []
      end
    end

    def self.facts_for_specific_date(date, options = {})
      begin
        converted_date = Date.parse(date)

        if File.exist?("#{ROOT}/data/facts/#{converted_date.month}/#{converted_date.day}.json")
          file = File.read("#{ROOT}/data/facts/#{converted_date.month}/#{converted_date.day}.json")
          data_hash = JSON.parse(file)

          facts = data_hash[0]['facts']

          # if size option is provided retrieve information only for that size
          if options[:size].nil?
            facts
          else
            facts.take(options[:size])
          end
        else
          []
        end
      rescue ArgumentError
        []
      end
    end

    def self.births_for_today(options = {})
      converted_date = Date.today
      facts = []

      if File.exist?("#{ROOT}/data/births/#{converted_date.month}/#{converted_date.day}.json")
        file = File.read("#{ROOT}/data/births/#{converted_date.month}/#{converted_date.day}.json")
        data_hash = JSON.parse(file)

        facts = data_hash[0]['births']

        # if size option is provided retrieve information only for that size
        if options[:size].nil?
          facts
        else
          facts.take(options[:size])
        end
      else
        []
      end
    end

    def self.births_for_specific_date(date, options = {})
      begin
        converted_date = Date.parse(date)

        if File.exist?("#{ROOT}/data/births/#{converted_date.month}/#{converted_date.day}.json")
          file = File.read("#{ROOT}/data/births/#{converted_date.month}/#{converted_date.day}.json")
          data_hash = JSON.parse(file)

          facts = data_hash[0]['births']

          # if size option is provided retrieve information only for that size
          if options[:size].nil?
            facts
          else
            facts.take(options[:size])
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
