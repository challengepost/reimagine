module ApplicationHelper

  def stylesheet_section(title)
    source = capture { yield }
    concat title_for title
    concat source
    concat source_as_source source
    "<hr/>".html_safe
  end

  def title_for(title)
    content_tag(:div, class: %w(row light)) do
      content_tag(:div, class: %w(container)) do
        content_tag(:h3, "#{title}:")
      end
    end
  end

  def source_as_source(source)
    content_tag(:div, class: "source-container") do
      concat content_tag(:a, "<div>show source</div>".html_safe, class: "toggle-source")
      concat Pygments.highlight(source).html_safe
    end
  end

end
