require 'spec_helper'

RSpec.describe ScrapingHub::Setup do
  subject(:setup) { described_class }

  describe '.base_url' do
    context 'when the base_url is set' do
      it 'verify base_url default and new value' do
        expect(setup.base_url).to eq 'https://storage.scrapinghub.com/'
        setup.base_url = 'http://test.com'
        expect(setup.base_url).to eq 'http://test.com'
      end
    end
  end

  describe '.stub' do
    it 'verify stub new value' do
      expect(setup.stub?).to be false
      setup.stub = true
      expect(setup.stub?).to eq true
    end
  end

  describe '.key' do
    it 'verify key new value' do
      expect(setup.key).to be nil
      setup.key = 'value'
      expect(setup.key).to eq 'value'
    end
  end

  describe '.project_id' do
    it 'verify project_id new value' do
      expect(setup.project_id).to be nil
      setup.project_id = 'value'
      expect(setup.project_id).to eq 'value'
    end
  end

  describe '.open_timeout' do
    it 'verify open_timeout new value' do
      expect(setup.open_timeout).to eq 1
      setup.open_timeout = 5
      expect(setup.open_timeout).to eq 5
    end
  end

  describe '.read_timeout' do
    it 'verify read_timeout new value' do
      expect(setup.read_timeout).to eq 1
      setup.read_timeout = 5
      expect(setup.read_timeout).to eq 5
    end
  end
end
