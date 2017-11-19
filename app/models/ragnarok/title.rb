module Ragnarok
  class Title < ApplicationRecord
    has_one :skill

    def self.create_with_skill(params)
      skill_name = params.delete(:skill_name)
      skill_point = params.delete(:skill_point)

      create(params).tap do |title|
        Skill.create_with_valid(name: skill_name, point: skill_point, title_id: title.id)
      end
    end
  end
end

