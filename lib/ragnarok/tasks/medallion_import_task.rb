module Ragnarok
  module Tasks
    class MedallionImportTask
      def self.execute
        data = Ragnarok::MedallionParseService.new.call
        new.import_all(data)
      end

      def import_all(data)
        data.each do |medallion, titles|
          import_medallion(medallion)
          titles.each { |title| import_title(title) }
        end
      end

      def import_medallion(params)
        Ragnarok::Medallion.create(params)
      end

      def import_title(params)
        skill_name = params.delete(:skill_name)
        skill_point = params.delete(:skill_point)

        title = Ragnarok::Title.create(params)
        return if skill_name.blank?
        Ragnarok::Skill.create(name: skill_name, point: skill_point, title: title)
      end
    end
  end
end

