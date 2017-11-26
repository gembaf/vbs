module ApplicationHelper
  def strong_sanitize(original, word)
    original.gsub!(word, "<font color=\"red\">#{word}</font>") if word

    sanitize(
      original,
      tags: %w(div font b br),
      attributes: %w(class color)
    )
  end

  def strong_sanitize_with_names(original, word, names)
    if names
      names.each do |name|
        original.gsub!(name, "<font color=\"blue\">#{name}</font>")
      end
    end

    strong_sanitize(original, word)
  end

  def skill_text(name, point)
    return '' if name.blank?
    point.zero? ? name.to_s : "#{name} : #{point}"
  end

  def display_skills(skills)
    skills.each_slice(2).map do |s1, s2|
      <<-TEXT.strip_heredoc
        <div class="row">
          <div class="col-md-6">#{skill_text(s1.first, s1.last)}</div>
          <div class="col-md-6">#{skill_text(s2&.first, s2&.last)}</div>
        </div>
      TEXT
    end.join
  end
end

