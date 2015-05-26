require 'spec_helper'

RSpec.describe ScrapingHub do
  describe '.configure' do
    before do
      ScrapingHub.configure do |conf|
        conf.base_url = 'http://test.com'
        conf.api_key = 'my_api_key'
        conf.project_id = 'my_project_id'
        conf.read_timeout = 5
      end
    end

    let(:jeckle_api) { Jeckle::Setup.registered_apis[:scraping_hub] }

    it { expect(jeckle_api).to_not be nil }
    it { expect(jeckle_api.basic_auth).to eq(username: 'my_api_key', password: nil) }
    it { expect(jeckle_api.base_uri).to eq('http://test.com') }
    it { expect(jeckle_api.headers).to eq('Accept' => 'application/json') }
    it { expect(jeckle_api.timeout).to eq(open_timeout: 1, timeout: 5) }
  end
end
