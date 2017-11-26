module Ragnarok
  class Unit < ApplicationRecord
    RANK = { S: 6, A: 5, B: 4, C: 3, D: 2, E: 1 }.freeze

    enum rank: RANK

    has_many :passive_skills
    has_many :leader_skills

    scope :includes_all, -> { includes(passive_skills: :skill, leader_skills: :skill) }

    def best_title_skills(skill_name:, through_limit: false)
      @title_skills ||= {}
      return @title_skills[rank] if @title_skills[rank]

      range = Ragnarok::Medallion.reality_range(rank, through_limit)
      id1 = Ragnarok::Title.best_title_skill(skill_name: skill_name, reality_range: range, prefix: true)
      id2 = Ragnarok::Title.best_title_skill(skill_name: skill_name, reality_range: range, suffix: true)

      @title_skills[rank] = Ragnarok::TitleSkill.includes({ title: :medallion }, :skill).where(title_id: [id1, id2])
    end

    def best_item_skills(skill_name:, limit_rank: 14)
      id1 = Ragnarok::Item.best_item_skill(item_type: item1, skill_name: skill_name, limit_rank: limit_rank)
      id2 = Ragnarok::Item.best_item_skill(item_type: item2, skill_name: skill_name, limit_rank: limit_rank)

      Ragnarok::ItemSkill.includes(:skill).where(item_id: [id1, id2])
    end

    def self.where_like(column, name)
      names = name.split('')
      query = names.map { |n| "#{column} like '%#{n}%'" }.join(' AND ')
      where(query)
    end

    def self.create_with_skill(params)
      passive_skills = params.delete(:passive_skills)
      leader_skills = params.delete(:leader_skills)
      params[:rank] = RANK[params[:rank].to_sym]

      create!(params).tap do |unit|
        passive_skills.each do |param|
          next if param[:name].blank?
          skill = Skill.find_or_create!(name: param[:name])
          PassiveSkill.create!(point: param[:point], unit: unit, skill: skill)
        end

        leader_skills.each do |param|
          next if param[:name].blank?
          skill = Skill.find_or_create!(name: param[:name])
          LeaderSkill.create!(point: param[:point], unit: unit, skill: skill)
        end
      end
    end
  end
end

