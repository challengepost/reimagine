require "addressable/uri"

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

    def secure_new_user_session_url(options = {})
      original_url = Addressable::URI.parse(request.original_url)
      original_url.host = Figleaf::Settings.domain.root
      options.reverse_merge!(return_to: original_url.to_s)
      "#{Reimagine2.configuration.new_user_session_url}?#{options.to_query}"
    end

    def secure_new_user_registration_url(options = {})
      original_url = Addressable::URI.parse(request.original_url)
      original_url.host = Figleaf::Settings.domain.root
      # letting know from where you're coming from at sign-up/in
      original_utms = (original_url.query_values || {}).slice("ref_content", "ref_medium", "ref_feature")
      options.reverse_merge!(return_to: original_url.to_s).reverse_merge!(original_utms)
      "#{Reimagine2.configuration.new_user_registration_url}?#{options.to_query}"
    end

    def user_path(user)
      "/#{user.screen_name}"
    end

    def destroy_user_session_url
      Reimagine2.configuration.destroy_user_session_url
    end

    def external_url(url, params = {})
      uri = Addressable::URI.parse(url)
      uri.query_values = params
      uri.to_s
    end

    def user_url(user)
      build_url({
        host: Figleaf::Settings.domain.root,
        path: user_path(user)
      })
    end

    def activity_feed_url
      build_url({
        host: Figleaf::Settings.domain.root,
        path: "/feed"
      })
    end

    def user_settings_url(path = "")
      build_url({
        host: Figleaf::Settings.domain.root,
        path: "/settings/#{path}"
      })
    end

    def register_url
      build_url({
        host: Figleaf::Settings.domain.secure,
        path: "/users/register",
        query: { "flow[name]" => "create_team" }.to_query
      })
    end

    def info_devpost_url(path)
      build_url({
        host: Figleaf::Settings.domain.info,
        path: path
      })
    end

    def build_url(options)
      builder = Figleaf::Settings.ssl.enabled? ? URI::HTTPS : URI::HTTP
      builder.build(options).to_s
    end
  end
end
