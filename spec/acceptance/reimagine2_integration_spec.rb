require 'acceptance/acceptance_helper'

feature 'Assets' do
  scenario 'it serves reimagine2.css' do
    visit '/assets/reimagine2.css'

    page.text.should include '.large-12'
  end

  scenario 'it includes ie overrides' do
    visit '/assets/reimagine2.css'

    page.text.should include '.lt-ie9 .large-12'
  end

  scenario 'it prioritizes the main app overrides file over the dummy one in the engine' do
    visit '/assets/reimagine2.css'

    page.text.should include 'color: #bada55'
  end

  scenario 'it serves reimagine2.js' do
    visit '/assets/reimagine2.js'

    page.text.should include 'var Reimagine2;'
    page.text.should include 'Foundation.libs.forms'
  end

end
