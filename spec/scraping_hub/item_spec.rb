require 'spec_helper'

RSpec.describe ScrapingHub::Item do
  describe '.search' do
    context 'when the stub property is true' do
      before { allow(ScrapingHub).to receive(:stub) { true } }

      it { expect(described_class.search('job_id')).to eq [] }
    end
  end

  describe '.find_each' do
    let(:job) { double 'job', key: 'my-job-key' }
    let(:item1) { double }
    let(:item2) { double }

    before do
      allow(ScrapingHub::Job).to receive(:search) { [job] }
      allow(described_class).to receive(:search).with(job.key) { [item1, item2] }
    end

    it 'verify search items by job' do
      expect { |b| described_class.find_each(&b) }.to yield_successive_args(item1, item2)
    end
  end
end
