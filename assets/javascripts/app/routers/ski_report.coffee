class @SkiReport extends Backbone.Router
  routes: 
    ''         : 'resorts'
    'resorts'  : 'resorts'    
    'settings' : 'settings'

  initialize: ->
    @resorts      = new Resorts
    @states       = new States
    @myResorts    = new MyResorts
    @settings     = new Settings      
  
    # Reset the states and resorts instances
    # with the JSON we output right on the page
    @states.reset(window.states_json)
    @resorts.reset(window.resorts_json)
    
    # Check each resort to see if it is in myResorts
    # If it is then set a flag on the resort (flag used for filtering)
    @resorts.each (resort) =>
      if @myResorts.includes resort.get('id')
        resort.set in_my_resorts: true
      
    # Boot up all the views we'll need
    @headerView   = new HeaderView settings: @settings
    @footerView   = new FooterView
    @mainView     = new MainView    
    @resortsView  = new ResortsView collection: @resorts
    @settingsView = new SettingsView settings: @settings, states: @states, resorts: @resorts, myResorts: @myResorts

    # Slap em on the body
    $('body').append @headerView.render().el
    $('body').append @mainView.render().el    
    $('body').append @footerView.render().el    


  resorts: =>
    $(@mainView.el).empty()
    $(@mainView.el).append @resortsView.render().el

    
  settings: =>
    $(@mainView.el).empty()
    $(@mainView.el).append @settingsView.render().el

  