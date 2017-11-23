describe Ragnarok::Parser::ItemParser do
  context '#parse' do
    subject { described_class.new(doc).parse }

    let(:doc) { Ragnarok::Parser.nokogiri(path).xpath('//tr').first }

    context 'skillが1つの場合' do
      let(:path) { Rails.root.join('spec/fixtures/item.html') }
      let(:result) do
        {
          name: 'カッパーナイフ',
          rare: 1,
          attack: 2,
          defense: 0,
          speed: 2,
          intelligence: 0,
          skills: [{ skill_name: '致命必殺', skill_point: 5 }],
        }
      end

      it '正常にパースできること' do
        expect(subject).to eq result
      end
    end

    context 'skillが2つの場合' do
      let(:path) { Rails.root.join('spec/fixtures/item_skills.html') }
      let(:result) do
        {
          name: 'ブラッドソード',
          rare: 6,
          attack: 16,
          defense: 4,
          speed: 0,
          intelligence: 0,
          skills: [
            { skill_name: '呪の一撃', skill_point: 0 },
            { skill_name: '吸血攻撃', skill_point: 5 },
          ],
        }
      end

      it '正常にパースできること' do
        expect(subject).to eq result
      end
    end

    context 'link付きの場合' do
      let(:path) { Rails.root.join('spec/fixtures/item_link.html') }
      let(:result) do
        {
          name: 'グングニル・ミニ',
          rare: 11,
          attack: 20,
          defense: 20,
          speed: 20,
          intelligence: 0,
          skills: [
            { skill_name: 'トレハン', skill_point: 14 },
            { skill_name: '神族活性', skill_point: 25 },
          ],
        }
      end

      it '正常にパースできること' do
        expect(subject).to eq result
      end
    end
  end

  context '#parse_skill' do
    subject { described_class.new(nil).parse_skill(data) }

    context 'skill_nameとskill_pointがある場合' do
      let(:data) { '致命必殺:50' }
      let(:result) do
        {
          skill_name: '致命必殺',
          skill_point: 50,
        }
      end

      it '正常にパースできること' do
        expect(subject).to eq result
      end
    end

    context 'skill_nameしかない場合' do
      let(:data) { '専守防衛' }
      let(:result) do
        {
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

