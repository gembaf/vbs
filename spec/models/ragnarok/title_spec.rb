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

    let(:title) { Ragnarok::Title.first }
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
      expect(title.name).to eq '激情の'
    end

    it 'Ragnarok::Skillモデルが１つできること' do
      expect(title.title_skill.name).to eq '致命必殺'
      expect(title.title_skill.point).to eq 10
    end
  end

  xcontext '.best_title_skill' do
    include_context 'all'

    subject do
      described_class.best_title_skill(
        skill_name: skill_name,
        reality_range: reality_range,
        prefix: prefix,
        suffix: suffix,
      )
    end

    let(:reality_range) { 1..8 }
    let(:suffix) { false }

    before do
      skills.each do |skill|
        medallions.each.with_index(1).each do |medallion, i|
          title = create(:ragnarok_title, medallion: medallion, prefix: true)
          create(:ragnarok_title_skill, title: title, skill: skill, point: i * 10)
        end
      end
    end

    context 'prefixがtrueの場合' do
      let(:skill_name) { '大雷撃陣' }
      let(:prefix) { true }

      it '最もスキル値の高いTitleSkillが選択されること' do
        expect(subject).to eq Ragnarok::TitleSkill.last.id
      end
    end

    context 'suffixがtrueの場合' do
      let(:skill_name) { '大雷撃陣' }
      let(:prefix) { false }
      let(:suffix) { true }

      it 'nilが返ってくること' do
        expect(subject).to eq nil
      end
    end

    context 'reality_rangeが指定された場合' do
      let(:skill_name) { '大雷撃陣' }
      let(:prefix) { true }
      let(:reality_range) { 1..4 }

      it 'reality_rangeの範囲でスキル値の高いTitleSkillが選択されること' do
        expect(subject).to eq Ragnarok::TitleSkill.all[6].id
      end
    end
  end
end

