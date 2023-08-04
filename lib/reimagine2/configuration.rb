module Reimagine2
  class Configuration
    attr_accessor :root_host,
      :secure_root_host,
      :post_host,
      :help_host,
      :new_user_session_url,
      :new_user_registration_url,
      :destroy_user_session_url,
      :ssl_enabled

    def root_host
      @root_host || 'devpost.com'
    end

    def secure_root_host
      @secure_root_host || ["secure", root_host].join(".")
    end

    def post_host
      @post_host || 'info.devpost.com/'
    end

    def help_host
      @help_host || 'help.devpost.com'
    end

    def new_user_session_url
      @new_user_session_url || uri_class.build(host: secure_root_host, path: "/users/login").to_s
    end

    def new_user_registration_url
      @new_user_registration_url || uri_class.build(host: secure_root_host, path: "/users/register").to_s
    end

    def destroy_user_session_url
      @destroy_user_session_url || uri_class.build(host: secure_root_host, path: "/users/logout").to_s
    end

    private

    def uri_class
      ssl_enabled ? URI::HTTPS : URI::HTTP
    end
  end
end
