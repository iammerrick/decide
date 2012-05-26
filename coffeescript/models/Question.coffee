define ['models/Model', 'jquery', 'use!underscore', 'collections/OptionsCollection'], (Model, $, _, OptionsCollection) ->
  class Question extends Model

    idAttribute: '_id'

    urlRoot: '/question'

    defaults:
      'options' : []
      'name' : 'Unknown'

    addOption: (option) =>
      @get('options').add
        name: option
      this

    toJSON: ->
      attrs = _.clone @attributes
      return _.pick attrs, 'name', 'options'
