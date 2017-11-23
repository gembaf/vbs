module Ragnarok
  class Unit < ApplicationRecord
    has_many :passive_skills
    # has_many :skills, through: :passive_skills

    def self.create_with_skill(params)
      passive_skills = params.delete(:passive_skills)
      leader_skills = params.delete(:leader_skills)

      create!(params).tap do |unit|
        passive_skills.each do |param|
          next if param[:name].blank?
          skill = Skill.find_or_create!(name: param[:name])
          PassiveSkill.create!(point: param[:point], unit: unit, skill: skill)
        end

        # leader_skills.each do |param|
        #   next if param[:name].blank?
        #   skill = Skill.find_or_create!(name: param[:name])
        #   LeaderSkill.create!(point: param[:point], unit: unit, skill: skill)
        # end
      end
    end
  end
end

