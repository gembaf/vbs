describe Ragnarok::Tasks::DataImportTask do
  context '.import_medallion' do
    subject { described_class.import_medallion }

    it 'データが登録されていること' do
      subject

      expect(Ragnarok::Medallion.first.short_name).to eq '力'
      expect(Ragnarok::Medallion.last.short_name).to eq '極'

      expect(Ragnarok::Title.first.name).to eq '力の'
      expect(Ragnarok::Title.last.name).to eq '星砕きの'

      medallion = Ragnarok::Medallion.last

      expect(medallion.titles.first.name).to eq '極夜の'
    end
  end

  context '.import_item' do
    subject { described_class.import_item }

    it 'データが登録されていること' do
      subject

      expect(Ragnarok::Item.first.name).to eq 'カッパーナイフ'
      expect(Ragnarok::Item.last.name).to eq '極竜の心臓'

      skill = Ragnarok::Item.first.item_skills.first

      expect(skill.name).to eq '致命必殺'
      expect(skill.point).to eq 5
    end
  end

  context '.import_unit' do
    subject { described_class.import_unit }

    it 'データが登録されていること' do
      subject

      expect(Ragnarok::Unit.first.name).to eq 'ゴブリン'
      expect(Ragnarok::Unit.last.name).to eq '天帝梵阿'

      passive_skill = Ragnarok::Unit.first.passive_skills.first
      expect(passive_skill.name).to eq '多段攻撃'
      expect(passive_skill.point).to eq 1

      leader_skill = Ragnarok::Unit.first.leader_skills.first
      expect(leader_skill.name).to eq '必殺増加'
      expect(leader_skill.point).to eq 20
    end
  end
end

