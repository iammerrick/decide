define [
  'controllers/Controller'
  'views/CurrentDecisionView'
  'controllers/OptionsController'
  'collections/OptionsCollection'
  'models/Question'
], (Controller, CurrentDecisionView, OptionsController, OptionsCollection, Question) ->
  class DecideController extends Controller

    className: 'decide'

    initialize: ->
      super()
      @model = new Question
        slug: @options.slug

      @model.on "change", @render
      @model.fetch()

    render: =>
      @html CurrentDecisionView()
      @options = new OptionsController
        collection: new OptionsCollection @model.get 'options'
      @append @options