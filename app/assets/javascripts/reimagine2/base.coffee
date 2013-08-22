class Reimagine2
  constructor: ->
    unless $('html').hasClass('lt-ie9')
      $(document).foundation()

@Reimagine2 = Reimagine2
