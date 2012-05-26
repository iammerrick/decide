define [
  'controllers/Controller'
  'views/NewQuestionView'
  'models/Question'
], (Controller, NewQuestionView, Question) ->
  class NewQuestionController extends Controller

    className: 'new-question'

    attributes:
      'style' : 'display: none;'

    events:
      'click input[type=submit]' : 'create'

    elements:
      '.js-question' : 'question'

    initialize: ->
      @append NewQuestionView()
      @model = new Question
      @render()
      super()

    create: ->
      @model.set(
        name: @question.val()
      )
        .save()
        .then (res) =>
          @model.set '_id', res.id
          @viewQuestion(@model)

    viewQuestion: ->
      @options.router.navigate @model.get('_id'), trigger: true, replace: true

    hide: ->
      @$el.fadeOut()
      this

    show: ->
      @$el.fadeIn()
      this
