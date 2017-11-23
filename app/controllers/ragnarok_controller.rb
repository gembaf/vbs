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

  def units
    @units = Ragnarok::Unit.includes_all.all
    @types = Ragnarok::Unit.pluck(:type).uniq
  end
end

