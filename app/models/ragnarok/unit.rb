module Ragnarok
  class Unit < ApplicationRecord
    RANK = { S: 6, A: 5, B: 4, C: 3, D: 2, E: 1 }.freeze

    enum rank: RANK

    has_many :passive_skills
    has_many :leader_skills

    scope :includes_all, -> { includes(passive_skills: :skill, leader_skills: :skill) }

    def best_title_skills(skill_name:, through_limit: false)
      range = Ragnarok::Medallion.reality_range(rank, through_limit)

      id1 = Ragnarok::Title.best_title_skill(skill_name: skill_name, reality_range: range, prefix: true)
      id2 = Ragnarok::Title.best_title_skill(skill_name: skill_name, reality_range: range, suffix: true)

      Ragnarok::TitleSkill.where(title_id: [id1, id2])
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

