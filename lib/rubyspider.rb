# required files
require 'rubyspider/version'
require 'modes/crawler'
# required libs/gems
require 'watir'

# Rubyspider is the parent module which controls everything
module Rubyspider
  # args - target url, mode
  # call spidering mode
  def self.run(args)
    # Require a mode to run in, or exit.
    raise 'Please Select a mode to run in.' if args[:mode].nil?
    case args[:mode]
    when 1
      res = Rubyspider::Crawler.spider(args[:target])
    when 2
      # something about building a selenium script with args
    end
    return res
  end # end run
end
