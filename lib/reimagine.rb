require "reimagine/version"

module Reimagine
  class Engine < ::Rails::Engine
    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w(
        reimagine.css
        reimagine/typography.css
        reimagine/buttons.css
      )
    end
  end
end
