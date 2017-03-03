describe Translator::Degraeve do
  let(:dialect) { 'Yoda' }
  let(:message) { 'Test message for rspec' }
  let(:degraeve) { described_class.new(message, dialect) }

  describe 'translate!' do
    subject { degraeve.translate! }
    it { is_expected.to be_instance_of String }
  end

  describe 'url' do
    subject { degraeve.url }
    it { is_expected.to be_instance_of String }
    it { is_expected.to match 'http://www.degraeve.com/cgi-bin/babel.cgi?d=yoda&w=Test+message+for+rspec' }
  end

  describe '#query_hash' do
    subject { degraeve.query_hash }
    it { is_expected.to be_instance_of Hash }
    it { is_expected.to have_key(:w) }
    it { is_expected.to have_key(:d) }
    its([:w]) { is_expected.to eq 'Test message for rspec' }
    its([:d]) { is_expected.to eq 'yoda' }
  end

  describe '#dialects' do
    subject { degraeve.dialects }
    it { is_expected.to be_instance_of HashWithIndifferentAccess }
    its([:Yoda]) { is_expected.to eq 'yoda' }
    its(['Yoda']) { is_expected.to eq 'yoda' }
    its([:'Valley Girl']) { is_expected.to eq 'valley' }
    its(['Valley Girl']) { is_expected.to eq 'valley' }
    its([:'Binary Code']) { is_expected.to eq 'binary' }
    its(['Binary Code']) { is_expected.to eq 'binary' }
  end

  describe 'api_call' do
    before do
      allow(degraeve).to receive(:open).and_return('<h1>test string</h1>')
    end
    subject { degraeve.api_call }
    it { is_expected.to be_instance_of Nokogiri::HTML::Document }
    its(:text) { is_expected.to match 'test string' }
  end
end
