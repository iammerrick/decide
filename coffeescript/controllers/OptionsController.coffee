define [
  'controllers/Controller'
  'collections/OptionsCollection'
  'views/OptionItemView'
  'views/NewOptionView'
], (Controller, OptionsCollection, OptionItemView, NewOptionView) ->

  ###
  # New option controller
  ###
  class NewOptionController extends Controller
    events:
      'click .js-add-option' : 'addOption'

    elements:
      'input[type=text]' : 'option'

    addOption: ->
      @trigger 'add', @option.val()

    render: =>
      @html NewOptionView()
      this

  ###
  # Option items
  ###
  class OptionItemController extends Controller

    className: 'option'

    tagName: 'li'

    events:
      'click .veto' : 'veto'

    initialize: ->
      @model.get('vetoes').on 'add remove', @render

    render: =>
      vetoes = @model.get 'vetoes'
      vetoLength = if vetoes.length isnt 0 then vetoes.length else 0

      @html OptionItemView _.extend @model.toJSON(), { vetoLength }
      this

    veto: ->
      @model.veto()
      @trigger 'veto'

  ###
  # Options Controller
  ###
  class OptionsController extends Controller

    className: 'options list'

    tagName: 'ul'

    elements:
      '.options': '$options'

    initialize: ->
      @model.set 'options', new OptionsCollection(@model.get 'options')
      @collection = @model.get 'options'
      @collection.on 'add', @renderOptions
      @createNewOptions()

    createNewOptions: ->
      @newOptionController = new NewOptionController
      @newOptionController.on 'add', @addOption

    addOption: (option) =>
      @model.addOption option
      @model.save()

    renderOptions: =>
      @$options.empty()
      @collection.each (option) =>
        option = new OptionItemController model: option
        option.on 'veto', =>
          @model.save()
        @$options.append option.render().el

    render: =>
      @html(
        """
          <h2>What are my options?</h2>
          <div class="options"></div>
        """
      )
      @renderOptions()
      @append @newOptionController.render()
