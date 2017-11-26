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

    @skill = Ragnarok::Skill.find_by(name: params[:additional_skill_name])
    @result = sort_by_skill(units, @skill).slice(0...30)
  end

  def sort_by_skill(units, skill)
    units.map do |unit|
      title_skills = unit.best_title_skills(skill_name: skill&.name)
      item_skills = unit.best_item_skills(skill_name: skill&.name, limit_rank: 13)

      skills = unit.passive_skills
      skills += unit.leader_skills
      skills += title_skills if title_skills.present?
      skills += item_skills if item_skills.present?

      sum_skills = []
      skills.pluck(:skill_id, :point).each do |skill_id, point|
        sum_skills[skill_id] = point unless sum_skills[skill_id]
        sum_skills[skill_id] += point
      end

      [
        unit,
        title_skills,
        item_skills,
        sum_skills,
      ]
    end.sort { |a, b| b[3][skill.id] <=> a[3][skill.id] }
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

