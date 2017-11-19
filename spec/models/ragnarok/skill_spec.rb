describe Ragnarok::Skill do
  context '#find_or_create' do
    subject { described_class.find_or_create(name: name, point: point) }

    before { subject }

    context 'nameとpointを与えた場合' do
      let(:name) { '致命必殺' }
      let(:point) { 10 }

      it 'Ragnarok::Skillが１つ存在する' do
        expect(Ragnarok::Skill.count).to eq 1
        expect(Ragnarok::Skill.first.name).to eq '致命必殺'
        expect(Ragnarok::Skill.first.point).to eq 10
      end
    end

    context 'nameだけ与えた場合' do
      let(:name) { '専守防衛' }
      let(:point) { 0 }

      it 'Ragnarok::Skillが１つ存在する' do
        expect(Ragnarok::Skill.count).to eq 1
        expect(Ragnarok::Skill.first.name).to eq '専守防衛'
        expect(Ragnarok::Skill.first.point).to eq nil
      end
    end

    context '両方空の場合' do
      let(:name) { '' }
      let(:point) { 0 }

      it 'Ragnarok::Skill.newが返却される' do
        expect(subject.id).to eq nil
      end
    end

    context '既に存在する値を渡された場合' do
      let(:name) { '致命必殺' }
      let(:point) { 10 }

      it 'Ragnarok::Skillが増えない' do
        expect(Ragnarok::Skill.count).to eq 1
        subject
        subject
        subject
        expect(Ragnarok::Skill.count).to eq 1
      end
    end
  end
end

