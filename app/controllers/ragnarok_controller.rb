class RagnarokController < ApplicationController
  def index
  end

  def search
    units = Ragnarok::UnitFinder.find_units(
      name: params[:unit_name],
      profession: params[:profession_name],
      tribe: params[:tribe_name],
      protection: params[:protection_name],
      skill: params[:skill_name],
    )

    @data = units.map do |unit|
      if params[:title_skill_name].present?
        title_skills = unit.best_title_skills(skill_name: params[:title_skill_name])
      end
      item_skills = unit.best_item_skills(skill_name: params[:title_skill_name], limit_rank: 13)

      [
        unit,
        title_skills ? title_skills : [nil, nil],
        item_skills ? item_skills : [nil, nil],
      ]
    end
  end

  def medallions
    @medallions = Ragnarok::Medallion.includes_all.all
  end

  def items
    @types = Ragnarok::Item.pluck(:type).uniq
    @type = params[:type] ? params[:type] : @types.first

    @items = Ragnarok::Item.includes_all.where(type: @type)
  end

  def units
    @types = Ragnarok::Unit.pluck(:type).uniq
    @type = params[:type] ? params[:type] : @types.first

    @units = Ragnarok::Unit.includes_all.where(type: @type)
  end
end

