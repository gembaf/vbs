module Ragnarok
  class UnitParseService
    PATH = Rails.root.join('lib/assets/ragnarok/unit_original.html')

    def initialize
      @original_data = Ragnarok::Parser.nokogiri(PATH)
    end

    def call
      unit_tables
    end

    def unit_tables
      # 最後を除外
      data = @original_data.xpath('//div[@id="body"]/*/table[@class="style_table"]')[0...-1]
      @unit_tables ||= data.map do |table|
        table.xpath('tbody/tr').map do |row|
          Ragnarok::Parser::UnitParser.new(row).parse
        end
      end.flatten
    end
  end
end

