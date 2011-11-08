class @SettingsView extends Backbone.View
  tagName: 'div'
  id: 'settings'
  template: JST["app/templates/settings"]

  events:
    'click .done' : 'openResorts'

  initialize: ->
    @settings = new Settings

    @statesListView = new StatesListView  
      collection: @options.states
      resorts:    @options.resorts
      settings:   @settings
      
    @resortsListView  = new ResortsListView 
      collection: @options.resorts
      myResorts:  @options.myResorts
      settings:   @settings

  render: =>
    $(@el).empty()
    $(@el).append @template
    @settings.set states_resorts_filter: 'all'
    $('#states', @el).append @statesListView.render().el
    $('#state-resorts', @el).append @resortsListView.render().el
    return this

  openResorts:  (event) =>
    event.preventDefault()
    App.navigate "resorts", true
