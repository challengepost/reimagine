# Addresses the impossibility to reach the dropdown menus in
# the global nav bar with the keyboard (using tab)
@Reimagine2.accessibleGlobalNav = ->
  $dropDown = $('#global-nav-user-dropdown')

  $dropDown.on 'focus', 'a', ->
    # Foundation4's top-bar styles support the class
    # hover to open the menu
    $dropDown.addClass('hover')

  $dropDown.on 'blur', 'a', ->
    # need to delay this until after the new element has been focused
    setTimeout( ->
      # if the newly focused element is not inside the dropdown
      if $(':focus').closest('#global-nav-user-dropdown').length == 0
        # hide the menu
        $dropDown.removeClass('hover')
    , 15)
