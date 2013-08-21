class Reimagine2
  constructor: ->
    unless $('html').hasClass('lt-ie9')
      console.log 'init'
      $(document).foundation()

@Reimagine2 = Reimagine2
