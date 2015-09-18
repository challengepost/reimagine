module Reimagine2
  module UrlHelper

    def default_reimagine_url_options
      {
        scheme: 'http',
        path: '/'
      }
    end

    def reimagine_url(opts = {})
      URI::HTTP.build(default_reimagine_url_options.merge(opts)).to_s
    end

    def reimagine_root_url(opts = {})
      reimagine_url(opts.merge(host: Reimagine2.configuration.root_host))
    end

    def reimagine_post_url(opts = {})
      reimagine_url(opts.merge(host: Reimagine2.configuration.post_host))
    end
  end
end
