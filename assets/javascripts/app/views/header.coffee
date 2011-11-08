class @HeaderView extends Backbone.View
  tagName: 'header'
  template: JST["app/templates/header"]

  events:
    'click .logo'     : 'openResorts'
    'click .settings' : 'openSettings'

  render: =>
    $(@el).append @template
    return this

  openResorts:  (event) => 
    event.preventDefault()
    App.navigate "resorts", true

  openSettings: (event) => 
    event.preventDefault()
    App.navigate "settings", true