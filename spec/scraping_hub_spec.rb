require 'spec_helper'

RSpec.describe ScrapingHub do
  it { expect(ScrapingHub::VERSION).not_to be nil }

  describe '.configure' do
    ScrapingHub.configure do |conf|
      it { expect(conf).to eq(ScrapingHub::Setup) }
    end
  end
end
