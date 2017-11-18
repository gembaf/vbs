module Ragnarok
  class MedallionParseService
    PATH = Rails.root.join('lib/assets/ragnarok/medallion_original.html')

    def initialize
      @original_data = Ragnarok::Parser.nokogiri(PATH)
    end

    def call
    end

    def medallions
      data = @original_data.xpath('//h2')[0...-1] # 最後を除外
      @medallions ||= data.map do |d|
        Ragnarok::Parser::MedallionParser.new(d).parse
      end
    end

    def title_tables
      # 最初を除外
      data = @original_data.xpath('//div[@id="body"]/*/table[@class="style_table"]')[1..-1]
      @title_tables ||= data.map do |table|
        table.xpath('tbody/tr').map do |row|
          Ragnarok::Parser::TitleParser.new(row).parse
        end
      end
    end
  end
end

