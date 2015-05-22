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
      attr_accessor :base_url
    end

    def self.base_url
      @base_url ||= 'https://scrapinghub.com/'
    end
  end
end
