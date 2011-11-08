class @StatesListView extends Backbone.View
  tagName: 'ul'

  initialize: ->
    @collection.bind 'reset', @render

  render: =>
    $(@el).empty()
    @collection.each (state) => 
      @appendState state
    return this

  appendState: (state) =>
    item = new StatesListItemView 
      model: state
      settings: @options.settings
      
    $(@el).append item.render().el
