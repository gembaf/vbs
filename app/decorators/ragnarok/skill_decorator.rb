module Ragnarok
  module SkillDecorator
    def skill_text(skill)
      return '' if skill.blank?
      skill.point.zero? ? skill.name.to_s : "#{skill.name} : #{skill.point}"
    end
  end
end

