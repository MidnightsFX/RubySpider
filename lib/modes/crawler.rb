# required files
require 'rubyspider'
# required libs/gems
require 'watir'
require 'JSON'

module Rubyspider
  # used to collect information from a site
  class Crawler
    # args - target url
    def self.spider(url)
      browser = setup(url)
      # do the spidering
      spider_results = {
        links: spider_links(browser),
        inputs: {
          buttons: spider_input(browser, 'button'),
          textfields: spider_input(browser, 'textfield'),
          textareas: spider_input(browser, 'textarea')
        }
      }
      res = JSON.pretty_generate(spider_results)
      browser.close # close down the browser
      return res # returns 2D array
    end # end spider function

    # Iterate through all of the existing links, and add to array
    def self.spider_links(browser)
      paths = []
      links = browser.links
      links.each do |lnk|
        paths << {
          name: lnk.name,
          id: lnk.id,
          text: lnk.text,
          href: lnk.href,
          hidden: lnk.hidden?
        }
      end
      # Consider removing duplicate links?
      return paths
    end

    # Iterate through all of the existing links, and add to array
    def self.spider_input(browser, type)
      inputs = []
      case type
      when 'button'
        input_type = browser.buttons
      when 'textfield'
        input_type = browser.text_fields
      when 'textarea'
        input_type = browser.textareas
      else
        raise "In page object type not defined #{type}"
      end
      input_type.each do |ipt|
        inputs << {
          name: ipt.name,
          id: ipt.id,
          type: ipt.type,
          text: ipt.text,
          hidden: ipt.hidden?
        }
      end
      # Consider removing duplicate links?
      return inputs
    end

    # remove duplicate entries
    # finish filter when not mentally sleepy
   #def self.filter(list)
   #  # iterate through the recieved list and form new list without duplicates
   #  filtered_list = []
   #  list.each do |li|
   #    filtered_list.each do |fl_c|
   #      if fl_c[:name] == li[:name] && fl_c[:id] == li[:id] && fl_c[:text] == li[:text]
   #        
   #      end
   #    end
   #  end

   #  return filtered_list
   #end

    # args - target url
    # build the browser and go to the target
    def self.setup(url)
      b = Watir::Browser.new :phantomjs
      b.goto url
      return b # return the browser object for use
    end
  end # end crawler class
end
