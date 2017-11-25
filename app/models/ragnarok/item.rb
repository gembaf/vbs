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

    def self.best_item_skill(item_type:, skill_name:, limit_rank:)
      skill = Ragnarok::Skill.find_by(name: skill_name)
      return nil if skill.nil?

      item_skills = includes(item_skills: :skill)
                      .where(ragnarok_item_skills: { skill_id: skill.id })
                      .where(type: item_type, rare: 1..limit_rank)
      return nil if item_skills.blank?

      hash = item_skills.group(:id).maximum(:point)
      value = hash.values.max
      hash.key(value)
    end

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

