module Reimagine2
  module ExternalAssetsHelper
    def fontawesome_stylesheet_link_tag
      return if Rails.env.test?

      stylesheet_link_tag(
        'https://use.fontawesome.com/releases/v5.8.1/css/all.css',
        {
          integrity: 'sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf',
          crossorigin: 'anonymous'
        }
      )
    end
  end
end


