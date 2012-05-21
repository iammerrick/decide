define ['models/Model', 'jquery', 'use!underscore'], (Model, $, _) ->
  class Question extends Model

    idAttribute: '_id'

    urlRoot: '/question'
