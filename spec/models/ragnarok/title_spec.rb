# == Schema Information
#
# Table name: ragnarok_titles
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  prefix       :boolean          default(FALSE), not null
#  suffix       :boolean          default(FALSE), not null
#  attack       :integer          default(0), not null
#  defense      :integer          default(0), not null
#  speed        :integer          default(0), not null
#  intelligence :integer          default(0), not null
#  specialty    :string(255)      default(""), not null
#  protection   :string(255)      default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  medallion_id :integer          not null
#

describe Ragnarok::Title do
  context '.create_with_skill' do
    subject { described_class.create_with_skill(params) }

    let(:medallion) { create(:ragnarok_medallion) }
    let(:params) do
      {
        name: '激情の',
        skill_name: '致命必殺',
        skill_point: 10,
        medallion_id: medallion.id,
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

