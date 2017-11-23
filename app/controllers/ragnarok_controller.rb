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
    @types = Ragnarok::Unit.pluck(:type).uniq
    @type = params[:type] ? params[:type] : @types.first

    @units = Ragnarok::Unit.includes_all.where(type: @type)
  end
end

