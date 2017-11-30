# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubyspider/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubyspider'
  spec.version       = Rubyspider::VERSION
  spec.authors       = ['Carl Stutz, Matt Riley']
  spec.email         = ['carl.stutz@gmail.com']

  spec.summary       = 'A Ruby based web spider designed to build testable scripts for a selenium driver.'
  spec.description   = 'Webspider is broken into a couple different parts, first it crawls a page to determine
                        interactable elements, then it builds most likely combinations for testing of those from 
                        an exhaustive list'
  spec.homepage      = ''
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org/'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'slop', '~> 4.4', '>= 4.4.1' # Handles CLI
  spec.add_dependency 'bundler', '~> 1.14' # For installing all gems
  spec.add_dependency 'watir', '~> 6.2.0' # Watir is a selenium driver in Ruby
  spec.add_dependency 'phantomjs-binaries', '~> 2.1', '>= 2.1.1.1' # allows using phantomJS without independant install

  spec.add_development_dependency 'rake', '~> 10.0' # rake tasks for gem
  spec.add_development_dependency 'rspec', '~> 3.5' # ruby spec tests
  spec.add_development_dependency 'simplecov', '~> 0.13.0' # code coverage on spec run
end
