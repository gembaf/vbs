describe Ragnarok::UnitParseService do
  let(:instance) { described_class.new }

  context '#call' do
    subject { instance.call }

    it '数が合っていること' do
      expect(subject.count).to eq 544
    end

    it '最初が合っていること' do
      expect(subject.first[:name]).to eq 'ゴブリン'
    end

    it '最後が合っていること' do
      expect(subject.last[:name]).to eq '天帝梵阿'
    end
  end
end

