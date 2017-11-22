describe Ragnarok::ItemParseService do
  let(:instance) { described_class.new }

  context '#call' do
    subject { instance.call }

    before do
      allow(instance).to receive(:types).and_return(Array.new(11))
      allow(instance).to receive(:item_tables).and_return(Array.new(11).map { Array.new(42) })
    end

    it '数が合っていること' do
      _types, items = subject.first

      expect(subject.count).to eq 11
      expect(items.count).to eq 42
    end
  end

  context '#types' do
    subject { instance.types }

    it '数が合っていること' do
      expect(subject.count).to eq 11
    end

    it '最初が合っていること' do
      expect(subject.first).to eq '片手'
    end

    it '最後が合っていること' do
      expect(subject.last).to eq '道具'
    end
  end

  context '#item_tables' do
    subject { instance.item_tables }

    it '数が合っていること' do
      expect(subject.count).to eq 11
    end

    it '最初が合っていること' do
      item_table = subject.first
      expect(item_table.first[:name]).to eq 'カッパーナイフ'
    end

    it '最後が合っていること' do
      item_table = subject.last
      expect(item_table.last[:name]).to eq '極竜の心臓'
    end
  end
end

