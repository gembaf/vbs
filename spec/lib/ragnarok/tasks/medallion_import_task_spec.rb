describe Ragnarok::Tasks::MedallionImportTask do
  context '.execute' do
    subject { described_class.execute }

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
end

