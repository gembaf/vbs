module Ragnarok
  class UnitFinder
    def tribe(name)
      Ragnarok::Unit.where_like('tribe', name).pluck(:id)
    end

    def protection(name)
      Ragnarok::Unit.where_like('protection', name).pluck(:id)
    end
  end
end

