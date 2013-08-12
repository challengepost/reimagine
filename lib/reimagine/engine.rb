module Reimagine
  class Engine < ::Rails::Engine
    initializer 'reimagine.register_engine' do
      require 'sass-rails'
      require 'compass-rails'
      require 'zurb-foundation'
    end
  end
end
