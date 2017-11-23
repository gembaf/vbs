class RagnarokController < ApplicationController
  def index
  end

  def medallions
    @medallions = Ragnarok::Medallion.includes(titles: { title_skill: :skill }).all
  end

  def items
    @items = Ragnarok::Item.all
    @types = Ragnarok::Item.pluck(:type).uniq
  end
end

