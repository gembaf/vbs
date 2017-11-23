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
    has_many :title_skills
    has_many :titles, through: :title_skills

    has_many :item_skills
    has_many :items, through: :item_skills

    has_many :passive_skills
    has_many :passives, through: :passive_skills

    has_many :leader_skills
    has_many :leaders, through: :leader_skills

    def self.find_or_create!(params)
      skill = find_by(name: params[:name])
      return skill if skill.present?
      create!(params)
    end
  end
end

