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
      title_skill.point.zero? ? title_skill.name.to_s : "#{title_skill.name} : #{title_skill.point}"
    end
  end
end

