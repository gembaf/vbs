describe Ragnarok::Parser::UnitParser do
  context '#parse' do
    subject { described_class.new(doc).parse }

    let(:doc) { Ragnarok::Parser.nokogiri(path).xpath('//tr').first }

    context 'リンクがないskillの場合' do
      let(:path) { Rails.root.join('spec/fixtures/unit.html') }
      let(:result) do
        {
          name: 'ハーピー',
          type: '亜人',
          protection: '風',
          profession: 'ブレイダー',
          hp: 85,
          attack: 6,
          defense: 4,
          speed: 12,
          intelligence: 2,
          tribe: '女魔獣飛',
          specialty: '人',
          equipments: '爪,獣装',
          rank: 'S',
          cost: 1,
          passive_skills: [
            { name: '必殺増加', point: 20 },
            { name: '奇襲戦法', point: 10 },
            { name: '専守防衛', point: 0 },
            { name: 'イベイド', point: 30 },
            { name: '側面攻撃', point: 5 },
          ],
          leader_skills: [
            { name: 'イベイド', point: 20 },
            { name: '奇襲戦法', point: 10 },
          ],
        }
      end

      it '正常にパースできること' do
        expect(subject).to eq result
      end
    end

    context 'リンクがあるskillの場合' do
      let(:path) { Rails.root.join('spec/fixtures/unit_link.html') }
      let(:result) do
        {
          name: 'ゴブリン',
          type: '亜人',
          protection: '火',
          profession: 'ブレイダー',
          hp: 75,
          attack: 2,
          defense: 3,
          speed: 4,
          intelligence: 2,
          tribe: '男魔獣',
          specialty: '樹',
          equipments: '片手,鎧',
          rank: 'S',
          cost: 1,
          passive_skills: [
            { name: '多段攻撃', point: 1 },
            { name: 'トレハン', point: 5 },
            { name: '撃破金運', point: 1 },
            { name: 'イベイド', point: 5 },
          ],
          leader_skills: [
            { name: '必殺増加', point: 20 },
            { name: '撃破金運', point: 2 },
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
      let(:data) { '致命必殺[50]' }
      let(:result) do
        {
          name: '致命必殺',
          point: 50,
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
          name: '専守防衛',
          point: 0,
        }
      end

      it '正常にパースできること' do
        expect(subject).to eq result
      end
    end
  end
end

