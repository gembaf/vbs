module Ragnarok
  class UnitFinder
    def tribe(name)
      Ragnarok::Unit.where_like_tribe(name).pluck(:id)
    end

  end
end

