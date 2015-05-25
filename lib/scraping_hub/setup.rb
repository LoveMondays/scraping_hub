module ScrapingHub
  # Configure ScrapingHub Access
  #
  # @example
  #
  #  ScrapingHub.configure do |config|
  #    config.base_url = 'https://scrapinghub.com'
  #  end
  #
  class Setup
    class << self
      attr_accessor :base_url, :key, :project_id
      attr_accessor :open_timeout, :read_timeout

      attr_writer :stub
    end

    def self.base_url
      @base_url ||= 'https://storage.scrapinghub.com/'
    end

    def self.stub?
      @stub || false
    end
  end
end
