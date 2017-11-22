module Ragnarok
  module Parser
    class ItemParser < BaseParser
      def initialize(doc)
        @doc = doc
      end

      def parse
        tds = @doc.xpath('td')
        elem = tds.map(&:text)

        {
          rare: elem[0].to_i,
          name: elem[1],
          attack: elem[4].to_i,
          defense: elem[5].to_i,
          speed: elem[6].to_i,
          intelligence: elem[7].to_i,
          skills: skills(tds[8]),
        }
      end

      def skills(td)
        skills = []
        skills << parse_skill(td.children[0].text)
        skills << parse_skill(td.children[2].text) if td.children[2]
      end

      def parse_skill(data)
        name, point = data.split(/:/)
        { skill_name: name, skill_point: point.to_i }
      end
    end
  end
end

