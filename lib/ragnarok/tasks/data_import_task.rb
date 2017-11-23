module Ragnarok
  module Tasks
    class DataImportTask
      def self.execute
        import_medallion
        import_item
        import_unit
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

      def self.import_item
        data = ItemParseService.new.call

        data.each do |type, items_params|
          items_params.each do |params|
            params[:type] = type
            Item.create_with_skill(params)
          end
        end
      end

      def self.import_unit
        data = UnitParseService.new.call

        data.each do |params|
          item1, item2 = params.delete(:equipments).split(',')
          params[:item1] = item1
          params[:item2] = item2

          Unit.create_with_skill(params)
        end
      end
    end
  end
end

