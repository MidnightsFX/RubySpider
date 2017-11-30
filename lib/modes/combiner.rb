# required files
require 'rubyspider'
# required libs/gems

module Rubyspider
  # the combiner is used to create a number of plausible selenium scenarios
  class Combiner
    # Create scenarios preforms some magics to select potentially useful paths and make test-cases
    def self.create_scenarios(args)

    end # end create_scenarios
    # args contain the list of scraped values
    # remove potentially not useful things
    def self.magic_filters(args)
      filtered_list = []
      args.each do |lv|
        if !lv[:name].upcase.inclue?('ABOUT') || !lv[:id].upcase.inclue?('ABOUT') || !lv[:text].upcase.inclue?('ABOUT')
          filtered_list << lv
        end
      end
    end # end magic_filters
  end # end combiner class

end # end module
