require 'rails'
require "reimagine/rails/version"

module Reimagine
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Reimagine::Rails

      initializer :assets do |config|
        ::Rails.application.config.assets.precompile += %w(
          reimagine.css
          reimagine/typography.css
          reimagine/buttons.css
        )
      end
    end
  end
end
