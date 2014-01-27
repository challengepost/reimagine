require 'acceptance/acceptance_helper'

feature 'reimagine2/export' do
  scenario 'exports reimagine2 variables' do
    visit '/assets/import_exports.css'
    save_and_open_page
    page.text.should include 'body.colored_with_error_color { color: #ed2918; }'
  end
end

