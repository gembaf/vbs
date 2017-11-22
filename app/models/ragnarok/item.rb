# == Schema Information
#
# Table name: ragnarok_items
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  type         :string(255)      not null
#  rare         :integer          not null
#  attack       :integer          default(0), not null
#  defense      :integer          default(0), not null
#  speed        :integer          default(0), not null
#  intelligence :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

module Ragnarok
  class Item < ApplicationRecord
  end
end

