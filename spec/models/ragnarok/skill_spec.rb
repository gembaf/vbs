# == Schema Information
#
# Table name: ragnarok_skills
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  point      :integer
#  title_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

describe Ragnarok::Skill do
  context '.create_with_valid' do
    subject { described_class.create_with_valid(name: name) }

    before { subject }

    context 'nameが存在する場合' do
      let(:name) { '専守防衛' }

      it 'Ragnarok::Skillが1つ作成される' do
        expect(described_class.count).to eq 1
        expect(described_class.first.name).to eq name
      end
    end

    context 'nameが存在しない場合' do
      let(:name) { '' }

      it 'Ragnarok::Skillが作成されない' do
        expect(described_class.count).to eq 0
      end
    end
  end
end

