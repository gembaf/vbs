# == Schema Information
#
# Table name: ragnarok_skills
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

describe Ragnarok::Skill do
  context '.find_or_create!' do
    subject { described_class.find_or_create!(name: name) }
    let(:name) { '致命必殺' }

    before { subject }

    context '存在しないSkillの場合' do
      it 'Ragnarok::Skillが1つ作成される' do
        expect(described_class.count).to eq 1
        expect(described_class.first.name).to eq name
      end
    end

    context '既に存在するSkillの場合' do
      it 'Ragnarok::Skillが作成されない' do
        expect(described_class.count).to eq 1
        described_class.find_or_create!(name: name)
        expect(described_class.count).to eq 1
      end
    end
  end
end

