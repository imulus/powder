class @ResortsListItemView extends Backbone.View
  tagName: 'li'
  template: JST["app/templates/resorts_list_item"]

  events:
    'click .add'    : 'addResort'
    'click .remove' : 'removeResort'

  initialize: ->
    @myResorts = @options.myResorts
    @model.bind 'change', @render

  render: =>
    $(@el).empty()
    $(@el).append @template resort: @model.toJSON()
    return this

  addResort: (event) =>
    event.preventDefault()
    @model.set in_my_resorts: true
    @myResorts.add @model.get('id')

  removeResort: (event) =>
    event.preventDefault()
    @model.set in_my_resorts: false
    @myResorts.remove @model.get('id')
