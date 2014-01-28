class ApplicationController < ActionController::Base
  protect_from_forgery

  if !!ENV['BUILDING_STYLEGUIDE']
    after_filter do |c|
      c.cache_page(nil, nil, Zlib::BEST_COMPRESSION)
    end
  end
end
