module Ragnarok
  module TitleDecorator
    include SkillDecorator

    def prefix_text
      prefix ? '●' : ''
    end

    def suffix_text
      suffix ? '●' : ''
    end
  end
end

