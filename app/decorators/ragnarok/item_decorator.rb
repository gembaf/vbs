module Ragnarok
  module ItemDecorator
    def skill_texts
      item_skills.map { |s| skill_text(s) }.join('<br />')
    end

    def skill_text(skill)
      return '' if skill.blank?
      skill.point.zero? ? skill.name.to_s : "#{skill.name} : #{skill.point}"
    end
  end
end

