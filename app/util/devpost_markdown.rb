class DevpostMarkdown < Redcarpet::Render::HTML
  RENDERER_OPTIONS = {
    safe_links_only: true,
    with_toc_data: true,
    hard_wrap: true,
    prettify: true
  }.freeze

  MARKDOWN_OPTIONS = {
    no_intra_emphasis: true,
    fenced_code_blocks: true,
    autolink: true,
    disable_indented_code_blocks: true,
    strikethrough: true,
    lax_spacing: true,
    superscript: true,
    footnotes: true
  }.freeze

  def self.render(text)
    markdown.render(text)
  end

  def self.markdown
    @_markdown ||= Redcarpet::Markdown.new(self.new, MARKDOWN_OPTIONS)
  end

  def initialize
    super(RENDERER_OPTIONS)
  end

  # The image method is not actually overriding any parent method so in order to get
  # default rendering behavior we need to have a default markdown renderer.
  def default_markdown
    @_default_markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(RENDERER_OPTIONS), MARKDOWN_OPTIONS)
  end

  def default_render(text)
    default_markdown.render(text)
  end

  def image(link, title = "", alt_text = "")
    markdown_string = "![#{alt_text}](#{link} #{title})"
    if MarkdownVideos::Services::ServiceBase.subclasses.any? { |service| service.regexp.match link }
      MarkdownVideos.render(markdown_string)
    else
      default_render(markdown_string)
    end
  end

  def raw_html(raw_html)
    CGI::escapeHTML(raw_html)
  end

  def block_html(raw_html)
    CGI::escapeHTML(raw_html)
  end
end
