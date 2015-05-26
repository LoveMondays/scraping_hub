require 'spec_helper'

RSpec.describe ScrapingHub::Item do
  describe '.search' do
    context 'when the stub property is true' do
      before { allow(ScrapingHub).to receive(:stub) { true } }

      it { expect(described_class.search('job_id')).to eq [] }
    end
  end
end
