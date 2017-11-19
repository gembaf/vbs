# == Schema Information
#
# Table name: ragnarok_skills
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  point      :integer
#  title_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Ragnarok
  class Skill < ApplicationRecord
    def self.create_with_valid(params)
      return nil if params[:name].blank?
      create!(params)
    end
  end
end

