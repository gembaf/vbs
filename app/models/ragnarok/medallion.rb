# == Schema Information
#
# Table name: ragnarok_medallions
#
#  id         :integer          not null, primary key
#  short_name :string(255)      not null
#  name       :string(255)      not null
#  reality    :integer          not null
#  resource   :integer          not null
#  cost       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Ragnarok
  class Medallion < ApplicationRecord
    has_many :titles

    scope :includes_all, -> { includes(titles: { title_skill: :skill }) }

    def self.reality_range(rank, through_limit)
      limit_reality = Ragnarok::Unit::RANK[rank.to_sym]

      if through_limit
        limit_reality += 1 if rank == 'S'
        limit_reality += 1
      end

      1..limit_reality
    end
  end
end

