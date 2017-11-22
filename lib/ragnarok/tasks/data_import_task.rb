module Ragnarok
  module Tasks
    class DataImportTask
      def self.execute
        import_medallion
      end

      def self.import_medallion
        data = MedallionParseService.new.call

        data.each do |medallion_params, titles_params|
          medallion = Medallion.create(medallion_params)
          titles_params.each do |params|
            params[:medallion_id] = medallion.id
            Title.create_with_skill(params)
          end
        end
      end
    end
  end
end

