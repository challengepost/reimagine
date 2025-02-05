@Reimagine2.mobileGlobalNav = ->
  $mobileSearchContainer = $("#mobile-search-form-container")

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
      $mobileSearchContainer.find("#search").focus()

  $accordionTabs = $("[data-accordion-tab]")
  $accordionTabs.on "click", (e) =>
    e.preventDefault()

    $tab = $(e.currentTarget)
    $tab.toggleClass('expanded')

    targetId = $tab.attr('href').substring(1)

    $targetSection = $("[data-accordion-section='#{targetId}']")
    $targetSection.slideToggle()

    # closes other tabs that could be opened
    console.log("close")
    $accordionTabs.not($tab).removeClass('expanded')
    $('[data-accordion-section').not($targetSection).slideUp();
