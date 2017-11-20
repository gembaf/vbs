# == Schema Information
#
# Table name: ragnarok_skills
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Ragnarok
  class Skill < ApplicationRecord
    has_one :title_skill
    has_one :title, through: :title_skill
    accepts_nested_attributes_for :title_skill, allow_destroy: true

    def self.find_or_create!(params)
      skill = find_by(name: params[:name])
      return skill if skill.present?
      create!(params)
    end

    def point
      title_skill.point
    end
  end
end

