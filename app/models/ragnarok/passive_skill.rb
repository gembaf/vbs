module Ragnarok
  class PassiveSkill < ApplicationRecord
    belongs_to :unit
    belongs_to :skill

    def name
      skill.name
    end
  end
end

