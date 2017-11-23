class RagnarokController < ApplicationController
  def index
  end

  def search
    skill = Ragnarok::Skill.find_by(name: params[:skill_name])
    unit_ids = Ragnarok::PassiveSkill.where(skill: skill).pluck(:unit_id)
    unit_ids += Ragnarok::LeaderSkill.where(skill: skill).pluck(:unit_id)
    @units = Ragnarok::Unit.includes_all.where(id: unit_ids)
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

