class RagnarokController < ApplicationController
  def index
  end

  def medallions
    @medallions = Ragnarok::Medallion.all
  end

  def items
    @items = Ragnarok::Item.all
    @types = Ragnarok::Item.pluck(:type).uniq
  end
end

