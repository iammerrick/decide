define [
  'controllers/Controller'
  'collections/OptionsCollection'
  'views/OptionItemView'
], (Controller, OptionsCollection, OptionItemView) ->

  class OptionItemController extends Controller

    className: 'option'

    tagName: 'li'

    events:
      'click .veto' : 'veto'

    initialize: ->
      @model.on "change:#{@model.vetoesKey}", @render

    render: =>
      @html OptionItemView @model.toJSON()
      this

    veto: ->
      @model.veto()

  class OptionsController extends Controller

    className: 'options list'

    tagName: 'ul'

    initialize: ->
      @render()

    render: ->
      @$el.empty()
      @append '<h2>What are my options?</h2>'
      @collection.each (option) =>
        @append new OptionItemController(model: option).render()
      this