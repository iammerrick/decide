require.config
  paths:
    'jquery': 'vendor/jquery-1.7.2'
    'backbone': 'vendor/backbone'
    'underscore': 'vendor/underscore'
    'handlebars': 'vendor/handlebars-1.0.0.beta.6'
    'moment' : 'vendor/moment'
    'text': 'vendor/require.text'
    'i18n': 'vendor/i18n'
    'use': 'vendor/use'
  use:
    'underscore':
      attach: '_'

    'backbone':
      deps: ['use!underscore', 'jquery']
      attach: (_, $) ->
        Backbone

    'vendor/keymaster':
      attach: 'key'

    'handlebars':
      attach: 'Handlebars'

require [
  'jquery'
  'use!backbone'
  'controllers/NewQuestionController'
  'controllers/AppController'
  'controllers/DecideController'
], ($, Backbone, NewQuestionController, AppController, DecideController) ->

  ##
  # Create new master controller and append it to the DOM.
  ##
  app = new AppController
  $(document.body).append(app.el)

  ##
  # Create the master router
  ##
  AppRouter = Backbone.Router.extend(
    routes:
      '' : 'index'
      ':question' : 'view'

    index: ->
      app.present(new NewQuestionController(
        router: this
      ))

    view: (question) ->
      app.present(new DecideController(
        router: this
        slug: question
      ))
  )

  new AppRouter()

  ##
  # Start that url action
  ##
  Backbone.history.start()
