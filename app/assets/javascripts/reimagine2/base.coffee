class Reimagine2
  constructor: ->
    if !$('html').hasClass('lt-ie9')
      $(document).foundation()

@Reimagine2 = Reimagine2
