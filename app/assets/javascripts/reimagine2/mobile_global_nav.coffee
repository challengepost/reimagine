@Reimagine2.mobileGlobalNav = ->
  # $(".toggle-topbar").on()
  $(document).on "click.fndtn.topbar", (e) ->
    menuId = $(e.target).closest(".toggle-topbar").data("targetMenu")
    $("[data-topbar]").find("[data-top-nav-menu]").hide().filter("[data-top-nav-menu='#{menuId}']").show()
