module Ragnarok
  module ItemDecorator
    include SkillDecorator

    def skill_texts
      item_skills.map { |s| skill_text(s) }.join('<br />')
    end
  end
end

