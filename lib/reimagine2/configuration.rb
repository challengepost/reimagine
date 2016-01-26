module Reimagine2
  class Configuration
    attr_accessor :root_host,
      :secure_root_host,
      :post_host,
      :help_host,
      :new_user_session_url,
      :new_user_registration_url

    def root_host
      @root_host || 'devpost.com'
    end

    def secure_root_host
      @secure_root_host || ["secure", root_host].join(".")
    end

    def post_host
      @post_host || 'post.devpost.com'
    end

    def help_host
      @help_host || 'help.devpost.com'
    end

    def new_user_session_url
      @new_user_session_url || URI::HTTPS.build(host: secure_root_host, path: "/users/login")
    end

    def new_user_registration_url
      @new_user_session_url || URI::HTTPS.build(host: secure_root_host, path: "/users/register")
    end
  end
end
