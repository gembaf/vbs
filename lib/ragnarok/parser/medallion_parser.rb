module Ragnarok
  module Parser
    class MedallionParser
      def initialize(doc)
        @text = doc.text
      end

      # @text => 【力】 力のメダリオン　レアリティー:1 / 必要生成資源:250 / 称号付与武勲:3  †
      def parse
        elem = @text.split.map { |t| t.split(/　/) }.flatten

        {
          short_name: short_name(elem[0]),
          name: elem[1],
          reality: reality(elem[2]),
          resource: resource(elem[4]),
          cost: cost(elem[6]),
        }
      end

      def short_name(text)
        text[/【(.*?)】/, 1]
      end

      def reality(text)
        text.split(/:/).last.to_i
      end

      def resource(text)
        text.split(/:/).last.to_i
      end

      def cost(text)
        text.split(/:/).last.to_i
      end
    end
  end
end
