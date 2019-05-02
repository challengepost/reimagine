class Reimagine2
  constructor: ->
    unless $('html').hasClass('lt-ie9')
      $(document).foundation()
      Reimagine2.responsiveTables()
      Reimagine2.accessibleGlobalNav()
      Reimagine2.mobileGlobalNav()

@Reimagine2 = Reimagine2
