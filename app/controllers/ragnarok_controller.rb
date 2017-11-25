class RagnarokController < ApplicationController
  def index
  end

  def search
    @tribe_name = params[:tribe_name]
    if @tribe_name.present?
      tribe_ids = Ragnarok::Unit.where_like_tribe(@tribe_name).pluck(:id)
    end

    @skill_name = params[:skill_name]
    if @skill_name.present?
      skill = Ragnarok::Skill.find_by(name: @skill_name)
      skill_ids = Ragnarok::PassiveSkill.where(skill: skill).pluck(:unit_id)
      skill_ids += Ragnarok::LeaderSkill.where(skill: skill).pluck(:unit_id)
    end

    unit_ids = tribe_ids & skill_ids
    units = Ragnarok::Unit.where(id: unit_ids)

    @data = [
      units,
      units.map {|unit| unit.best_title_skills(skill_name: skill.name) },
    ].transpose.slice(0...30)
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

