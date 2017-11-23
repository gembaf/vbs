# == Schema Information
#
# Table name: ragnarok_items
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  type         :string(255)      not null
#  rare         :integer          not null
#  attack       :integer          default(0), not null
#  defense      :integer          default(0), not null
#  speed        :integer          default(0), not null
#  intelligence :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

module Ragnarok
  class Item < ApplicationRecord
    has_many :item_skills
    has_many :skills, through: :item_skills

    scope :includes_all, -> { includes(item_skills: :skill) }

    def self.create_with_skill(params)
      skills = params.delete(:skills)

      create!(params).tap do |item|
        skills.each do |param|
          next if param[:skill_name].blank?
          skill = Skill.find_or_create!(name: param[:skill_name])
          ItemSkill.create!(point: param[:skill_point], item: item, skill: skill)
        end
      end
    end
  end
end

