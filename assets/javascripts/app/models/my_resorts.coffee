class @MyResorts extends Backbone.Model
  
  defaults:
    resort_ids: [ 'e4e3e4275e6f6e672b878ec6e1075e97', '5a94e40978b4ef2340efdbc6630f75bc',
                  '34bf39c911afc091a4c5dda9b0f722a9', 'd2aa08c6de9713c61ebb928ccc79e22b',
                  '81162dea1f2d2617b446572a6a1fe5e6', '3e7bdd8d496d00f13fd7cfdd6b6022b0',
                  'c890c6863ff97a86ceaabb1f691eb571' ]

  initialize: ->
    do @fetch

  includes: (id) -> 
    id in @get('resort_ids')    

  add: (id) ->
    unless @includes id
      current_ids = @get('resort_ids')
      current_ids.push(id)
      @set resort_ids: current_ids
      do @save

  remove: (id) ->
    if @includes id
      ids = @get('resort_ids').filter (resort_id) -> 
        resort_id isnt id      
      @set resort_ids: ids
      do @save

  fetch: ->
    if localStorage?
      ls = localStorage.getItem('resorts')
      @set JSON.parse(ls) if ls?

  save: ->
    if localStorage?
      ls = localStorage.setItem('resorts', JSON.stringify(@toJSON()))
  
  
    