module Tasks
  module Ragnarok
    class MedallionImportTask
      def self.execute
        data = ::Ragnarok::MedallionParseService.new.call
        new.import_all(data)
      end

      def import_all(data)
        data.each do |medallion, titles|
          import_medallion(medallion)
          titles.each { |title| import_title(title) }
        end
      end

      def import_medallion(params)
        ::Ragnarok::Medallion.create(params)
      end

      def import_title(params)
        skill_name = params.delete(:skill_name)
        skill_point = params.delete(:skill_point)

        skill = ::Ragnarok::Skill.create(name: skill_name, point: skill_point)
        params[:skill_id] = skill.id
        ::Ragnarok::Title.create(params)
      end
    end
  end
end

