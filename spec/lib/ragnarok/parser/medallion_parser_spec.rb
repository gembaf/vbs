describe Ragnarok::Parser::MedallionParser do
  let(:doc) { Nokogiri::HTML.parse(html, nil, 'utf-8').xpath('//h2').first }
  let(:html) { File.read(Rails.root.join('spec/fixtures/medallion.html')) }

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

  context '#reality' do
    subject { described_class.new(doc).reality(text) }

    let(:text) { 'レアリティー:1' }

    it '正常にパースできること' do
      expect(subject).to eq 1
    end
  end

  context '#resource' do
    subject { described_class.new(doc).resource(text) }

    let(:text) { '必要生成資源:250' }

    it '正常にパースできること' do
      expect(subject).to eq 250
    end
  end

  context '#cost' do
    subject { described_class.new(doc).cost(text) }

    let(:text) { '称号付与武勲:3' }

    it '正常にパースできること' do
      expect(subject).to eq 3
    end
  end
end

