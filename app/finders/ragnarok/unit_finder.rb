module Ragnarok
  class UnitFinder
    def self.find_units(name:, profession:, tribe:, protection:, skill:)
      each_ids = []

      each_ids << [Ragnarok::Unit.find_by(name: name).id] if name.present?
      each_ids << Ragnarok::Unit.where(profession: profession).pluck(:id) if profession.present?
      each_ids << by_tribe(tribe) if tribe.present?
      each_ids << by_protection(protection) if protection.present?
      each_ids << by_skill(skill) if skill.present?

      unit_ids = Ragnarok::Unit.pluck(:id)
      each_ids.each { |ids| unit_ids &= ids }
      Ragnarok::Unit.where(id: unit_ids)
    end

    def self.by_tribe(name)
      Ragnarok::Unit.where_like('tribe', name).pluck(:id)
    end

    def self.by_protection(name)
      Ragnarok::Unit.where_like('protection', name).pluck(:id)
    end

    def self.by_skill(names)
      each_ids = Ragnarok::Unit.pluck(:id)

      names.split.each do |name|
        skill = Ragnarok::Skill.find_by(name: name)

        ids = Ragnarok::PassiveSkill.where(skill: skill).pluck(:unit_id)
        ids += Ragnarok::LeaderSkill.where(skill: skill).pluck(:unit_id)

        each_ids &= ids
      end

      each_ids
    end
  end
end

