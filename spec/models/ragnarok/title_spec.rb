describe Ragnarok::Title do
  context '.create_with_skill' do
    subject { described_class.create_with_skill(params) }

    let(:params) do
      {
        name: '激情の',
        skill_name: '致命必殺',
        skill_point: 10,
      }
    end

    before { subject }

    it 'Ragnarok::Titleモデルが１つできること' do
      expect(Ragnarok::Title.count).to eq 1
      expect(Ragnarok::Title.first.name).to eq '激情の'
    end

    it 'Ragnarok::Skillモデルが１つできること' do
      expect(Ragnarok::Skill.count).to eq 1
      expect(Ragnarok::Skill.first.name).to eq '致命必殺'
      expect(Ragnarok::Skill.first.point).to eq 10
    end
  end
end

