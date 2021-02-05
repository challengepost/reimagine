module Reimagine2
  module UrlHelper

    def default_reimagine_url_options
      { host: Reimagine2.configuration.root_host }
    end

    def reimagine_url(opts = {})
      URI::HTTPS.build(default_reimagine_url_options.merge(opts)).to_s
    end

    def reimagine_root_url(opts = {})
      reimagine_url(opts)
    end

    def reimagine_post_url(opts = {})
      reimagine_url(opts.merge(host: Reimagine2.configuration.post_host))
    end

    def post_subdomain?
      request.subdomains.first == "post"
    end
      
    def platform_url(**args)
      URI::HTTPS.build(**args.merge({ host: current_env_host })).to_s
    end

    private

    def current_env_host
      hosts = {
        development: "devpost.dev",
        staging: "staging.devpost.com",
        test: "lvh.me",
        production: "devpost.com"
      }

      environment = Rails.env.to_sym

      return hosts[environment]
    end

  end
end
