define ['models/Model', 'jquery', 'use!underscore'], (Model, $, _) ->
  class Question extends Model

    idAttribute: '_id'

    url: () ->
      "/api/decide/_design/question/_view/slug?key=\"#{@get 'slug'}\""

    parse: (response) ->
      response.rows[0]['value']

    save: () ->
      $.ajax
        url: '/api/decide/'
        type: 'POST'
        data: JSON.stringify(@toJSON())
        contentType: 'application/json'

    slugify: ->
      text = @get 'name'
      text = text.replace /[^-a-zA-Z0-9,&\s]+/ig, ''
      text = text.replace /-/gi, '_'
      text = text.replace /\s/gi, '-'
      @set 'slug', text.toLowerCase()
