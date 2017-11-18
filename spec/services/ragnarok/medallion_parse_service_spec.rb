describe Ragnarok::MedallionParseService do
  context '#medallions' do
    subject { described_class.new.medallions }

    it '数が合っていること' do
      expect(subject.count).to eq 40
    end

    it '最初が合っていること' do
      expect(subject.first[:short_name]).to eq '力'
    end

    it '最後が合っていること' do
      expect(subject.last[:short_name]).to eq '極'
    end
  end

  context '#title_tables' do
    subject { described_class.new.title_tables }

    it '数が合っていること' do
      expect(subject.count).to eq 40
    end

    it '最初が合っていること' do
      title_table = subject.first
      expect(title_table.first[:name]).to eq '力の'
    end

    it '最後が合っていること' do
      title_table = subject.last
      expect(title_table.last[:name]).to eq '星砕きの'
    end
  end
end

