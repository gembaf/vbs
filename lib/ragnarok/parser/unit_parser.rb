module Ragnarok
  module Parser
    class UnitParser < BaseParser
      def initialize(doc)
        @doc = doc
      end

      def parse
        tds = @doc.xpath('td')
        elem = tds.map(&:text)

        equipments = tds[11].inner_html.split(/<br.*?>/)

        passive_skills = skills(tds[15])
        passive_skills += skills(tds[16]) if tds[16].text.present?
        leader_skills = skills(tds[17])

        {
          name: elem[0],
          type: elem[1],
          protection: elem[2],
          profession: elem[3],
          hp: elem[4].to_i,
          attack: elem[5].to_i,
          defense: elem[6].to_i,
          speed: elem[7].to_i,
          intelligence: elem[8].to_i,
          tribe: elem[9],
          specialty: elem[10],
          equipments: equipments.join(','),
          rank: elem[12],
          cost: elem[13].to_i,
          passive_skills: passive_skills,
          leader_skills: leader_skills,
        }
      end

      def skills(td)
        skills = td.inner_html.sub(/<!--autolink-->.*?>/, '').sub(%r{</a>.*?>}, '').split(/<br.*?>/)
        skills.map { |s| parse_skill(s) }
      end

      def parse_skill(data)
        name, point = data.split('[')
        point&.delete(']')
        { name: name, point: point.to_i }
      end
    end
  end
end

