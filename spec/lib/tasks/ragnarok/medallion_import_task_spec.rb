require 'rails_helper'

describe Tasks::Ragnarok::MedallionImportTask do
  let(:instance) { described_class.new }
  let(:data) { Ragnarok::MedallionParseService.new.call }

  context '#import_medallion' do
    subject { instance.import_medallion(medallion) }
    let(:medallion) { data.first.first }

    it 'Ragnarok::Medallionモデルが１つできること' do
      subject
      expect(Ragnarok::Medallion.count).to eq 1
      expect(Ragnarok::Medallion.first.short_name).to eq '力'
    end
  end

  context '#import_titles' do
    subject { instance.import_title(title) }
    let(:title) { data.first.last[1] }

    before { subject }

    it 'Ragnarok::Titleモデルが１つできること' do
      expect(Ragnarok::Title.count).to eq 1
      expect(Ragnarok::Title.first.name).to eq '激情の'
    end

    it 'Ragnarok::Skillモデルが１つできること' do
      expect(Ragnarok::Skill.count).to eq 1
      expect(Ragnarok::Skill.first.name).to eq '致命必殺'
    end
  end
end

