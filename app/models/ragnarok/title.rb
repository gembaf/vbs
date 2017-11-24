# == Schema Information
#
# Table name: ragnarok_titles
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  prefix       :boolean          default(FALSE), not null
#  suffix       :boolean          default(FALSE), not null
#  attack       :integer          default(0), not null
#  defense      :integer          default(0), not null
#  speed        :integer          default(0), not null
#  intelligence :integer          default(0), not null
#  specialty    :string(255)      default(""), not null
#  protection   :string(255)      default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  medallion_id :integer          not null
#

module Ragnarok
  class Title < ApplicationRecord
    has_one :title_skill
    has_one :skill, through: :title_skill
    belongs_to :medallion

    def self.create_with_skill(params)
      skill_name = params.delete(:skill_name)
      skill_point = params.delete(:skill_point)

      create!(params).tap do |title|
        next if skill_name.blank?
        skill = Skill.find_or_create!(name: skill_name)
        TitleSkill.create!(point: skill_point, title: title, skill: skill)
      end
    end

    def self.best_title_skills(skill_name:)
      [
        best_title_skill(skill_name: skill_name, prefix: true),
        best_title_skill(skill_name: skill_name, suffix: true),
      ]
    end

    def self.best_title_skill(skill_name:, prefix: false, suffix: false)
      skill = Ragnarok::Skill.find_by(name: skill_name)

      title_skills = includes(title_skill: :skill)
                       .where(ragnarok_title_skills: { skill_id: skill.id }, suffix: suffix, prefix: prefix)
      return nil if title_skills.blank?

      hash = title_skills.group(:id).maximum(:point)
      value = hash.values.max
      id = hash.key(value)

      Ragnarok::TitleSkill.find(id)
    end
  end
end

