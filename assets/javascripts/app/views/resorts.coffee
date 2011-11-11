class @ResortsView extends Backbone.View
  tagName: 'div'
  id: 'resorts'

  initialize: ->
    @collection.bind 'reset', @render

  render: =>
    $(@el).empty()
    
    # We only want to render out resorts that are in MyResorts
    @collection.each (resort) =>
      @appendResort resort if resort.get('in_my_resorts')

    return this

  appendResort: (resort) =>
    item = new ResortView model: resort
    $(@el).append item.render().el



