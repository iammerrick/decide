define ['use!underscore', 'models/Model', 'collections/VetoCollection'], (_, Model, VetoCollection) ->
  class Option extends Model
    defaults:
      name: 'Unknown'
      vetoes: []

    initialize: ->
      @set 'vetoes', new VetoCollection @get 'vetoes'
      super()

    veto: ->
      @get('vetoes').push
        who: 'awesome-dude'
        date: Date.now()
      this
