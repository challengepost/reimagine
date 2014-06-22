require 'reimagine2/engine'
require 'reimagine2/configuration'

module Reimagine2
  extend self

  def configuration
    @configuration || configure
  end

  def configure
    @configuration = Configuration.new
    yield(@configuration) if block_given?
    @configuration
  end
end
