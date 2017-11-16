describe Ragnarok::Parser::MedallionParser do
  let(:doc) { Ragnarok::Parser::BaseParser.nokogiri(path).xpath('//h2').first }
  let(:path) { Rails.root.join('spec/fixtures/medallion.html') }

  context '#parse' do
    subject { described_class.new(doc).parse }

    let(:result) do
      {
        short_name: '力',
        name: '力のメダリオン',
        reality: 1,
        resource: 250,
        cost: 3,
      }
    end

    it '正常にパースできること' do
      expect(subject).to eq result
    end
  end

  context '#short_name' do
    subject { described_class.new(doc).short_name(text) }

    let(:text) { '【力】' }

    it '正常にパースできること' do
      expect(subject).to eq '力'
    end
  end
end

