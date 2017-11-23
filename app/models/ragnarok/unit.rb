module Ragnarok
  class Unit < ApplicationRecord
    def self.create_with_skill(params)
      passive_skills = params.delete(:passive_skills)
      leader_skills = params.delete(:leader_skills)

      create!(params).tap do |unit|
        # skills.each do |param|
        #   next if param[:skill_name].blank?
        #   skill = Skill.find_or_create!(name: param[:skill_name])
        #   ItemSkill.create!(point: param[:skill_point], item: item, skill: skill)
        # end
      end
    end
  end
end

