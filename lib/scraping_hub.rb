require 'jeckle'

require 'scraping_hub/version'
require 'scraping_hub/job'
require 'scraping_hub/item'

# Configure ScrapingHub Access
#
# @example
#
#  ScrapingHub.configure do |config|
#    config.api_key = 'my_api_key'
#    config.project_id = 'my_project_id'
#  end
#
module ScrapingHub
  class << self
    attr_accessor :base_url, :api_key, :project_id
    attr_accessor :open_timeout, :read_timeout

    attr_writer :stub

    def configure
      yield self

      @base_url ||= 'https://storage.scrapinghub.com/'
      @open_timeout ||= 1
      @read_timeout ||= 1
      @stub ||= false

      jeckle_configure
    end

    private

    def jeckle_configure
      Jeckle.configure do |config|
        config.register :scraping_hub do |api|
          api.basic_auth = { username: api_key, password: nil }
          api.base_uri = base_url
          api.middlewares { response :json }
          api.headers = { 'Accept' => 'application/json' }
          api.open_timeout = open_timeout
          api.read_timeout = read_timeout
        end
      end
    end
  end
end
