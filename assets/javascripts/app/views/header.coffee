class @HeaderView extends Backbone.View
  tagName: 'header'
  template: JST["app/templates/header"]

  events:
    'click .logo'     : 'openResorts'
    'click .settings' : 'toggleSettings'

  initialize: ->
    @settings = @options.settings
    @settings.bind 'change', @render
    
    
  render: =>
    $(@el).empty()
    $(@el).append @template settings: @settings.toJSON()
    return this


  openResorts:  (event) => 
    event.preventDefault()
    @settings.set open: false
    App.navigate "resorts", true


  toggleSettings: (event) => 
    event.preventDefault()
    
    if @settings.get 'open'
      @settings.set open: false
      App.navigate "resorts", true
    else
      @settings.set open: true
      App.navigate "settings", true