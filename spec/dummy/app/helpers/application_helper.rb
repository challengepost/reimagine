module ApplicationHelper

  def stylesheet_section(title)
    source = capture { yield }
    content_tag :section, class: "stylesheet" do
      concat title_and_source title, source
      concat source
    end
  end

  def title_and_source(title, source)
    content_tag(:div, class: "source-container") do
      concat title_and_link title
      concat Pygments.highlight(source).html_safe
    end
  end

  def title_and_link(title)
    content_tag :p do
      concat title
      concat content_tag(:a, "show source", class: "toggle-source").html_safe
    end
  end

end
