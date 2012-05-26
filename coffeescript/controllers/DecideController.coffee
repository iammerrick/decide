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
      @model = new Question
        _id: @options.id

      @model.fetch()
        .then =>
          @loaded()

    loaded: ->
      @optionsController = new OptionsController
        model: @model
      @render()

    render: =>
      @html CurrentDecisionView()
      @append @optionsController.render()
