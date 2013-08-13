require 'acceptance/acceptance_helper'

feature 'Assets' do
  scenario 'it serves reimagine.css' do
    visit '/assets/reimagine.css'

    page.text.should include '.large-12'
  end

  scenario 'it prioritizes the main app overrides file over the dummy one in the engine' do
    visit '/assets/reimagine.css'

    page.text.should include 'color: #bada55'
  end

  scenario 'it servers reimagine.js' do
    visit '/assets/reimagine.js'

    page.text.should include 'var Reimagine;'
  end
end
