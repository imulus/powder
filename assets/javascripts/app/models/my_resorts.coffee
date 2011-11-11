class @MyResorts extends Backbone.Model
  
  defaults:
    # resort_ids is an array of ids of resorts that the user is tracking
    # it is used as a list to check all resorts against when filtering
    resort_ids: [ 'e4e3e4275e6f6e672b878ec6e1075e97', '5a94e40978b4ef2340efdbc6630f75bc',
                  '34bf39c911afc091a4c5dda9b0f722a9', 'd2aa08c6de9713c61ebb928ccc79e22b',
                  '81162dea1f2d2617b446572a6a1fe5e6', '3e7bdd8d496d00f13fd7cfdd6b6022b0',
                  'c890c6863ff97a86ceaabb1f691eb571' ]

  
  initialize: ->
    # Populate itself from localStorage right away
    do @fetch
  
  
  # Check if a resort id is in the resort_ids array
  # Accepts a resort id as param, returns boolean
  includes: (resort_id) -> 
    resort_id in @get('resort_ids')    


  # Add a resort id to the resort_ids array
  # Save self (model) to localStorage once done 
  add: (resort_id) ->
    unless @includes resort_id
      current_ids = @get('resort_ids')
      current_ids.push(resort_id)
      @set resort_ids: current_ids
      do @save


  # Remove a resort id from the resort_ids array
  # Save self (model) to localStorage once done 
  remove: (resort_id) ->
    if @includes resort_id
      ids = @get('resort_ids').filter (id) -> 
        id isnt resort_id      
      @set resort_ids: ids
      do @save


  # Retrieve self from localStorage
  # If exists, set all model properties
  fetch: ->
    if localStorage?
      ls = localStorage.getItem('resorts')
      @set JSON.parse(ls) if ls?


  # Persist self to localStorage
  save: ->
    if localStorage?
      ls = localStorage.setItem('resorts', JSON.stringify(@toJSON()))
  
  
    