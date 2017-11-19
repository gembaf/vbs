module Ragnarok
  class Skill < ApplicationRecord
    def self.create_with_valid(params)
      return nil if params[:name].blank?
      create!(params)
    end
  end
end

