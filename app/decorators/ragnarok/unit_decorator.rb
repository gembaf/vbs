module Ragnarok
  module UnitDecorator
    include SkillDecorator

    def item_text
      item1 + '<br />' + item2
    end

    def passive_skill_texts
      passive_skills.each_slice(2).map do |s1, s2|
        <<-TEXT.strip_heredoc
          <div class="row">
            <div class="col-md-6">#{skill_text(s1)}</div>
            <div class="col-md-6">#{skill_text(s2)}</div>
          </div>
        TEXT
      end.join
    end

    def leader_skill_texts
      leader_skills.map { |s| skill_text(s) }.join('<br />')
    end
  end
end

