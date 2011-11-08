class @ResortView extends Backbone.View
  tagName: 'div'
  className: 'resort'
  template: JST["app/templates/resort"]

  initialize: ->
    @model.bind 'change', @render

  render: =>
    $(@el).empty()
    $(@el).append @template resort: @model.toJSON()
    return this