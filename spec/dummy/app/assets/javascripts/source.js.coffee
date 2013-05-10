class window.DoSomething
  constructor: ->
    @links = $ '.source-container a'
    @setup()

  setup: =>
    @links.each (i, el) =>
      $(el).on "click", (el) =>
        @toggleActive(el)

  toggleActive: (el) =>
    $container =  $(el.target).parents(".source-container")
    $container.find(".highlight").slideToggle("slow")

$ ->
  new DoSomething()
