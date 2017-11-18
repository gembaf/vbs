module Tasks
  class RagnarokImportTask
    def self.execute
      data = Ragnarok::MedallionParseService.new.call
      data.each do |medallion, titles|
        Ragnarok::Medallion.create(medallion)
      end
    end
  end
end

