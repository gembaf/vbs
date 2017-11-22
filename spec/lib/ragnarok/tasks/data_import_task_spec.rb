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
    end
  end
end

