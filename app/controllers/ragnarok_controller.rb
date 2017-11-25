class RagnarokController < ApplicationController
  def index
  end

  def search
    finder = Ragnarok::UnitFinder.new
    each_ids = []

    @tribe_name = params[:tribe_name]
    each_ids << finder.by_tribe(@tribe_name) if @tribe_name.present?

    @protection_name = params[:protection_name]
    each_ids << finder.by_protection(@protection_name) if @protection_name.present?

    @profession_name = params[:profession_name]
    each_ids << Ragnarok::Unit.where(profession: @profession_name).pluck(:id) if @profession_name.present?

    @skill_name = params[:skill_name]
    each_ids << finder.by_skill(@skill_name) if @skill_name.present?

    unit_ids = Ragnarok::Unit.pluck(:id)
    each_ids.each { |ids| unit_ids &= ids }

    units = Ragnarok::Unit.where(id: unit_ids).limit(30)
    @data = [
      units,
      units.map {|unit| unit.best_title_skills(skill_name: @skill_name.split.first) },
    ].transpose
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

