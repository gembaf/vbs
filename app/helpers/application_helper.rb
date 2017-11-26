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
end

