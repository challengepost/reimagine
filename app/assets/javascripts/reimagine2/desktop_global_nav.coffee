@Reimagine2.desktopGlobalNav = ->
  desktopSearchContainer = $('#desktop-search-form-container')

  $('[data-toggle-desktop-search]').on 'click', (e) ->
    desktopSearchContainer.toggleClass('hide')

    if !desktopSearchContainer.hasClass('hide')
      desktopSearchContainer.find('#search').focus()
