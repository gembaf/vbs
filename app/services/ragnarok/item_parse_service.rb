module Ragnarok
  class ItemParseService
    PATH = Rails.root.join('lib/assets/ragnarok/item_original.html')

    def initialize
      @original_data = Ragnarok::Parser.nokogiri(PATH)
    end

    def call
      types.zip(item_tables)
    end

    def types
      data = @original_data.xpath('//h3')[0...-1] # 最後を除外
      @types ||= data.map { |d| d.text.split.first }
    end

    def item_tables
      # 最後を除外
      data = @original_data.xpath('//div[@id="body"]/*/table[@class="style_table"]')[0...-1]
      @item_tables ||= data.map do |table|
        table.xpath('tbody/tr')[2..-1].map do |row|
          Ragnarok::Parser::ItemParser.new(row).parse
        end
      end
    end
  end
end

