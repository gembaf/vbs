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
        Skill.find_or_create!(name: skill_name, title: title, title_skill_attributes: { point: skill_point })
      end
    end
  end
end

