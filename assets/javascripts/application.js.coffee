#= require_tree ./vendor/jquery
#= require_tree ./vendor/jquery/plugins
#= require_tree ./vendor/underscore
#= require_tree ./vendor/backbone
#= require_tree ./lib/extensions
#= require_tree ./lib/utils
#= require_tree ./app/config
#= require_tree ./app/models
#= require_tree ./app/collections
#= require_tree ./app/templates
#= require_tree ./app/views
#= require_tree ./app/routers



$ ->
  window.App = new SkiReport
  Backbone.history.start()

