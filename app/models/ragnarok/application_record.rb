module Ragnarok
  class ApplicationRecord < ::ApplicationRecord
    self.abstract_class = true
    self.table_name_prefix = 'ragnarok_'
  end
end

