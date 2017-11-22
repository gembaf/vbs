# == Schema Information
#
# Table name: ragnarok_item_skills
#
#  id         :integer          not null, primary key
#  item_id    :integer          not null
#  skill_id   :integer          not null
#  point      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Ragnarok
  class ItemSkill < ApplicationRecord
    belongs_to :item
    belongs_to :skill

    def name
      skill.name
    end
  end
end

