class RagnarokController < ApplicationController
  def index
  end

  def search
    finder = Ragnarok::UnitFinder.new
    each_ids = []

    @tribe_name = params[:tribe_name]
    each_ids << finder.tribe(@tribe_name) if @tribe_name.present?

    @protection_name = params[:protection_name]
    each_ids << finder.protection(@protection_name) if @protection_name.present?

    @skill_name = params[:skill_name]
    if @skill_name.present?
      skill = Ragnarok::Skill.find_by(name: @skill_name)
      skill_ids = Ragnarok::PassiveSkill.where(skill: skill).pluck(:unit_id)
      skill_ids += Ragnarok::LeaderSkill.where(skill: skill).pluck(:unit_id)
    end

    unit_ids = Ragnarok::Unit.pluck(:id)
    each_ids.each do |ids|
      unit_ids &= ids
    end

    units = Ragnarok::Unit.where(id: unit_ids).limit(30)

    @data = [
      units,
      units.map {|unit| unit.best_title_skills(skill_name: skill.name) },
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

