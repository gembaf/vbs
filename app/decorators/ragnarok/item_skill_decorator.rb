module Ragnarok
  module ItemSkillDecorator
    include SkillDecorator

    def rich_skill_text
      skill_text(self)
    end
  end
end

