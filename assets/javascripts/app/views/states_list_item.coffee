class @StatesListItemView extends Backbone.View
  tagName: 'li'

  events:
    'click' : 'filterResorts'

  initialize: ->
    @settings = @options.settings
    @model.bind     'change', @render
    @settings.bind  'change', @activateFilteredState


  render: =>
    $(@el).empty()
    $(@el).append @model.get('name')
    return this

  filterResorts: =>
    @settings.set states_resorts_filter: @model.get('filter_key')

  activateFilteredState: =>
    if @model.get('filter_key') is @settings.get('states_resorts_filter')
      $(@el).addClass('active')
    else
      $(@el).removeClass('active')

