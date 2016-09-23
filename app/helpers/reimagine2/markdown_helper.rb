module MarkdownHelper
  def markdown_render(text)
    text ||= ""
    DevpostMarkdown.render(text).html_safe
  end

  def markdown_reference_link
    link_to "Markdown", "https://daringfireball.net/projects/markdown/", target: "_blank"
  end
end
