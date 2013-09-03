class AccessibleCustomDrowpDownBuilder
  constructor: (@$wrapper) ->
    @build()

  build: ->
    @init()
    @bind()
    @ready()

  init: ->
    @$select = @$wrapper.find('select')
    @$label = @$wrapper.find('.accessible-dropdown-label')
    @$value = @$label.find('.accessible-dropdown-value')

    @changedLabel()

  bind: ->
    @$select.on 'change keyup', @changedLabel
    @$select.on 'focusin', @highlightWrapper
    @$select.on 'focusout', @lowlightWrapper

  highlightWrapper: =>
    @$wrapper.addClass('focus')

  lowlightWrapper: =>
    @$wrapper.removeClass('focus')

  changedLabel: =>
    labelText = @$select.find(":selected").text()
    @$value.text(labelText)

  ready: ->
    @$select.addClass('transparent accessible-dropdown-ready')

    @$label.addClass('custom dropdown initialized')
    @$label.removeClass('hide')

class AccessibleCustomDropdown
  @setup: ->
    $('.accessible-dropdown:not(.initialized)').each ->
      new AccessibleCustomDrowpDownBuilder($(@))

@Reimagine2.AccessibleCustomDropdown = AccessibleCustomDropdown
