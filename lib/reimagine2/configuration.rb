module Reimagine2
  class Configuration
    attr_accessor :root_host, :post_host, :help_host

    def root_host
      @root_host || 'devpost.com'
    end

    def post_host
      @post_host || 'post.devpost.com'
    end

    def help_host
      @help_host || 'help.devpost.com'
    end

  end
end
