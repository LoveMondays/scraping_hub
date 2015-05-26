# GET /jobs/PROJECT_ID/list
module ScrapingHub
  class Job
    include Jeckle::Resource

    def self.resource_name
      "/jobq/#{ScrapingHub.project_id}/list"
    end

    api :scraping_hub

    attribute :key, String, as: :id
    attribute :ts, Date, as: :updated_at

    def self.search(page_size = 1000, offset_id = nil)
      return [] if ScrapingHub.stub

      super(count: page_size, start: offset_id)
    end
  end
end
