require 'spec_helper'

RSpec.describe ScrapingHub::Job do
  describe '.search' do
    context 'when the stub property is true' do
      before { allow(ScrapingHub).to receive(:stub) { true } }

      it { expect(described_class.search).to eq [] }
    end
  end
end
