# the ENV['CODECLIMATE_REPO_TOKEN'] should be set
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bundler/setup'
require 'scraping_hub'

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }
