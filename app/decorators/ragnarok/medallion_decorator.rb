module Ragnarok
  module MedallionDecorator
    def caption
      "#{short_name_text} #{name} #{reality_text} / #{resource_text} / #{cost_text}"
    end

    def short_name_text
      "【#{short_name}】"
    end

    def reality_text
      "レアリティ : #{reality}"
    end

    def resource_text
      "必要生成資源 : #{resource}"
    end

    def cost_text
      "称号付与武勲 : #{cost}"
    end
  end
end

