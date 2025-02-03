# Addresses the impossibility to reach the dropdown menus in
# the global nav bar with the keyboard (using tab)
@Reimagine2.accessibleGlobalNav = ->
  $dropDown = $('nav.top-bar .has-dropdown')

  $dropDown.on 'focus', 'a', (e) ->
    $currentDropdown = $(e.currentTarget).closest('.has-dropdown')
    # Foundation4's top-bar styles support the class
    # hover to open the menu
    $currentDropdown.addClass('hover')

  $dropDown.on 'blur', 'a', (e) ->
    $currentDropdown = $(e.currentTarget).closest('.has-dropdown')
    # need to delay this until after the new element has been focused
    setTimeout( ->
      # if the newly focused element is not inside the dropdown
      if $(':focus').parents().filter($currentDropdown).length == 0
        # hide the menu
        $currentDropdown.removeClass('hover')
    , 15)
