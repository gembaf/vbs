describe Ragnarok::Parser::TitleParser do
  context '#parse' do
    subject { described_class.new(doc).parse }

    let(:doc) { Ragnarok::Parser.nokogiri(path).xpath('//tr').first }

    context '大体埋まっている場合' do
      let(:path) { Rails.root.join('spec/fixtures/title_full.html') }
      let(:result) do
        {
          name: '力の',
          prefix: true,
          suffix: true,
          attack: 15,
          defense: -10,
          speed: 3,
          intelligence: 2,
          specialty: '氷',
          protection: '闇',
          skill_name: '魔術放射',
          skill_point: 3,
        }
      end

      it '正常にパースできること' do
        expect(subject).to eq result
      end
    end

    context '空白がある場合' do
      let(:path) { Rails.root.join('spec/fixtures/title_empty.html') }
      let(:result) do
        {
          name: '力の',
          prefix: false,
          suffix: false,
          attack: 0,
          defense: 0,
          speed: 0,
          intelligence: 0,
          specialty: '',
          protection: '',
          skill_name: '専守防衛',
          skill_point: 0,
        }
      end

      it '正常にパースできること' do
        expect(subject).to eq result
      end
    end
  end
end

