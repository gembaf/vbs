class RagnarokController < ApplicationController
  def index
  end

  def medallions
    @medallions = Ragnarok::Medallion.includes_all.all
  end

  def items
    @items = Ragnarok::Item.includes_all.all
    @types = Ragnarok::Item.pluck(:type).uniq
  end
end

