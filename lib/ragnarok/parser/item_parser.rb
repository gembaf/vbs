module Ragnarok
  module Parser
    class ItemParser < BaseParser
      def initialize(doc)
        @doc = doc
      end

      def parse
        tds = @doc.xpath('td')
        elem = tds.map(&:text)
        skills = []
        skills << parse_skill(tds[8].children[0].text)
        skills << parse_skill(tds[8].children[2].text) if tds[8].children[2]

        {
          rare: elem[0].to_i,
          name: elem[1],
          skills: skills,
        }
      end

      def parse_skill(data)
        name, point = data.split(/:/)
        { skill_name: name, skill_point: point.to_i }
      end
    end
  end
end

