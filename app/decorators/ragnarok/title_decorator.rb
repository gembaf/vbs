module Ragnarok
  module TitleDecorator
    def prefix_text
      prefix ? '●' : ''
    end

    def suffix_text
      suffix ? '●' : ''
    end

    def skill_text
      return '' if title_skill.blank?
      title_skill.point == 0 ? "#{title_skill.name}" : "#{title_skill.name} : #{title_skill.point}"
    end
  end
end

