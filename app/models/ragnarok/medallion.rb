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
  end
end

