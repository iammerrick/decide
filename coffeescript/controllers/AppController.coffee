define [
  'controllers/Controller'
], (Controller) ->
  class AppController extends Controller

    className: 'app-container'

    present: (el) ->
      @html()
      @current.hide?() if @current
      @append(el)
      el.show?()
      @current = el
