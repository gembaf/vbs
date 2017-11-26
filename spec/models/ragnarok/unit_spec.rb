describe Ragnarok::Unit do
  context '.where_like' do
    subject { described_class.where_like('tribe', name) }

    before do
      create(:ragnarok_unit, tribe: '男魔獣人')
      create(:ragnarok_unit, tribe: '女魔夜神')
      create(:ragnarok_unit, tribe: '雷人神魔')
      create(:ragnarok_unit, tribe: '氷器')
    end

    context '「魔」を指定した場合' do
      let(:name) { '魔' }

      it 'Unitが3つ返ってくること' do
        expect(subject.count).to eq 3
      end
    end

    context '「魔神」を指定した場合' do
      let(:name) { '魔神' }

      it 'Unitが2つ返ってくること' do
        expect(subject.count).to eq 2
      end
    end

    context '「魔獣男」を指定した場合' do
      let(:name) { '魔獣男' }

      it 'Unitが1つ返ってくること' do
        expect(subject.count).to eq 1
      end
    end
  end
end

