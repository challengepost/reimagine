require 'acceptance/acceptance_helper'

feature 'Assets' do
  scenario 'it serves reimagine.css' do
    visit '/assets/reimagine.css'

    page.text.should include '.large-12'
  end

  scenario 'it servers reimagine.js' do
    visit '/assets/reimagine.js'

    page.text.should include 'Reimagine = {}'
  end
end
