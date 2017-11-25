describe Ragnarok::Medallion do
  context '.reality_range' do
    context '上限突破フラグがfalseの場合' do
      let(:through_limit) { false }

      it '正しい範囲が返ってくること' do
        expect(described_class.reality_range('S', through_limit)).to eq 1..6
        expect(described_class.reality_range('A', through_limit)).to eq 1..5
        expect(described_class.reality_range('B', through_limit)).to eq 1..4
        expect(described_class.reality_range('C', through_limit)).to eq 1..3
        expect(described_class.reality_range('D', through_limit)).to eq 1..2
        expect(described_class.reality_range('E', through_limit)).to eq 1..1
      end
    end

    context '上限突破フラグがtrueの場合' do
      let(:through_limit) { true }

      it '正しい範囲が返ってくること' do
        expect(described_class.reality_range('S', through_limit)).to eq 1..8
        expect(described_class.reality_range('A', through_limit)).to eq 1..6
        expect(described_class.reality_range('B', through_limit)).to eq 1..5
        expect(described_class.reality_range('C', through_limit)).to eq 1..4
        expect(described_class.reality_range('D', through_limit)).to eq 1..3
        expect(described_class.reality_range('E', through_limit)).to eq 1..2
      end
    end
  end
end

