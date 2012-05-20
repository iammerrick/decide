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
      'question' : '.js-question'

    initialize: ->
      @append NewQuestionView()
      @model = new Question
      @render()
      super()

    create: ->
      @model.set(
        name: @question.val()
      )
        .slugify()
        .save()
        .then =>
          @viewQuestion(@model)

    viewQuestion: ->
      @options.router.navigate @model.get('slug'), trigger: true, replace: true

    hide: ->
      @$el.fadeOut()
      this

    show: ->
      @$el.fadeIn()
      this
