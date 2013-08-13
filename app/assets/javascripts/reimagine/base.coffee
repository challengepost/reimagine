class Reimagine
  constructor: ->
    if !$('html').hasClass('lt-ie9')
      $(document).foundation()

@Reimagine = Reimagine
