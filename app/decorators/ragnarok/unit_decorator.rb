module Ragnarok
  module UnitDecorator
    def item_text
      item1 + '<br />' + item2
    end

    def passive_skill_texts
      passive_skills.map { |s| skill_text(s) }.join('<br />')
    end

    def leader_skill_texts
      leader_skills.map { |s| skill_text(s) }.join('<br />')
    end

    def skill_text(skill)
      return '' if skill.blank?
      skill.point.zero? ? skill.name.to_s : "#{skill.name} : #{skill.point}"
    end
  end
end

