class @FooterView extends Backbone.View
  tagName: 'footer'
  template: JST["app/templates/footer"]

  render: =>
    $(@el).append @template
    return this
