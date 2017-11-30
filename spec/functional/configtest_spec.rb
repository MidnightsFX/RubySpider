require 'spec_helper'

describe Rubyspider do

  describe 'Configuration Testing Spidering' do
    it 'Should Spider the configtester', cfgspider: true do
      args = {
        mode: 1,
        target: 'http://google.com'
      }
      results = Rubyspider.run(args)
      puts results # gotta check those development results!
    end
  end

end
