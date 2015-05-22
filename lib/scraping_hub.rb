%w(version setup).each do |file_name|
  require "scraping_hub/#{file_name}"
end

module ScrapingHub
  def self.configure
    yield ScrapingHub::Setup
  end
end
