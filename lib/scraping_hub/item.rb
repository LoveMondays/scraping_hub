# GET /items/PROJECT_ID/JOB_ID
module ScrapingHub
  class Item
    include Jeckle::Resource

    api :scraping_hub

    attribute :provider_company_name, String, as: :company
    attribute :provider_link, String, as: :link
    attribute :provider_education, String, as: :education
    attribute :provider_job_id, String, as: :id
    attribute :provider_benefits, String, as: :benefits
    attribute :provider_job_title, String, as: :job_title
    attribute :provider_company_description, String, as: :company_description
    attribute :provider_location, String, as: :location
    attribute :provider_salario, String, as: :salary
    attribute :provider_description, String, as: :description
    attribute :provider_contract, String, as: :contract_type

    def self.search(job_id, offset_id = nil, page_size = 1000)
      return [] if ScrapingHub.stub

      endpoint = "/items/#{ScrapingHub.project_id}/#{job_id}"
      super(resource_name: endpoint, count: page_size, start: offset_id)
    end

    def self.find_each
      Job.search.each do |job|
        search(job.key).each do |item|
          yield item
        end
      end
    end
  end
end
