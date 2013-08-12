module Reimagine
  class Engine < ::Rails::Engine
    initializer 'reimagine.register_engine' do
      require 'zurb-foundation'
    end
  end
end
