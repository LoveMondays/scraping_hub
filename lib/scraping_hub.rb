require 'jeckle'

%w(version setup job item).each do |file_name|
  require "scraping_hub/#{file_name}"
end

module ScrapingHub
  def self.configure
    setup = ScrapingHub::Setup
    yield setup
    jeckle_configure(setup)
  end

  private

  def self.jeckle_configure(setup)
    Jeckle.configure do |config|
      config.register :scraping_hub do |api|
        api.basic_auth = { username: setup.key, password: '' }
        api.base_uri = setup.base_url
        api.middlewares { response :json }
        api.headers = { 'Accept' => 'application/json' }
        api.open_timeout = setup.open_timeout
        api.read_timeout = setup.read_timeout
      end
    end
  end
end
