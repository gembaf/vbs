describe Ragnarok::Parser::BaseParser do
  context '#split_colon' do
    subject { described_class.new.split_colon(text) }

    context 'レアリティー:2' do
      let(:text) { 'レアリティー:2' }

      it '正常にパースできること' do
        expect(subject).to eq 2
      end
    end

    context '必要生成資源:250' do
      let(:text) { '必要生成資源:250' }

      it '正常にパースできること' do
        expect(subject).to eq 250
      end
    end

    context '称号付与武勲:3' do
      let(:text) { '称号付与武勲:3' }

      it '正常にパースできること' do
        expect(subject).to eq 3
      end
    end
  end
end

