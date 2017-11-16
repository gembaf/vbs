module Ragnarok
  module Parser
    class MedallionParser < BaseParser
      def initialize(doc)
        @text = doc.text
      end

      # @text => 【力】 力のメダリオン　レアリティー:1 / 必要生成資源:250 / 称号付与武勲:3  †
      def parse
        elem = @text.split.map { |t| t.split(/　/) }.flatten

        {
          short_name: short_name(elem[0]),
          name: elem[1],
          reality: split_colon(elem[2]),
          resource: split_colon(elem[4]),
          cost: split_colon(elem[6]),
        }
      end

      def short_name(text)
        text[/【(.*?)】/, 1]
      end
    end
  end
end
