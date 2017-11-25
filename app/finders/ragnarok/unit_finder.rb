module Ragnarok
  class UnitFinder
    def by_tribe(name)
      Ragnarok::Unit.where_like('tribe', name).pluck(:id)
    end

    def by_protection(name)
      Ragnarok::Unit.where_like('protection', name).pluck(:id)
    end

    def by_skill(name)
      skill = Ragnarok::Skill.find_by(name: name)

      ids = Ragnarok::PassiveSkill.where(skill: skill).pluck(:unit_id)
      ids += Ragnarok::LeaderSkill.where(skill: skill).pluck(:unit_id)
      ids
    end
  end
end

