require 'spec_helper'

RSpec.describe ScrapingHub::Setup do
  subject(:setup) { described_class }

  describe '.base_url' do
    context 'when the base_url is set' do
      it 'verify base_url default and new value' do
        expect(setup.base_url).to eq 'https://scrapinghub.com/'
        setup.base_url = 'http://test.com'
        expect(setup.base_url).to eq 'http://test.com'
      end
    end
  end
end
