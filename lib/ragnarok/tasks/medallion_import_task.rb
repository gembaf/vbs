module Ragnarok
  module Tasks
    class MedallionImportTask
      def self.execute
        data = MedallionParseService.new.call
        new.import_all(data)
      end

      def import_all(data)
        data.each do |medallion, titles|
          Medallion.create(medallion)
          titles.each { |title| Title.create_with_skill(title) }
        end
      end
    end
  end
end

