class @SkiReport extends Backbone.Router
  routes: 
    ''         : 'resorts'
    'resorts'  : 'resorts'    
    'settings' : 'settings'

  initialize: ->
    @resorts      = new Resorts
    @states       = new States
    @myResorts    = new MyResorts

    @states.reset(window.states_json)
    @resorts.reset(window.resorts_json)
    
    my_resorts_ids = @myResorts.get('resort_ids')
    
    @resorts.each (resort) ->
      if resort.get('id') in my_resorts_ids
        resort.set in_my_resorts: true
      
    @headerView   = new HeaderView
    @footerView   = new FooterView
    @mainView     = new MainView    
    @resortsView  = new ResortsView collection: @resorts
    @settingsView = new SettingsView states: @states, resorts: @resorts, myResorts: @myResorts

    $('body').append @headerView.render().el
    $('body').append @mainView.render().el    
    $('body').append @footerView.render().el    

  
  resorts: =>
    $(@mainView.render().el).append @resortsView.render().el

    
  settings: =>
    $(@mainView.render().el).append @settingsView.render().el

  