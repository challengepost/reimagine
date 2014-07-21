module Reimagine2
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def copy_initializer
        template "reimagine2.rb", "config/initializers/reimagine2.rb"
      end
    end
  end
end
