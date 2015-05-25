%w(version setup).each do |file_name|
require 'jeckle'

  require "scraping_hub/#{file_name}"
end

module ScrapingHub
  def self.configure
    setup = ScrapingHub::Setup
    yield setup

    Jeckle.configure do |config|
      config.register :scraping_hub do |api|
        api.basic_auth = { username: setup.key, password: '' }
        api.base_uri = setup.base_url
        api.middlewares { response :json }
        api.headers = { 'Accept' => 'application/json' }
      end
    end
  end
end
