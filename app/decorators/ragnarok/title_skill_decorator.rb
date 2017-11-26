module Ragnarok
  module TitleSkillDecorator
    include SkillDecorator

    def rich_skill_text(caption)
      medallion = title.medallion

      <<-EOS.strip_heredoc
        <b>#{caption}: #{medallion.short_name_text}#{title.name}</b>
        <br />
        #{skill_text(self)}
      EOS
    end
  end
end

