require 'acceptance/acceptance_helper'

feature 'shared views' do
  scenario 'twelve_columns yields a .row > .large-12' do
    visit '/large_12'

    page.should have_css '.row > .large-12.columns', text: 'twelve columns'
  end
end
