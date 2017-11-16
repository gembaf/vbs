describe Ragnarok::Parser::MedallionParser do
  subject { described_class.new(doc).parse }

  let(:doc) { Nokogiri::HTML.parse(html, nil, 'utf-8') }
  let(:html) { File.read(Rails.root.join('spec/fixtures/medallion.html')) }
  let(:result) do
    {
    }
  end

  it '正常にパースできること' do
    expect(subject).to eq result
  end
end

