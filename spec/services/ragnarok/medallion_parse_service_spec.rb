describe Ragnarok::MedallionParseService do
  let(:instance) { described_class.new }

  context '#call' do
    subject { instance.call }

    before do
      allow(instance).to receive(:medallions).and_return(Array.new(40))
      allow(instance).to receive(:title_tables).and_return(Array.new(40).map { Array.new(10) })
    end

    it '数が合っていること' do
      _medallion, titles = subject.first

      expect(subject.count).to eq 40
      expect(titles.count).to eq 10
    end
  end

  context '#medallions' do
    subject { instance.medallions }

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
    subject { instance.title_tables }

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

