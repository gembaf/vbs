# == Schema Information
#
# Table name: ragnarok_title_skills
#
#  id         :integer          not null, primary key
#  title_id   :integer          not null
#  skill_id   :integer          not null
#  point      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Ragnarok
  class TitleSkill < ApplicationRecord
    belongs_to :title
    belongs_to :skill
  end
end

