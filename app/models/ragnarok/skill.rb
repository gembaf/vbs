module Ragnarok
  class Skill < ApplicationRecord
    def self.find_or_create(name:, point:)
      return new if name.blank?

      point = nil if point == 0
      skill = find_by(name: name, point: point)
      skill ? skill : create(name: name, point: point)
    end
  end
end

