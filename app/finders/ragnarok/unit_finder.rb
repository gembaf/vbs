module Ragnarok
  class UnitFinder
    def self.find_units(name:, profession:, tribe:, protection:, skill:, allow_leader:)
      each_ids = []

      each_ids << [Ragnarok::Unit.find_by(name: name)&.id] if name.present?
      each_ids << Ragnarok::Unit.where(profession: profession).pluck(:id) if profession.present?
      each_ids << by_tribe(tribe) if tribe.present?
      each_ids << by_protection(protection) if protection.present?
      each_ids << by_skill(skill, allow_leader) if skill.present?

      unit_ids = Ragnarok::Unit.pluck(:id)
      each_ids.each { |ids| unit_ids &= ids }

      if unit_ids == Ragnarok::Unit.pluck(:id)
        []
      else
        Ragnarok::Unit.includes_all.where(id: unit_ids)
      end
    end

    def self.by_tribe(name)
      Ragnarok::Unit.where_like('tribe', name).pluck(:id)
    end

    def self.by_protection(name)
      Ragnarok::Unit.where_like('protection', name).pluck(:id)
    end

    def self.by_skill(names, allow_leader)
      each_ids = Ragnarok::Unit.pluck(:id)

      names.split.each do |name|
        skill = Ragnarok::Skill.find_by(name: name)

        ids = Ragnarok::PassiveSkill.where(skill: skill).pluck(:unit_id)
        ids += Ragnarok::LeaderSkill.where(skill: skill).pluck(:unit_id) if allow_leader

        each_ids &= ids
      end

      each_ids
    end
  end
end

