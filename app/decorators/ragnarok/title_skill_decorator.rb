module Ragnarok
  module TitleSkillDecorator
    include SkillDecorator

    def rich_skill_text_prefix
      rich_skill_text('接頭')
    end

    def rich_skill_text_suffix
      rich_skill_text('接尾')
    end

    def rich_skill_text(caption)
      medallion = title.medallion

      <<-TEXT.strip_heredoc
        <b>#{caption}: #{medallion.short_name_text}#{title.name}</b>
        <br />
        #{skill_text(self)}
      TEXT
    end
  end
end

