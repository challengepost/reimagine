module Reimagine2
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../../../app/views', __FILE__)

      def copy_directory
        directory "reimagine2", "app/views/reimagine2"
      end
    end
  end
end
