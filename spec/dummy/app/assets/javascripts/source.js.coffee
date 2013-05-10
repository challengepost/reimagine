class window.DoSomething
  constructor: ->
    @links = $ '.source-container a'
    @setup()

  setup: =>
    @links.each (i, el) =>
      $el = $(el)

      $el.on "click", (el) =>
        @toggleActive($ el.target)

      $el.on "mouseover", (el) =>
        @surroundIt($ el.target)

      $el.on "mouseout", (el) =>
        @removeIt($ el.target)

  toggleActive: ($el) =>
    $container =  $el.parents(".source-container")
    $container.find(".highlight").slideToggle()

  surroundIt: ($el) =>
    $el.parents(".stylesheet").css
      border: "2px dashed red"

  removeIt: ($el) =>
    $el.parents(".stylesheet").css
      border: "none"


$ ->
  new DoSomething()
