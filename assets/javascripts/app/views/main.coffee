class @MainView extends Backbone.View
  tagName: 'section'
  id: 'main'

  render: ->
    $(@el).empty()
    return this