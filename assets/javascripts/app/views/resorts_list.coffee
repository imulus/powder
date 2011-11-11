class @ResortsListView extends Backbone.View
  tagName: 'ul'

  initialize: ->
    @settings = @options.settings
    @collection.bind 'reset', @render
    @settings.bind 'change', @render

  render: =>
    $(@el).empty()

    # Filter the list of resorts down by the current selected state
    filter_key = @settings.get('states_resorts_filter')
    @collection.each (resort) =>
      if filter_key is 'all' or resort.get('state').filter_key is filter_key
        @appendResort resort

    return this

  appendResort: (resort) =>
    item = new ResortsListItemView model: resort, myResorts: @options.myResorts
    $(@el).append item.render().el
