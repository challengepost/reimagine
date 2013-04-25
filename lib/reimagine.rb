require "reimagine/version"

module Reimagine
  class Engine < ::Rails::Engine
    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w(
        reimagine.css
        reimagine/base.css
        reimagine/layout.css
        reimagine/modules.css
      )
    end
  end
end
