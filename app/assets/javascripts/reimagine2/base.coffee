class Reimagine2
  constructor: ->
    @configure()

    unless $('html').hasClass('lt-ie9')
      $(document).foundation()

  configure: ->
    if Modernizr?.touch
      # disable custom select on touch devices
      # https://github.com/zurb/foundation/issues/2090#issuecomment-23055697
      $('form.custom select').attr('data-customforms', 'disabled')

@Reimagine2 = Reimagine2
