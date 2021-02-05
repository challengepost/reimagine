@Reimagine2.mobileGlobalNav = ->
  $mobileSearchContainer = $("#mobile-search-container")

  $(document).on "click.fndtn.topbar", '.top-bar .toggle-topbar, [data-topbar] .toggle-topbar', (e) ->
    e.preventDefault()

    $toggle = $(e.target).closest(".toggle-topbar")
    $topBar = $toggle.closest(".top-bar")
    menuId = $toggle.data("targetMenu")

    lastOpenedMenu = $topBar.data("lastOpenedMenu")

    # records which menu was last interacted with
    $topBar.data("lastOpenedMenu", menuId)

    # By default, when MENU A is open, clicking on TOGGLE B would
    # remove the `expanded` class, hiding MENU B in the process.
    # This forces the top bar to stay expanded in this case to reveal menu B.
    if (!$topBar.is(".expanded") && lastOpenedMenu != undefined && lastOpenedMenu != menuId)
      $topBar.addClass("expanded")

    # Shows the right menu depending on which toggle was clicked.
    $("[data-topbar]").find("[data-top-nav-menu]").hide().
      filter("[data-top-nav-menu='#{menuId}']").show()

  $("[data-toggle-mobile-search]").on "click", (e) ->
    $mobileSearchContainer.toggleClass("hide")

    if !$mobileSearchContainer.hasClass("hide")
      $mobileSearchContainer.find("#challenge-search").focus()
