module Reimagine2
  module ExternalAssetsHelper
    extend self

    def fontawesome_javascript_include_params
      'https://kit.fontawesome.com/0c13a9f144.js'
    end

    def fontawesome_javascript_include_tag
      return if Rails.env.test?
      javascript_include_tag(fontawesome_stylesheet_link_params, crossorigin: 'anonymous')
    end
  end
end
