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

    def self.best_title_skill(skill_name:, reality_range:, prefix: false, suffix: false)
      skill = Ragnarok::Skill.find_by(name: skill_name)
      return nil if skill.nil?

      title_skills = includes(:medallion, title_skill: :skill)
                     .where(ragnarok_title_skills: { skill_id: skill.id })
                     .where(ragnarok_medallions: { reality: reality_range })
                     .where(suffix: suffix, prefix: prefix)
      return nil if title_skills.blank?

      hash = title_skills.group(:id).maximum(:point)
      value = hash.values.max
      hash.key(value)
    end
  end
end

