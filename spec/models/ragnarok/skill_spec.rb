describe Ragnarok::Skill do
  context '.create_with_valid' do
    subject { described_class.create_with_valid(name: name) }

    before { subject }

    context 'nameが存在する場合' do
      let(:name) { '専守防衛' }

      it 'Ragnarok::Skillが1つ作成される' do
        expect(described_class.count).to eq 1
        expect(described_class.first.name).to eq name
      end
    end

    context 'nameが存在しない場合' do
      let(:name) { '' }

      it 'Ragnarok::Skillが作成されない' do
        expect(described_class.count).to eq 0
      end
    end
  end
end

