module Ragnarok
  module Parser
    class TitleParser < BaseParser
      def initialize(doc)
        @doc = doc
      end

      def parse
        elem = @doc.xpath('//td').map(&:text)
        skill_name, skill_point = elem[9].split(':')

        {
          name: elem[0],
          prefix: elem[1].present?,
          suffix: elem[2].present?,
          attack: elem[3].to_i,
          defense: elem[4].to_i,
          speed: elem[5].to_i,
          intelligence: elem[6].to_i,
          specialty: elem[7],
          protection: elem[8],
          skill_name: skill_name,
          skill_point: skill_point.to_i,
        }
      end
    end
  end
end

