# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scraping_hub/version'

Gem::Specification.new do |spec|
  spec.name          = 'scraping_hub'
  spec.version       = ScrapingHub::VERSION
  spec.authors       = ['Vinicius Ferreira Negrisolo']
  spec.email         = ['vinicius.negrisolo@gmail.com']

  spec.summary       = 'ScrapingHub Ruby Gem'
  spec.description   = 'ScrapingHub Ruby Gem'
  spec.homepage      = 'http://github.com/LoveMondays/scraping_hub'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://github.com/LoveMondays/scraping_hub'
  else
    fail 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # spec.add_dependency 'jeckle'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'codeclimate-test-reporter'
end
