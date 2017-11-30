require 'spec_helper'

describe Rubyspider do

  describe 'Testing negative test cases' do
    it 'Should Spider the configtester', cfgspider: true do
      args = {
        #mode: 1,
        target: 'http://google.com'
      }
      expect { Rubyspider.run(args) }.to raise_error(RuntimeError)
    end
  end

end
